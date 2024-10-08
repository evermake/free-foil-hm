-- File generated by the BNF Converter (bnfc 2.9.5).

{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- | The abstract syntax of language Parser.

module HM.Parser.Abs where

import Prelude (Integer, String)
import qualified Prelude as C (Eq, Ord, Show, Read)
import qualified Data.String

import qualified Data.Data    as C (Data, Typeable)
import qualified GHC.Generics as C (Generic)

data Pattern = PatternVar Ident
  deriving (C.Eq, C.Ord, C.Show, C.Read, C.Data, C.Typeable, C.Generic)

data Exp
    = EVar Ident
    | ETrue
    | EFalse
    | ENat Integer
    | EAdd Exp Exp
    | ESub Exp Exp
    | EIf Exp Exp Exp
    | EIsZero Exp
    | ETyped Exp Type
    | ELet Pattern Exp ScopedExp
    | EAbs Pattern Type ScopedExp
    | EApp Exp Exp
    | EFor Pattern Exp Exp ScopedExp
  deriving (C.Eq, C.Ord, C.Show, C.Read, C.Data, C.Typeable, C.Generic)

data ScopedExp = ScopedExp Exp
  deriving (C.Eq, C.Ord, C.Show, C.Read, C.Data, C.Typeable, C.Generic)

data Type = TNat | TBool | TArrow Type Type
  deriving (C.Eq, C.Ord, C.Show, C.Read, C.Data, C.Typeable, C.Generic)

newtype Ident = Ident String
  deriving (C.Eq, C.Ord, C.Show, C.Read, C.Data, C.Typeable, C.Generic, Data.String.IsString)

