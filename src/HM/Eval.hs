{-# LANGUAGE LambdaCase #-}
module HM.Eval where

import           HM.Parser.Abs
import           HM.Parser.Print
import           HM.Syntax       ()

-- $setup
-- >>> :set -XOverloadedStrings
-- >>> import HM.Parser.Print

-- >>> printTree <$> eval "if (iszero (2 - (1 + 1))) then true else 0"
-- Right "true"
-- >>> printTree <$> eval "if (iszero (2 - (true + 1))) then true else 0"
-- Left "Unsupported expression in addition"
eval :: Exp -> Either String Exp
eval ETrue = Right ETrue
eval EFalse = Right EFalse
eval (ENat n) = Right (ENat n)
eval (EAdd l r) = do
  l' <- eval l
  r' <- eval r
  case (l', r') of
    (ENat x, ENat y) -> Right (ENat (x + y))
    _                -> Left "Unsupported expression in addition"
eval (ESub l r) = do
  l' <- eval l
  r' <- eval r
  case (l', r') of
    (ENat x, ENat y) -> Right (ENat (x - y))
    _                -> Left "Unsupported expression in subtraction"
eval (EIf cond then_ else_) = do
  cond' <- eval cond
  case cond' of
    ETrue  -> eval then_
    EFalse -> eval else_
    _      -> Left "Unsupported condition in if statement"
eval (EIsZero n) = eval n >>= \case
  ENat n'
    | n' == 0   -> Right ETrue
    | otherwise -> Right EFalse
  _       -> Left "Unsupported expression in iszero"
eval (ETyped e _) = eval e
