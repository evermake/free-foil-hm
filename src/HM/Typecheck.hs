{-# LANGUAGE DataKinds #-}

module HM.Typecheck where

import Control.Monad.Foil (NameMap, addNameBinder, emptyNameMap, lookupName)
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
-- >>> typecheckClosed "let x = 1 in let y = 2 in x + (let x = 3 in x + y)" TNat
-- Right TNat
-- Left "expected type\n  TNat\nbut got type\n  Bool\nwhen typechecking expession\n  true\n"
-- Left "expected type\n  TBool\nbut got type\n  Nat\nwhen typechecking expession\n  2 - (1 + 1)\n"
-- Right TNat
typecheckClosed :: Exp Foil.VoidS -> Type -> Either String Type
typecheckClosed = typecheck emptyNameMap

typecheck :: NameMap n Type -> Exp n -> Type -> Either String Type
typecheck _scope e expectedType = do
  typeOfE <- inferType _scope e
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

inferType :: NameMap n Type -> Exp n -> Either String Type
inferType _scope ETrue = return TBool
inferType _scope EFalse = return TBool
inferType _scope (ENat _) = return TNat
inferType _scope (EIf eCond eThen eElse) = do
  _ <- typecheck _scope eCond TBool
  typeOfThen <- inferType _scope eThen
  _ <- typecheck _scope eElse typeOfThen
  return typeOfThen
inferType _scope (EAdd l r) = do
  _ <- typecheck _scope l TNat
  _ <- typecheck _scope r TNat
  return TNat
inferType _scope (ESub l r) = do
  _ <- typecheck _scope l TNat
  _ <- typecheck _scope r TNat
  return TNat
inferType _scope (EIsZero e) = do
  _ <- typecheck _scope e TNat
  return TBool
inferType _scope (ELet pat e se) = do
  patt <- inferType _scope pat
  let newScope = addNameBinder e patt _scope
  inferType newScope se
inferType _scope (FreeFoil.Var n) = Right $ lookupName n _scope
inferType _scope (FreeFoil.Node _) = error "Type inference for 'Node' is not implemented"
