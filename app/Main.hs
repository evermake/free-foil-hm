module Main where

import           HM.Interpreter.Interpret
import           HM.Interpreter.Typecheck
import           HM.Parser.AbsHM
import           HM.Parser.ParHM

main :: IO ()
main = interact (unlines . map calc . lines)

calc :: String -> String
calc input = "-- " ++
  case pCommand tokens of
    Left err       -> "ERROR: " ++ err
    Right cmd ->
      case cmd of
        CommandCheck typedExp -> typecheck typedExp
        CommandEval exp -> interpret exp
  where
    tokens = myLexer input
