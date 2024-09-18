{-# LANGUAGE DataKinds #-}

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

data Constraint = Constraint Type Type
type Substitution = [(TypeVar, Type)]

applySubst :: Substitution -> Type -> Type
applySubst subst t = case t of
    TypeBool -> t
    TypeNat -> t
    TypeUnit -> t
    TypeTop -> t
    TypeBottom -> t
    TypeTypeVar v -> fromMaybe t (lookupName (TypeTypeVar v) subst)
    TypeRef refType  -> TypeRef $ applySubst subst refType
    TypeFun paramTypes retType -> TypeFun (map (applySubst subst) paramTypes) (applySubst subst retType)
    TypeList eleType -> TypeList (applySubst subst eleType)
    TypeSum leftType rightType -> TypeSum (applySubst subst leftType) (applySubst subst rightType)
    TypeTuple typeList -> TypeTuple (map (applySubst subst) typeList)
    TypeRecord fields -> TypeRecord (map (\(l, f) -> (l, applySubst subst f)) fields)


unify [] = return []
unify (Constraint type1 type1 : cts) = unify cts
unify (Constraint (TypeVar x) y : rest) = 