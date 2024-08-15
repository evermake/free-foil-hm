module HM.Typecheck where

import           HM.Parser.Abs   (Type (..))
import qualified HM.Parser.Print as Raw
import           HM.Syntax

-- $setup
-- >>> :set -XOverloadedStrings

-- | Typechecks an expression and maybe returns an error.
-- >>> printTree <$> typecheck "2 - (1 + 1)" "Nat"
-- Right "Nat"
-- >>> printTree <$> typecheck "2 - (1 + true)" "Nat"
-- Left "Right operand of + has type TBool but should have type Nat"
-- >>> printTree <$> typecheck "2 - (1 + 1)" "Bool"
-- Left "expected type\n  Bool\nbut got type\n  Nat\nwhen typechecking expession\n  2 - (1 + 1)\n"
typecheck :: Exp n -> Type -> Either String Type
typecheck e expectedType = do
  typeOfE <- inferType e
  if typeOfE == expectedType
    then return typeOfE
    else Left $ unlines
      [ "expected type"
      , "  " ++ show expectedType
      , "but got type"
      , "  " ++ Raw.printTree typeOfE
      , "when typechecking expession"
      , "  " ++ show e
      ]

inferType :: Exp n -> Either String Type
inferType ETrue = return TBool
inferType EFalse = return TBool
inferType (ENat _) = return TNat
inferType (EIf eCond eThen eElse) = do
  typecheck eCond TBool
  typeOfThen <- inferType eThen
  typecheck eElse typeOfThen
  return typeOfThen
inferType (EAdd l r) = do
  typecheck l TNat
  typecheck r TNat
  return TNat
inferType (ESub l r) = do
  typecheck l TNat
  typecheck r TNat
  return TNat
inferType (EIsZero e) = do
  typecheck e TNat
  return TBool
inferType (ETyped e t) = typecheck e t
