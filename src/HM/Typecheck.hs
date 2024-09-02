{-# LANGUAGE DataKinds #-}
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

module HM.Typecheck where

import Control.Monad.Foil
  ( NameMap,
    addNameBinder,
    emptyNameMap,
    lookupName,
  )
import qualified Control.Monad.Foil as Foil
import qualified Control.Monad.Free.Foil as FreeFoil
import HM.Parser.Abs (Type (..))
import qualified HM.Parser.Print as Raw
import HM.Syntax

-- $setup
-- >>> :set -XOverloadedStrings
-- >>> import HM.Parser.Abs (Type (..))

-- | Typechecks an expression and maybe returns an error.
-- >>> typecheckClosed "2 - (1 + 1)" TNat
-- Right TNat
-- >>> typecheckClosed "2 - (1 + true)" TNat
-- Left "expected type\n  TNat\nbut got type\n  Bool\nwhen typechecking expession\n  true\n"
-- >>> typecheckClosed "2 - (1 + 1)" TBool
-- Left "expected type\n  TBool\nbut got type\n  Nat\nwhen typechecking expession\n  2 - (1 + 1)\n"
-- >>> typecheckClosed "let x = 1 in let y = 2 in x + (let x = 3 in x + y)" TNat
-- Right TNat
typecheckClosed :: Exp Foil.VoidS -> Type -> Either String Type
typecheckClosed = typecheck emptyNameMap

typecheck :: NameMap n Type -> Exp n -> Type -> Either String Type
typecheck scope e expectedType = do
  typeOfE <- inferType scope e
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
inferType scope (FreeFoil.Var n) = Right (lookupName n scope) -- Γ, x : T ⊢ x : T
inferType _scope ETrue = return TBool
inferType _scope EFalse = return TBool
inferType _scope (ENat _) = return TNat
inferType scope (EAdd l r) = do
  _ <- typecheck scope l TNat
  _ <- typecheck scope r TNat
  return TNat
inferType scope (ESub l r) = do
  _ <- typecheck scope l TNat
  _ <- typecheck scope r TNat
  return TNat
inferType scope (EIf eCond eThen eElse) = do
  _ <- typecheck scope eCond TBool
  typeOfThen <- inferType scope eThen
  _ <- typecheck scope eElse typeOfThen
  return typeOfThen
inferType scope (EIsZero e) = do
  _ <- typecheck scope e TNat
  return TBool
inferType scope (ETyped expr type_) = do
  typecheck scope expr type_
inferType scope (ELet e1 x e2) = do
  -- Γ ⊢ let x = e1 in e2 : ?
  type1 <- inferType scope e1 -- Γ ⊢ e1 : type1
  let newScope = addNameBinder x type1 scope -- Γ' = Γ, x : type1
  inferType newScope e2 -- Γ' ⊢ e2 : ?
inferType scope (EAbs type_ x e) = do
  -- Γ ⊢ λx : type_. e : ?
  let newScope = addNameBinder x type_ scope -- Γ' = Γ, x : type_
  TArrow type_ <$> inferType newScope e
inferType scope (EApp e1 e2) = do
  -- (Γ ⊢ e1) (Γ ⊢ e2) : ?
  type1 <- inferType scope e1 -- Γ ⊢ e1 : type1
  case type1 of
    TArrow type_ types -> do
      _ <- typecheck scope e2 type_
      return types
    _ -> Left ("expected type\n  TArrow\nbut got type\n  " <> show type1)
