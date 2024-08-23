{-# LANGUAGE DataKinds #-}

module HM.Typecheck where

import qualified Control.Monad.Foil as Foil
import qualified Control.Monad.Free.Foil as FreeFoil
import HM.Parser.Abs (Type (..))
import qualified HM.Parser.Print as Raw
import HM.Syntax

-- $setup
-- >>> :set -XOverloadedStrings

-- | Typechecks an expression and maybe returns an error.
-- >>> typecheckClosed "2 - (1 + 1)" TNat
-- >>> typecheckClosed "2 - (1 + true)" TNat
-- >>> typecheckClosed "2 - (1 + 1)" TBool
-- Right TNat
-- Left "expected type\n  TNat\nbut got type\n  Bool\nwhen typechecking expession\n  true\n"
-- Left "expected type\n  TBool\nbut got type\n  Nat\nwhen typechecking expession\n  2 - (1 + 1)\n"
typecheckClosed :: Exp Foil.VoidS -> Type -> Either String Type
typecheckClosed = typecheck

typecheck :: Exp n -> Type -> Either String Type
typecheck e expectedType = do
  typeOfE <- inferType e
  if typeOfE == expectedType
    then return typeOfE
    else
      Left $
        unlines
          [ "expected type",
            "  " ++ show expectedType,
            "but got type",
            "  " ++ Raw.printTree typeOfE,
            "when typechecking expession",
            "  " ++ show e
          ]

inferType :: Exp n -> Either String Type
inferType ETrue = return TBool
inferType EFalse = return TBool
inferType (ENat _) = return TNat
inferType (EIf eCond eThen eElse) = do
  _ <- typecheck eCond TBool
  typeOfThen <- inferType eThen
  _ <- typecheck eElse typeOfThen
  return typeOfThen
inferType (EAdd l r) = do
  _ <- typecheck l TNat
  _ <- typecheck r TNat
  return TNat
inferType (ESub l r) = do
  _ <- typecheck l TNat
  _ <- typecheck r TNat
  return TNat
inferType (EIsZero e) = do
  _ <- typecheck e TNat
  return TBool
inferType (FreeFoil.Var _) = error "Type inference for 'Var' is not implemented"
inferType (FreeFoil.Node _) = error "Type inference for 'Node' is not implemented"
