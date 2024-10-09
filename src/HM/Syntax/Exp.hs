{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

module HM.Syntax.Exp where

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
import HM.Syntax.Pattern

-- $setup
-- >>> :set -XOverloadedStrings
-- >>> :set -XDataKinds
-- >>> import qualified Control.Monad.Foil as Foil
-- >>> import Control.Monad.Free.Foil
-- >>> import Data.String (fromString)

-- * Generated code (expressions)

-- ** Signature

mkSignature ''Raw.Exp ''Raw.Ident ''Raw.ScopedExp ''Raw.Pattern
deriveZipMatch ''ExpSig
deriveBifunctor ''ExpSig
deriveBifoldable ''ExpSig
deriveBitraversable ''ExpSig

-- ** Pattern synonyms

mkPatternSynonyms ''ExpSig

{-# COMPLETE Var, ETrue, EFalse, ENat, EAdd, ESub, EIf, EIsZero, ETyped, ELet, EAbs, EApp, EFor, ETAbs, ETApp #-}

-- ** Conversion helpers

mkConvertToFreeFoil ''Raw.Exp ''Raw.Ident ''Raw.ScopedExp ''Raw.Pattern
mkConvertFromFreeFoil ''Raw.Exp ''Raw.Ident ''Raw.ScopedExp ''Raw.Pattern

-- * User-defined code

type Exp n = AST FoilPattern ExpSig n

-- ** Conversion helpers (expressions)

-- | Convert 'Raw.Exp' into a scope-safe expression.
-- This is a special case of 'convertToAST'.
toExp :: (Foil.Distinct n) => Foil.Scope n -> Map Raw.Ident (Foil.Name n) -> Raw.Exp -> AST FoilPattern ExpSig n
toExp = convertToAST convertToExpSig toFoilPattern getExpFromScopedExp

-- | Convert 'Raw.Exp' into a closed scope-safe expression.
-- This is a special case of 'toExp'.
toExpClosed :: Raw.Exp -> Exp Foil.VoidS
toExpClosed = toExp Foil.emptyScope Map.empty

-- | Convert a scope-safe representation back into 'Raw.Exp'.
-- This is a special case of 'convertFromAST'.
--
-- 'Raw.VarIdent' names are generated based on the raw identifiers in the underlying foil representation.
--
-- This function does not recover location information for variables, patterns, or scoped terms.
fromExp :: Exp n -> Raw.Exp
fromExp =
  convertFromAST
    convertFromExpSig
    Raw.EVar
    fromFoilPattern
    Raw.ScopedExp
    (\n -> Raw.Ident ("x" ++ show n))

-- | Parse scope-safe terms via raw representation.
--
-- >>> fromString "let x = 2 + 2 in let y = x - 1 in let x = 3 in y + x + y" :: Exp Foil.VoidS
-- let x0 = 2 + 2 in let x1 = x0 - 1 in let x2 = 3 in x1 + x2 + x1
instance IsString (Exp Foil.VoidS) where
  fromString input = case Raw.pExp (Raw.myLexer input) of
    Left err -> error ("could not parse expression: " <> input <> "\n  " <> err)
    Right term -> toExpClosed term

-- | Pretty-print scope-safe terms via"λ" Ident ":" Type "." Exp1 raw representation.
instance Show (Exp n) where
  show = Raw.printTree . fromExp
