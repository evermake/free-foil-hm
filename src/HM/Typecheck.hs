{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ViewPatterns #-}
{-# OPTIONS_GHC -Wno-orphans -Wno-simplifiable-class-constraints #-}

module HM.Typecheck where

import qualified Control.Monad.Foil as Foil
import qualified Control.Monad.Foil.Internal as Foil
import qualified Control.Monad.Free.Foil as FreeFoil
import Data.Bifunctor
import qualified Data.Foldable as F
import qualified HM.Parser.Abs as Raw
import HM.Syntax

inferTypeNewClosed :: Exp Foil.VoidS -> Either String Type'
inferTypeNewClosed expr = do
  (typ, _, _) <- inferTypeNew [] 0 Foil.emptyNameMap expr
  return typ

inferTypeNew :: [Constraint] -> Int -> Foil.NameMap n Type' -> Exp n -> Either String (Type', [Constraint], Int)
inferTypeNew constrs freshId scope expr = do
  (typ, constrs2, freshId2) <- reconstructType constrs freshId scope expr
  substs <- unify constrs2
  return ((applySubstsToType substs typ), [], freshId2)

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

-- FIXME: should be in the library!
instance Foil.ExtEndo Foil.VoidS

applySubstToType :: (Foil.DExt Foil.VoidS n) => USubst -> Type n -> Type n
applySubstToType (ident, typ) (TUVar x)
  | ident == x = Foil.sink typ
  | otherwise = TUVar x
applySubstToType _ (FreeFoil.Var x) = FreeFoil.Var x
applySubstToType subst (FreeFoil.Node node) =
  FreeFoil.Node (bimap goScoped (applySubstToType subst) node)
  where
    goScoped (FreeFoil.ScopedAST binder body) =
      case (Foil.assertExt binder, Foil.assertDistinct binder) of
        (Foil.Ext, Foil.Distinct) ->
          FreeFoil.ScopedAST binder (applySubstToType subst body)

applySubstsToType :: [USubst] -> Type' -> Type'
applySubstsToType [] typ = typ
applySubstsToType (subst : rest) typ = applySubstsToType rest (applySubstToType subst typ)

applySubstsInSubsts :: [USubst] -> USubst -> USubst
applySubstsInSubsts substs (l, r) = (l, (applySubstsToType substs r))

-- | Recursively "reconstructs" type of an expression.
-- On success, returns the "reconstructed" type and collected constraints.
reconstructType :: [Constraint] -> Int -> Foil.NameMap n Type' -> Exp n -> Either String (Type', [Constraint], Int)
reconstructType constrs freshId _scope ETrue = Right (TBool, constrs, freshId)
reconstructType constrs freshId _scope EFalse = Right (TBool, constrs, freshId)
reconstructType constrs freshId _scope (ENat _) = Right (TNat, constrs, freshId)
reconstructType constrs freshId scope (FreeFoil.Var x) = do
  let xTyp = Foil.lookupName x scope
  let (specTyp, freshId2) = specialize [] xTyp freshId
  return (specTyp, constrs ++ constrs, freshId2)
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
reconstructType constrs freshId scope (EAbs x eBody) = do
  let paramType = TUVar (makeIdent freshId)
  let newScope = Foil.addNameBinder x paramType scope
  (bodyTyp, constrs2, freshId2) <- reconstructType constrs (freshId + 1) newScope eBody
  return (TArrow paramType bodyTyp, constrs2, freshId2)
reconstructType constrs freshId scope (EApp eAbs eArg) = do
  (absTyp, constrs2, freshId2) <- reconstructType constrs freshId scope eAbs
  (argTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 scope eArg
  let resultTyp = TUVar (makeIdent freshId3)
  return (resultTyp, constrs3 ++ [(absTyp, (TArrow argTyp resultTyp))], freshId3 + 1)
reconstructType constrs freshId scope (ETyped e typ_) = do
  let typ = toTypeClosed typ_
  (eTyp, constrs2, freshId2) <- reconstructType constrs freshId scope e
  return (typ, constrs2 ++ [(eTyp, typ)], freshId2)
reconstructType constrs freshId scope (ELet eWhat x eExpr) = do
  (whatTyp, constrs2, freshId2) <- inferTypeNew constrs freshId scope eWhat
  -- Since fresh IDs are generated incrementally, we can deduce which variables
  -- have been used in the `eWhat`.
  let genTyp = wrapWithForAlls (unificationVarIdentsBetween freshId freshId2) whatTyp
  let newScope = Foil.addNameBinder x genTyp scope
  (exprTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 newScope eExpr
  return (exprTyp, constrs3, freshId3)
reconstructType constrs freshId scope (EFor eFrom eTo x eBody) = do
  (fromTyp, constrs2, freshId2) <- reconstructType constrs freshId scope eFrom
  (toTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 scope eTo
  let newScope = Foil.addNameBinder x TNat scope
  (bodyTyp, constrs4, freshId4) <- reconstructType constrs3 freshId3 newScope eBody
  return (bodyTyp, constrs4 ++ [(fromTyp, TNat), (toTyp, TNat)], freshId4)

-- Actually, generalization.
wrapWithForAlls :: [Raw.UVarIdent] -> Type' -> Type'
wrapWithForAlls [] typ = typ
wrapWithForAlls (ident : rest) typ = TForAll ident (wrapWithForAlls rest typ)

unificationVarIdentsBetween :: Int -> Int -> [Raw.UVarIdent]
unificationVarIdentsBetween a b = map makeIdent [a .. (b - 1)]

makeIdent :: Int -> Raw.UVarIdent
makeIdent i = Raw.UVarIdent ("T" ++ (show i))

identId :: Raw.UVarIdent -> Int
identId (Raw.UVarIdent ('T' : num)) = read num
identId _ = undefined

specialize :: [(Int, Int)] -> Type' -> Int -> (Type', Int)
specialize idsMap (TForAll ident typ) freshId =
  specialize (idsMap ++ [((identId ident), freshId)]) typ (freshId + 1)
specialize idsMap (TUVar ident) freshId = (TUVar (lookupIdentId idsMap ident), freshId)
  where
    lookupIdentId [] target = target
    lookupIdentId ((substFrom, substTo) : rest) target =
      if ((identId target) == substFrom) then (makeIdent substTo) else (lookupIdentId rest target)
specialize idsMap (TArrow argTyp bodyTyp) freshId =
  let (newArgTyp, freshId2) = specialize idsMap argTyp freshId
   in let (newBodyTyp, freshId3) = specialize idsMap bodyTyp freshId2
       in (TArrow newArgTyp newBodyTyp, freshId3)
specialize _ typ freshId = (typ, freshId)
