module HM.Eval where

import HM.Parser.Abs

eval :: Exp -> Either String Exp
eval ETrue = Right ETrue
eval EFalse = Right EFalse
eval (ENat n) = Right (ENat n)
eval (EAdd l r) =
  case (eval l, eval r) of
    (Right (ENat l'), Right (ENat r')) -> Right (ENat (l' + r'))
    _ -> Left "Unsupported expression in addition"
eval (ESub l r) =
  case (eval l, eval r) of
    (Right (ENat l'), Right (ENat r')) -> Right (ENat (l' - r'))
    _ -> Left "Unsupported expression in subtraction"
eval (EIf cond then_ else_) =
  case eval cond of
    Right ETrue -> eval then_
    Right EFalse -> eval else_
    _ -> Left "Unsupported condition in if statement"
eval (EIsZero n) =
  case eval n of
    Right (ENat n') -> if n' == 0 then Right ETrue else Right EFalse
    _ -> Left "Unsupported expression in iszero"
eval (ETyped e _) = eval e
