{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

module HM.Syntax where

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

{-# COMPLETE Var, ETrue, EFalse, ENat, EAdd, ESub, EIf, EIsZero, ETyped, ELet, EAbs, EApp, EFor #-}

-- ** Conversion helpers

mkConvertToFreeFoil ''Raw.Exp ''Raw.Ident ''Raw.ScopedExp ''Raw.Pattern
mkConvertFromFreeFoil ''Raw.Exp ''Raw.Ident ''Raw.ScopedExp ''Raw.Pattern

-- * Generated code (types)

-- ** Signature

mkSignature ''Raw.Type ''Raw.Ident ''Raw.ScopedType ''Raw.TypePattern
deriveZipMatch ''TypeSig
deriveBifunctor ''TypeSig
deriveBifoldable ''TypeSig
deriveBitraversable ''TypeSig

-- ** Pattern synonyms

mkPatternSynonyms ''TypeSig

{-# COMPLETE Var, TUVar, TNat, TBool, TArrow #-}

-- ** Conversion helpers

mkConvertToFreeFoil ''Raw.Type ''Raw.Ident ''Raw.ScopedType ''Raw.TypePattern
mkConvertFromFreeFoil ''Raw.Type ''Raw.Ident ''Raw.ScopedType ''Raw.TypePattern

-- * User-defined code

type Exp n = AST ExpSig n

type Type n = AST TypeSig n

type Type' = Type Foil.VoidS

-- ** Conversion helpers (expressions)

-- | Convert 'Raw.Exp' into a scope-safe expression.
-- This is a special case of 'convertToAST'.
toExp :: (Foil.Distinct n) => Foil.Scope n -> Map Raw.Ident (Foil.Name n) -> Raw.Exp -> AST ExpSig n
toExp = convertToAST convertToExpSig getPatternBinder getExpFromScopedExp

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
    Raw.PatternVar
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

-- ** Conversion helpers (types)

-- | Convert 'Raw.Exp' into a scope-safe expression.
-- This is a special case of 'convertToAST'.
toType :: (Foil.Distinct n) => Foil.Scope n -> Map Raw.Ident (Foil.Name n) -> Raw.Type -> AST TypeSig n
toType = convertToAST convertToTypeSig getTypePatternBinder getTypeFromScopedType

-- | Convert 'Raw.Type' into a closed scope-safe expression.
-- This is a special case of 'toType'.
toTypeClosed :: Raw.Type -> Type Foil.VoidS
toTypeClosed = toType Foil.emptyScope Map.empty

-- | Convert a scope-safe representation back into 'Raw.Type'.
-- This is a special case of 'convertFromAST'.
--
-- 'Raw.VarIdent' names are generated based on the raw identifiers in the underlying foil representation.
--
-- This function does not recover location information for variables, patterns, or scoped terms.
fromType :: Type n -> Raw.Type
fromType =
  convertFromAST
    convertFromTypeSig
    Raw.TVar
    Raw.TPatternVar
    Raw.ScopedType
    (\n -> Raw.Ident ("x" ++ show n))

-- | Parse scope-safe terms via raw representation.
--
-- TODO: fix this example
-- -- >>> fromString "let x = 2 + 2 in let y = x - 1 in let x = 3 in y + x + y" :: Type Foil.VoidS
-- -- let x0 = 2 + 2 in let x1 = x0 - 1 in let x2 = 3 in x1 + x2 + x1
instance IsString (Type Foil.VoidS) where
  fromString input = case Raw.pType (Raw.myLexer input) of
    Left err -> error ("could not parse expression: " <> input <> "\n  " <> err)
    Right term -> toTypeClosed term

-- | Pretty-print scope-safe terms via"λ" Ident ":" Type "." Type1 raw representation.
instance Show (Type n) where
  show = Raw.printTree . fromType

instance Eq (Type Foil.VoidS) where
  (==) = alphaEquiv Foil.emptyScope
