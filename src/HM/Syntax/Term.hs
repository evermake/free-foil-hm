{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

module HM.Syntax.Term where

import qualified Control.Monad.Foil as Foil
import Control.Monad.Free.Foil
import Control.Monad.Free.Foil.TH
import Data.Bifunctor.TH
import Data.Map (Map)
import qualified Data.Map as Map
import Data.String (IsString (..))
import qualified HM.Parser.Abs as Raw
import qualified HM.Parser.Par as Raw
import qualified HM.Parser.Print as Raw
import HM.Syntax.Pattern hiding (getPatternBinder)

-- $setup
-- >>> :set -XOverloadedStrings
-- >>> :set -XDataKinds
-- >>> import qualified Control.Monad.Foil as Foil
-- >>> import Control.Monad.Free.Foil
-- >>> import Data.String (fromString)

-- * Generated code (terms)

-- ** Signature

mkSignature ''Raw.Term ''Raw.Ident ''Raw.ScopedTerm ''Raw.Pattern
deriveZipMatch ''TermSig
deriveBifunctor ''TermSig
deriveBifoldable ''TermSig
deriveBitraversable ''TermSig

-- ** Pattern synonyms

-- mkPatternSynonyms ''TermSig

-- {-# COMPLETE Var, ETAbs, EAbs #-}

-- ** Conversion helpers

mkConvertToFreeFoil ''Raw.Term ''Raw.Ident ''Raw.ScopedTerm ''Raw.Pattern
mkConvertFromFreeFoil ''Raw.Term ''Raw.Ident ''Raw.ScopedTerm ''Raw.Pattern

-- * User-defined code

-- type Term n = AST FoilPattern TermSig n
-- type Term' = Term Foil.VoidS

data Term n where 
  EVar 
    :: NameBinder s n {- var -}
    -> Term n
  ETrue :: Term n 
  EFalse :: Term n
  ENat :: Term n 
  EAdd :: Term n -> Term n -> Term n
  ESub :: Term n -> Term n -> Term n

  EIf
    :: Term n {- condition -}
    -> Term n {- if cond true -}
    -> Term n {- if cond false -}
    -> Term n

  EIsZero :: Term n -> Term n 

  ETyped 
    :: Term n {- expression -}
    -> Term n {- type -}
    -> Term n 

  ELet 
    :: NameBinder n l {- var -}
    -> Term n {- value -}
    -> Term l {- body -}
    -> Term n

  EAbs 
    :: NameBinder n l {- var -}
    -> Term n {- type -}
    -> Term l {- body -}
    -> Term n 

  ETAbs 
    :: NameBinder n l {- type var -}
    -> Term l {- body -}
    -> Term n

  ETApp 
    :: Term n {- forall -}
    -> Term n {- type -}
    -> Term n

  EFor 
    :: NameBinder n l {- iterator -}
    -> Term n {- value from -}
    -> Term n {- value to -} 
    -> Term l {- body -}
    -> Term n

  TUVar 
    :: NameBinder s n 
    -> Term n
  TVar 
    :: NameBinder s n 
    -> Term n

  TNat :: Term n 
  TBool :: Term n 

  TArrow 
    :: NameBinder n l {- parameter -}
    -> Term l {- body -}
    -> Term n

  TForAll 
    :: NameBinder n l {- type parameter -}
    -> Term l {- body -}
    -> Term n

-- ** Conversion helpers (terms)

-- | Convert 'Raw.Term' into a scope-safe term.
-- This is a special case of 'convertToAST'.
toTerm :: Map Raw.Ident (Foil.Name n) -> Raw.Term -> AST FoilPattern TermSig n
toTerm = convertToAST convertToTermSig toFoilPattern getTermFromScopedTerm

-- | Convert 'Raw.Term' into a closed scope-safe term.
-- This is a special case of 'toTerm'.
toTermClosed :: Raw.Term -> Term Foil.VoidS
toTermClosed = toTerm Foil.emptyScope Map.empty

-- | Convert a scope-safe representation back into 'Raw.Term'.
-- This is a special case of 'convertFromAST'.
--
-- 'Raw.VarIdent' names are generated based on the raw identifiers in the underlying foil representation.
--
-- This function does not recover location information for variables, patterns, or scoped terms.
fromTerm :: Term n -> Raw.Term
fromTerm =
  convertFromAST
    convertFromTermSig
    (\_ -> error "location missing")
    fromFoilPattern
    Raw.ScopedTerm
    (\_ -> error "location missing")

-- | Parse scope-safe terms via raw representation.
--
-- >>> fromString "let x = 2 + 2 in let y = x - 1 in let x = 3 in y + x + y" :: Term Foil.VoidS
-- let x0 = 2 + 2 in let x1 = x0 - 1 in let x2 = 3 in x1 + x2 + x1
instance IsString (Term Foil.VoidS) where
  fromString input = case Raw.pTerm (Raw.myLexer input) of
    Left err -> error ("could not parse term: " <> input <> "\n  " <> err)
    Right term -> toTermClosed term

-- | Pretty-print scope-safe terms via"λ" Ident ":" Type "." Term1 raw representation.
instance Show (Term n) where
  show = Raw.printTree . fromTerm

-- | Determine if given Term is a type or not 
isType :: Term n -> Bool
isType (TUVar _) = True 
isType (TVar _) = True 
isType (TNat) = True 
isType (TBool) = True 
isType (TArrow _ _) = True 
isType (TFOrALl _ _) = True 
isType _ = False
