module HM.Eval where

import HM.Parser.Abs

interpret :: Exp -> Either String Exp
interpret ETrue = Right ETrue
interpret EFalse = Right EFalse
interpret (ENat n) = Right (ENat n)
interpret (EAdd l r) =
  case (interpret l, interpret r) of
    (Right (ENat l'), Right (ENat r')) -> Right (ENat (l' + r'))
    _ -> Left "Unsupported expression in addition"
interpret (ESub l r) =
  case (interpret l, interpret r) of
    (Right (ENat l'), Right (ENat r')) -> Right (ENat (l' - r'))
    _ -> Left "Unsupported expression in subtraction"
interpret (EIf cond then_ else_) =
  case interpret cond of
    Right ETrue -> interpret then_
    Right EFalse -> interpret else_
    _ -> Left "Unsupported condition in if statement"
interpret (EIsZero n) =
  case interpret n of
    Right (ENat n') -> if n' == 0 then Right ETrue else Right EFalse
    _ -> Left "Unsupported expression in iszero"
