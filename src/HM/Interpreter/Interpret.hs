module HM.Interpreter.Interpret where

import HM.Parser.AbsHM

interpret :: Exp -> String
interpret ETrue = "true"
interpret EFalse = "false"
interpret (ENat nat) = show nat
interpret (EAdd l r) = "(" ++ interpret l ++ " + " ++ interpret r ++ ")"
