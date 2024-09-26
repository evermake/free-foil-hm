{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ViewPatterns #-}

module HM.Typecheck where

import Control.Monad.Foil
  ( NameMap,
    addNameBinder,
    emptyNameMap,
    lookupName,
  )
import qualified Control.Monad.Foil as Foil
import qualified Control.Monad.Free.Foil as FreeFoil
import qualified Data.Foldable as F
import qualified HM.Parser.Abs as Raw
import qualified HM.Parser.Print as Raw
import HM.Syntax

-- $setup
-- TODO: fix doctests
-- -- >>> :set -XOverloadedStrings
-- -- >>> import HM.Parser.Abs (Type' (..))

-- | Typechecks an expression and maybe returns an error.
-- TODO: fix doctests
-- -- >>> typecheckClosed "2 - (1 + 1)" TNat
-- -- Right TNat
-- -- >>> typecheckClosed "2 - (1 + true)" TNat
-- -- Left "expected type\n  TNat\nbut got type\n  Bool\nwhen typechecking expession\n  true\n"
-- -- >>> typecheckClosed "2 - (1 + 1)" TBool
-- -- Left "expected type\n  TBool\nbut got type\n  Nat\nwhen typechecking expession\n  2 - (1 + 1)\n"
-- -- >>> typecheckClosed "let x = 1 in let y = 2 in x + (let x = 3 in x + y)" TNat
-- -- Right TNat
typecheckClosed :: Exp Foil.VoidS -> Type' -> Either String Type'
typecheckClosed = typecheck emptyNameMap

typecheck :: NameMap n Type' -> Exp n -> Type' -> Either String Type'
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
            "  " ++ Raw.printTree (fromType typeOfE),
            "when typechecking expession",
            "  " ++ show e
          ]

inferTypeNewClosed :: Exp Foil.VoidS -> Either String Type'
inferTypeNewClosed expr = do
  (typ, constrs, _freshId) <- reconstructType [] 0 Foil.emptyNameMap expr
  substs <- unify constrs
  return (applySubstsToType substs typ)

inferType :: NameMap n Type' -> Exp n -> Either String Type'
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
inferType scope (ETyped expr (toTypeClosed -> type_)) = do
  typecheck scope expr type_
inferType scope (ELet e1 x e2) = do
  -- Γ ⊢ let x = e1 in e2 : ?
  type1 <- inferType scope e1 -- Γ ⊢ e1 : type1
  let newScope = addNameBinder x type1 scope -- Γ' = Γ, x : type1
  inferType newScope e2 -- Γ' ⊢ e2 : ?
inferType scope (EAbs (toTypeClosed -> type_) x e) = do
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
inferType scope (EFor e1 e2 x expr) = do
  _ <- typecheck scope e1 TNat
  _ <- typecheck scope e2 TNat
  let newScope = addNameBinder x TNat scope
  inferType newScope expr

type Constraint = (Type', Type')

type USubst = (Raw.UVarIdent, Type')

unify1 :: Constraint -> Either String [USubst]
unify1 c =
  case c of
    -- Case for unification variables
    (TUVar x, r) -> return [(x, r)]
    (l, TUVar x) -> return [(x, l)]
    -- Case for Free Foil variables (not supported for now)
    (FreeFoil.Var x, FreeFoil.Var y)
      | x == y -> return []
    -- Case of non-trivial arbitrary nodes
    (FreeFoil.Node l, FreeFoil.Node r) ->
      -- zipMatch (TArrowSig x1 x2) (TArrowSig y1 y2)
      --   = Just (TArrowSig (x1, y1) (x2, y2))
      case FreeFoil.zipMatch l r of
        Nothing -> Left "cannot unify"
        -- `zipMatch` takes out corresponding terms from a node that we need
        --  to unify further.
        Just lr -> unify (F.toList lr) -- ignores "scopes", only works with "terms"
    _ -> Left "cannot unify"

unify :: [Constraint] -> Either String [USubst]
unify [] = return []
unify (c : cs) = do
  subst <- unify1 c
  subst' <- unify (map (applySubstsToConstraint subst) cs)
  return (map (applySubstsInSubsts subst') subst ++ subst')

applySubstsToConstraint :: [USubst] -> Constraint -> Constraint
applySubstsToConstraint substs (l, r) = (applySubstsToType substs l, applySubstsToType substs r)

applySubstToType :: USubst -> Type' -> Type'
applySubstToType _ (FreeFoil.Var x) = FreeFoil.Var x
applySubstToType _ (TNat) = TNat
applySubstToType _ (TBool) = TBool
-- TODO: how to generalize this using Type signature?
applySubstToType subst (TArrow l r) = TArrow (applySubstToType subst l) (applySubstToType subst r)
applySubstToType (ident, typ) (TUVar x)
  | ident == x = typ
  | otherwise = TUVar x

applySubstsToType :: [USubst] -> Type' -> Type'
applySubstsToType [] typ = typ
applySubstsToType (subst : rest) typ = applySubstsToType rest (applySubstToType subst typ)

applySubstsInSubsts :: [USubst] -> USubst -> USubst
applySubstsInSubsts substs (l, r) = (l, (applySubstsToType substs r))

---

reconstructTypeClosed :: Exp Foil.VoidS -> Either String (Type', [Constraint])
reconstructTypeClosed expr = do
  (typ, constrs, _freshId) <- reconstructType [] 0 Foil.emptyNameMap expr
  return (typ, constrs)

-- | Recursively "reconstructs" type of an expression.
-- On success, returns the "reconstructed" type and collected constraints.
reconstructType :: [Constraint] -> Int -> Foil.NameMap n Type' -> Exp n -> Either String (Type', [Constraint], Int)
reconstructType constrs freshId _scope ETrue = Right (TBool, constrs, freshId)
reconstructType constrs freshId _scope EFalse = Right (TBool, constrs, freshId)
reconstructType constrs freshId _scope (ENat _) = Right (TNat, constrs, freshId)
reconstructType constrs freshId scope (FreeFoil.Var x) = Right (Foil.lookupName x scope, constrs, freshId)
reconstructType constrs freshId scope (EAdd lhs rhs) = do
  (lhsTyp, constrs2, freshId2) <- reconstructType constrs freshId scope lhs
  (rhsTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 scope rhs
  return (TNat, constrs3 ++ [(lhsTyp, TNat), (rhsTyp, TNat)], freshId3)
reconstructType constrs freshId scope (ESub lhs rhs) = do
  (lhsTyp, constrs2, freshId2) <- reconstructType constrs freshId scope lhs
  (rhsTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 scope rhs
  return (TNat, constrs3 ++ [(lhsTyp, TNat), (rhsTyp, TNat)], freshId3)
reconstructType constrs freshId scope (EIf eCond eThen eElse) = do
  (condTyp, constrs2, freshId2) <- reconstructType constrs freshId scope eCond
  (thenTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 scope eThen
  (elseTyp, constrs4, freshId4) <- reconstructType constrs3 freshId3 scope eElse
  return (thenTyp, constrs4 ++ [(condTyp, TBool), (thenTyp, elseTyp)], freshId4)
reconstructType constrs freshId scope (EIsZero e) = do
  (eTyp, constrs2, freshId2) <- reconstructType constrs freshId scope e
  return (TBool, constrs2 ++ [(eTyp, TNat)], freshId2)
reconstructType constrs freshId scope (EAbs tBody_ x eBody) = do
  -- TODO: Do not require typing by user, infert type instead.
  let tBody = toTypeClosed tBody_
  let newScope = Foil.addNameBinder x tBody scope
  (bodyTyp, constrs2, freshId2) <- reconstructType constrs freshId newScope eBody
  return (TArrow tBody bodyTyp, constrs2, freshId2)
reconstructType constrs freshId scope (EApp eAbs eArg) = do
  (absTyp, constrs2, freshId2) <- reconstructType constrs freshId scope eAbs
  (argTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 scope eArg
  let resultTyp = TUVar (Raw.UVarIdent ("T" ++ (show freshId3))) -- TODO: hack to get UVar name
  return (resultTyp, constrs3 ++ [(absTyp, (TArrow argTyp resultTyp))], freshId3 + 1)
reconstructType constrs freshId scope (ETyped e typ_) = do
  let typ = toTypeClosed typ_
  (eTyp, constrs2, freshId2) <- reconstructType constrs freshId scope e
  return (typ, constrs2 ++ [(eTyp, typ)], freshId2)
reconstructType constrs freshId scope (ELet eWhat x eExpr) = do
  (whatTyp, constrs2, freshId2) <- reconstructType constrs freshId scope eWhat
  let newScope = Foil.addNameBinder x whatTyp scope
  (exprTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 newScope eExpr
  return (exprTyp, constrs3, freshId3)
reconstructType constrs freshId scope (EFor eFrom eTo x eBody) = do
  (fromTyp, constrs2, freshId2) <- reconstructType constrs freshId scope eFrom
  (toTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 scope eTo
  let newScope = Foil.addNameBinder x TNat scope
  (bodyTyp, constrs4, freshId4) <- reconstructType constrs3 freshId3 newScope eBody
  return (bodyTyp, constrs4 ++ [(fromTyp, TNat), (toTyp, TNat)], freshId4)
