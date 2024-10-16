{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ViewPatterns #-}

module HM.Typecheck where

import Control.Monad.Foil
  ( NameMap,
    -- Scope,
    -- addNameBinder,
    emptyNameMap,
    -- emptyScope,
    -- lookupName,
  )
import qualified Control.Monad.Foil as Foil
-- import qualified Control.Monad.Free.Foil as FreeFoil
import qualified HM.Parser.Print as Raw
-- import qualified HM.Parser.Abs as Raw
import HM.Syntax
-- import qualified Data.Map as Map

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
  -- if FreeFoil.alphaEquiv typeScope typeOfE expectedType -- TODO: figure out alphaEquiv
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
  :: NameMap n (Term n)  {- type -}
  -> Term n {- type -}
  -> Either String (Term n) {- type -}
inferType = undefined
-- inferType scope _typeScope (FreeFoil.Var n) = Right (lookupName n scope) -- Γ, x : T ⊢ x : T
-- inferType _scope _typeScope ETrue = return TBool
-- inferType _scope _typeScope EFalse = return TBool
-- inferType _scope _typeScope (ENat _) = return TNat
-- inferType scope typeScope (EAdd l r) = do
--   _ <- typecheck scope typeScope l TNat
--   _ <- typecheck scope typeScope r TNat
--   return TNat
-- inferType scope typeScope (ESub l r) = do
--   _ <- typecheck scope typeScope l TNat
--   _ <- typecheck scope typeScope r TNat
--   return TNat
-- inferType scope typeScope (EIf eCond eThen eElse) = do
--   _ <- typecheck scope typeScope eCond TBool
--   typeOfThen <- inferType scope typeScope eThen
--   _ <- typecheck scope typeScope eElse typeOfThen
--   return typeOfThen
-- inferType scope typeScope (EIsZero e) = do
--   _ <- typecheck scope typeScope e TNat
--   return TBool
-- inferType scope typeScope (ETyped expr (toType typeScope Map.empty -> type_)) = do 
--   typecheck scope typeScope expr type_
-- inferType scope typeScope (ELet e1 x e2) = do
--   -- Γ ⊢ let x = e1 in e2 : ?
--   type1 <- inferType scope typeScope e1 -- Γ ⊢ e1 : type1
--   
--   case getPatternBinder (fromFoilPattern (\n -> Raw.Ident ("x" ++ show n)) x) of 
--     Just binder -> do  
--       let newScope = addNameBinder binder type1 scope -- Γ' = Γ, x : type1
--       inferType newScope typeScope e2 -- Γ' ⊢ e2 : ?
--     Nothing -> Left ("expected NameBinder but got " <> show x)
-- inferType scope typeScope (EAbs (toType typeScope Map.empty -> type_) x e) = do
--   -- Γ ⊢ λx : type_. e : ?
--   let newScope = addNameBinder (getPatternBinder x) type_ scope -- Γ' = Γ, x : type_
--   TArrow type_ <$> inferType newScope typeScope e
-- inferType scope typeScope (EApp e1 e2) = do
--   -- (Γ ⊢ e1) (Γ ⊢ e2) : ?
--   type1 <- inferType scope typeScope e1 -- Γ ⊢ e1 : type1
--   case type1 of
--     TArrow type_ types -> do
--       _ <- typecheck scope typeScope e2 type_
--       return types
--     _ -> Left ("expected type\n  TArrow\nbut got type\n  " <> show type1)
-- inferType scope typeScope (EFor e1 e2 x expr) = do
--   _ <- typecheck scope typeScope e1 TNat
--   _ <- typecheck scope typeScope e2 TNat
--   let newScope = addNameBinder x TNat scope
--   inferType newScope typeScope expr
-- inferType scope typeScope (ETAbs t e) = do  -- TODO: figure out why ETAbs has a third parameter?
--   let newTypeScope = Foil.extendScopePattern t typeScope 
--   TArrow (Var t) <$> inferType scope newTypeScope e
-- inferType scope typeScope (ETApp e t) = do 
--   type1 <- inferType scope typeScope e
--   case type1 of 
--     TArrow type_ types -> do 
--       _ <- typecheck scope typeScope type_ TVar
--       let subst = addSubst identitySubst typeVar t 
--       inferType scope typeScope (substitute typeScope subst e) 
--     _ -> Left ("expected type\n TArrow (TVar t) _\n but got type\n " <> show e)
--
