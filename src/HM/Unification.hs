-- \| Type Unification implementation.
{-# LANGUAGE DataKinds #-}

module HM.Unification where

import Control.Monad.Foil (NameMap, emptyNameMap)
import qualified Control.Monad.Foil as Foil
import HM.Syntax (Exp)

-- | Represents HM types but also adds the `ETVar Int` constructor,
-- which represents a type variable with an integer identifier.
data ExtendedType
  = ETBool
  | ETNat
  | ETArrow ExtendedType ExtendedType
  | ETVar Int

data Constraint = Constraint ExtendedType ExtendedType

-- | Represents substition from a `ETArrow` to `ExtendedType`.
-- TODO: how we restrict the first type parameter of the constructor to
-- the `ETArrow`?
data Substitution = Substitution ExtendedType ExtendedType

collectConstraintsClosed :: Exp Foil.VoidS -> [Constraint]
collectConstraintsClosed = collectConstraints emptyNameMap

collectConstraints :: NameMap n ExtendedType -> Exp n -> [Constraint]
collectConstraints = undefined -- TODO: implement

unify :: [Constraint] -> Either String [Substitution]
unify _constrs = undefined -- TODO: implement

applySubstitutions :: ExtendedType -> [Substitution] -> ExtendedType
applySubstitutions _typ _substs = undefined -- TODO: implement
