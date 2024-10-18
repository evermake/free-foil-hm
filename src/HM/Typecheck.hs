{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ViewPatterns #-}

module HM.Typecheck where

import Control.Monad.Foil
  ( NameMap,
    Scope,
    addNameBinder,
    emptyNameMap,
    emptyScope,
    lookupName,
  )
import qualified Control.Monad.Foil as Foil
import qualified Control.Monad.Free.Foil as FreeFoil
import qualified HM.Parser.Print as Raw
import qualified HM.Parser.Abs as Raw
import HM.Syntax
import qualified Data.Map as Map

-- $setup
-- >>> :set -XOverloadedStrings
-- >>> import HM.Parser.Abs (Type' (..))

-- | Typechecks an expression and maybe returns an error.
-- >>> typecheckClosed "2 - (1 + 1)" TNat
-- Right TNat
-- >>> typecheckClosed "2 - (1 + true)" TNat
-- Left "expected type\n  TNat\nbut got type\n  Bool\nwhen typechecking expession\n  true\n"
-- >>> typecheckClosed "2 - (1 + 1)" TBool
-- Left "expected type\n  TBool\nbut got type\n  Nat\nwhen typechecking expession\n  2 - (1 + 1)\n"
-- >>> typecheckClosed "let x = 1 in let y = 2 in x + (let x = 3 in x + y)" TNat
-- Right TNat
typecheckClosed
  :: Term Foil.VoidS {- exp -}
  -> Term Foil.VoidS {- type -}
  -> Either String (Term Foil.VoidS) {- type -}
typecheckClosed = typecheck emptyNameMap 

typecheck 
  ::  NameMap n (Term n) 
  -> Term n {- exp -}
  -> Term n {- type -}
  -> Either String (Term n) {- type -}
typecheck scope e expectedType = do
  typeOfE <- inferType scope e
  -- if typeOfE == expectedType
  -- if FreeFoil.alphaEquiv typeOfE expectedType -- TODO: figure out alphaEquiv
  --   then return typeOfE
  --   else
  Left $
    unlines
      [ "expected type",
        "  " ++ show expectedType,
        "but got type",
        "  " ++ Raw.printTree (fromTerm typeOfE),
        "when typechecking expession",
        "  " ++ show e
      ]

inferType 
  :: NameMap n (Term n)  
  -> Term n 
  -> Either String (Term n) 
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
inferType scope (ETyped expr (toTerm Map.empty -> type_)) = do 
  typecheck scope expr type_
inferType scope (ELet e1 (FoilPatternVar binder) e2) = do
  -- Γ ⊢ let x = e1 in e2 : ?
  type1 <- inferType scope e1 -- Γ ⊢ e1 : type1
  
  let newScope = addNameBinder binder type1 scope -- Γ' = Γ, x : type1
  inferType newScope e2 -- Γ' ⊢ e2 : ?
inferType scope (EAbs (toTerm Map.empty -> type_) x e) = do
  -- Γ ⊢ λx : type_. e : ?
  let newScope = addNameBinder (getPatternBinder x) type_ scope -- Γ' = Γ, x : type_
  TArrow type_ <$> inferType newScope e
inferType scope (EApp e1 e2) = do
  -- (Γ ⊢ e1) (Γ ⊢ e2) : ?
  type1 <- inferType scope e1 -- Γ ⊢ e1 : type1
  case type1 of
    TArrow type_ types -> do
      _ <- typecheck scope e2 type_
      return types
    _ -> Left ("expected type\n  TArrow\nbut got type\n  " <> show type1)
inferType scope (EFor e1 e2 x expr) = do
  _ <- typecheck scope e1 TNat
  _ <- typecheck scope e2 TNat
  let newScope = addNameBinder x TNat scope
  inferType newScope expr
inferType scope (ETAbs t e) = do  -- TODO: figure out why ETAbs has a third parameter?
  let newTypeScope = Foil.extendScopePattern t 
  TArrow (Var t) <$> inferType scope newTypeScope e
inferType scope (ETApp e t) = do 
  type1 <- inferType scope e
  case type1 of 
    TArrow type_ types -> do 
      _ <- typecheck scope type_ TVar
      let subst = addSubst identitySubst typeVar t 
      inferType scope (substitute subst e) 
    _ -> Left ("expected type\n TArrow (TVar t) _\n but got type\n " <> show e)

