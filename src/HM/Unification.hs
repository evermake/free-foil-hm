-- \| Type Unification implementation.
{-# LANGUAGE DataKinds #-}

module HM.Unification where

import qualified Control.Monad.Foil as Foil
import qualified Control.Monad.Free.Foil as FreeFoil
import HM.Parser.Abs (Type (..))
import HM.Syntax

newtype UVar = UVar Int deriving (Show, Eq)

-- | Represents HM types but also adds the `ETVar Int` constructor,
-- which represents a type variable with an integer identifier.
data ExtendedType
  = ETBool
  | ETNat
  | ETArrow ExtendedType ExtendedType
  | ETVar UVar
  deriving (Show, Eq)

data Constraint = Constraint ExtendedType ExtendedType

-- | Represents a substition from a `ETVar` to `ExtendedType`.
-- TODO: how we restrict the first type parameter of the constructor to
-- the `ETVar`?
data Substitution = Substitution UVar ExtendedType

reconstructTypeClosed :: Exp Foil.VoidS -> Either String (ExtendedType, [Substitution])
reconstructTypeClosed expr = do
  (typ, constrs, _freshId) <- reconstructType [] 0 Foil.emptyNameMap expr
  subst <- unify constrs
  return (typ, subst)

-- | Recursively "reconstructs" type of an expression.
-- On success, returns the "reconstructed" type and collected constraints.
reconstructType :: [Constraint] -> Int -> Foil.NameMap n ExtendedType -> Exp n -> Either String (ExtendedType, [Constraint], Int)
reconstructType constrs freshId _scope ETrue = Right (ETBool, constrs, freshId)
reconstructType constrs freshId _scope EFalse = Right (ETBool, constrs, freshId)
reconstructType constrs freshId _scope (ENat _) = Right (ETNat, constrs, freshId)
reconstructType constrs freshId scope (FreeFoil.Var x) = Right (Foil.lookupName x scope, constrs, freshId)
reconstructType constrs freshId scope (EAdd lhs rhs) = do
  (lhsTyp, constrs2, freshId2) <- reconstructType constrs freshId scope lhs
  (rhsTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 scope rhs
  return (ETNat, constrs3 ++ [Constraint lhsTyp ETNat, Constraint rhsTyp ETNat], freshId3)
reconstructType constrs freshId scope (ESub lhs rhs) = do
  (lhsTyp, constrs2, freshId2) <- reconstructType constrs freshId scope lhs
  (rhsTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 scope rhs
  return (ETNat, constrs3 ++ [Constraint lhsTyp ETNat, Constraint rhsTyp ETNat], freshId3)
reconstructType constrs freshId scope (EIf eCond eThen eElse) = do
  (condTyp, constrs2, freshId2) <- reconstructType constrs freshId scope eCond
  (thenTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 scope eThen
  (elseTyp, constrs4, freshId4) <- reconstructType constrs3 freshId3 scope eElse
  return (thenTyp, constrs4 ++ [Constraint condTyp ETBool, Constraint thenTyp elseTyp], freshId4)
reconstructType constrs freshId scope (EIsZero e) = do
  (eTyp, constrs2, freshId2) <- reconstructType constrs freshId scope e
  return (ETBool, constrs2 ++ [Constraint eTyp ETNat], freshId2)
reconstructType constrs freshId scope (EAbs tBody x eBody) = do
  -- TODO: Do not require typing by user, infert type instead.
  let tBodyExtended = extendedTypeFromType tBody
  let newScope = Foil.addNameBinder x tBodyExtended scope
  (bodyTyp, constrs2, freshId2) <- reconstructType constrs freshId newScope eBody
  return (ETArrow tBodyExtended bodyTyp, constrs2, freshId2)
reconstructType constrs freshId scope (EApp eAbs eArg) = do
  (absTyp, constrs2, freshId2) <- reconstructType constrs freshId scope eAbs
  (argTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 scope eArg
  let resultTyp = ETVar (UVar freshId3)
  return (resultTyp, constrs3 ++ [Constraint absTyp (ETArrow argTyp resultTyp)], freshId3 + 1)
reconstructType constrs freshId scope (ETyped e typ) = do
  (eTyp, constrs2, freshId2) <- reconstructType constrs freshId scope e
  let extendedTyp = extendedTypeFromType typ
  return (extendedTyp, constrs2 ++ [Constraint eTyp extendedTyp], freshId2)
reconstructType constrs freshId scope (ELet eWhat x eExpr) = do
  (whatTyp, constrs2, freshId2) <- reconstructType constrs freshId scope eWhat
  let newScope = Foil.addNameBinder x whatTyp scope
  (exprTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 newScope eExpr
  return (exprTyp, constrs3, freshId3)
reconstructType constrs freshId scope (EFor eFrom eTo x eBody) = do
  (fromTyp, constrs2, freshId2) <- reconstructType constrs freshId scope eFrom
  (toTyp, constrs3, freshId3) <- reconstructType constrs2 freshId2 scope eTo
  let newScope = Foil.addNameBinder x ETNat scope
  (bodyTyp, constrs4, freshId4) <- reconstructType constrs3 freshId3 newScope eBody
  return (bodyTyp, constrs4 ++ [Constraint fromTyp ETNat, Constraint toTyp ETNat], freshId4)

extendedTypeFromType :: Type -> ExtendedType
extendedTypeFromType TNat = ETNat
extendedTypeFromType TBool = ETBool
extendedTypeFromType (TArrow t1 t2) = ETArrow (extendedTypeFromType t1) (extendedTypeFromType t2)

unify :: [Constraint] -> Either String [Substitution]
unify [] = return []
unify (Constraint lhs rhs : constrs)
  | lhs == rhs = unify constrs
  | otherwise = case (lhs, rhs) of
      (ETVar var, _) -> unify (map (applyToConstraint (Substitution var rhs)) constrs)
      (_, ETVar var) -> unify (map (applyToConstraint (Substitution var lhs)) constrs)
      (ETArrow x1 x2, ETArrow y1 y2) -> do
        subst1 <- unify [Constraint x1 x2]
        let y1' = applySubsToSide subst1 y1
            y2' = applySubsToSide subst1 y2
        subst2 <- unify [Constraint y1' y2']
        subst3 <- unify constrs
        return (map (applySubsToSub (map (applySubsToSub subst2) subst1 ++ subst1)) subst3 ++ subst3)
      _ -> Left ("unable to unify the types " <> show rhs <> " and " <> show lhs)

-- 1.  (T₁ → Bool) → Nat → Nat  =  (Bool → T₁) → T₂
-- 2.  T₁ → Bool = Bool → T₁
--     Nat → Nat = T₂
-- 3.  T₁ = Bool
--     Bool = T₁
--     Nat → Nat = T₂
-- 4. [ T₁ ↦ Bool ]
--     Bool = Bool
--     Nat → Nat = T₂
-- 5. [ T₁ ↦ Bool ]
--     Nat → Nat = T₂
-- Result:
--  T₁ ↦ Bool
--  T₂ ↦ (Nat → Nat)

-- 1. T₁ → T₂ = T₂ → Bool
-- 2. T₁ = T₂
--    T₂ = Bool
-- 3. [ T₁ ↦ T₂ ]
--    T₂ = Bool
-- 4. [ T₁ ↦ T₂ ]
--    [ T₂ ↦ Bool ]
-- Result:
--   T₁ ↦ Bool    -- we need to apply [ T₂ ↦ Bool ] to [ T₁ ↦ T₂ ]
--   T₂ ↦ Bool

applyToConstraint :: Substitution -> Constraint -> Constraint
applyToConstraint _const (Constraint lhs rhs) = Constraint (applyToSide _const lhs) (applyToSide _const rhs)

applyToSide :: Substitution -> ExtendedType -> ExtendedType
applyToSide _ ETBool = ETBool
applyToSide _ ETNat = ETNat
applyToSide _subst (ETArrow x y) = ETArrow (applyToSide _subst x) (applyToSide _subst y)
applyToSide (Substitution (UVar var1) val) (ETVar (UVar var2)) | var1 == var2 = val
applyToSide _ typ = typ

applySubsToConstraints :: [Substitution] -> Constraint -> Constraint
applySubsToConstraints _subs _const = foldl (flip applyToConstraint) _const _subs

applySubsToSide :: [Substitution] -> ExtendedType -> ExtendedType
applySubsToSide _subs _const = foldl (flip applyToSide) _const _subs

applySubsToSub :: [Substitution] -> Substitution -> Substitution
applySubsToSub substs (Substitution var val) = Substitution var (applySubsToSide substs val)