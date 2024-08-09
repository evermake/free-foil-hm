module HM.Eval where

import HM.Parser.Abs

interpret :: Exp -> String
interpret ETrue = "true"
interpret EFalse = "false"
interpret (ENat nat) = show nat
interpret (EAdd l r) = "(" ++ interpret l ++ " + " ++ interpret r ++ ")"
