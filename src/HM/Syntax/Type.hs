{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveTraversable #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

module HM.Syntax.Type where

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
import HM.Syntax.Pattern as Pattern

-- $setup
-- >>> :set -XOverloadedStrings
-- >>> :set -XDataKinds
-- >>> import qualified Control.Monad.Foil as Foil
-- >>> import Control.Monad.Free.Foil
-- >>> import Data.String (fromString)

-- * Generated code (types)

-- ** Signature

mkSignature ''Raw.Type ''Raw.Ident ''Raw.ScopedType ''Raw.Pattern
deriveZipMatch ''TypeSig
deriveBifunctor ''TypeSig
deriveBifoldable ''TypeSig
deriveBitraversable ''TypeSig

-- ** Pattern synonyms

mkPatternSynonyms ''TypeSig

{-# COMPLETE Var, TUVar, TBool, TNat, TArrow, TForAll #-}

-- ** Conversion helpers

mkConvertToFreeFoil ''Raw.Type ''Raw.Ident ''Raw.ScopedType ''Raw.Pattern
mkConvertFromFreeFoil ''Raw.Type ''Raw.Ident ''Raw.ScopedType ''Raw.Pattern

-- * User-defined code

type Type n = AST FoilPattern TypeSig n
type Type' = Type Foil.VoidS

-- ** Conversion helpers (types)

-- | Convert 'Raw.Exp' into a scope-safe expression.
-- This is a special case of 'convertToAST'.
toType :: (Foil.Distinct n) => Foil.Scope n -> Map Raw.Ident (Foil.Name n) -> Raw.Type -> AST FoilPattern TypeSig n
toType = convertToAST convertToTypeSig toFoilPattern getTypeFromScopedType

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
    fromFoilPattern
    Raw.ScopedType
    (\n -> Raw.Ident ("x" ++ show n))

-- | Parse scope-safe terms via raw representation.
--
-- >>> fromString "let x = 2 + 2 in let y = x - 1 in let x = 3 in y + x + y" :: Type Foil.VoidS
-- let x0 = 2 + 2 in let x1 = x0 - 1 in let x2 = 3 in x1 + x2 + x1
instance IsString (Type Foil.VoidS) where
  fromString input = case Raw.pType (Raw.myLexer input) of
    Left err -> error ("could not parse expression: " <> input <> "\n  " <> err)
    Right term -> toTypeClosed term

-- | Pretty-print scope-safe terms via"λ" Ident ":" Type "." Type1 raw representation.
instance Show (Type n) where
  show = Raw.printTree . fromType

instance Eq (Type Foil.VoidS) where
  (==) = alphaEquiv Foil.emptyScope
