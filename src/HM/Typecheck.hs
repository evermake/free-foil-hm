module HM.Typecheck where

import HM.Parser.Abs

-- | Typechecks an expression and maybe returns an error.
typecheck :: Exp -> Maybe String
typecheck e = case inferType e of
  Left _ -> Nothing
  Right err -> Just err

inferType :: Exp -> Either Type String
inferType ETrue = Left TBool
inferType EFalse = Left TBool
inferType (ENat _) = Left TNat
inferType (EIf eCond eThen eElse) = case inferType eCond of
  Left TBool -> case inferType eThen of
    Left tThen -> case inferType eElse of
      Left tElse ->
        if tThen == tElse
          then Left tThen
          else Right "If branches types do not match"
      Right err -> Right err
    Right err -> Right err
  Left t -> Right $ "Condition of if has type " ++ show t ++ " but should have type Bool"
  Right err -> Right err
inferType (EAdd l r) = case inferType l of
  Left TNat -> case inferType r of
    Left TNat -> Left TNat
    Left t -> Right $ "Right operand of + has type " ++ show t ++ " but should have type Nat"
    Right err -> Right err
  Left t -> Right $ "Left operand of + has type " ++ show t ++ " but should have type Nat"
  Right err -> Right err
inferType (ESub l r) = case inferType l of
  Left TNat -> case inferType r of
    Left TNat -> Left TNat
    Left t -> Right $ "Right operand of - has type " ++ show t ++ " but should have type Nat"
    Right err -> Right err
  Left t -> Right $ "Left operand of - has type " ++ show t ++ " but should have type Nat"
  Right err -> Right err
inferType (EIsZero e) = case inferType e of
  Left TNat -> Left TBool
  Left t -> Right $ "Operand of iszero has type " ++ show t ++ " but should have type Nat"
  Right err -> Right err
inferType (ETyped e t) = case inferType e of
  Left t' -> if t == t' then Left t else Right $ "Expression has type " ++ show t' ++ " but should have type " ++ show t
  Right err -> Right err
