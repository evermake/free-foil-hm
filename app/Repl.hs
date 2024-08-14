module Main where

import HM.Eval
import HM.Parser.Abs
import HM.Parser.Par
import HM.Typecheck

main :: IO ()
main = interact (unlines . map calc . lines)

calc :: String -> String
calc input =
  "-- " ++ case pCommand tokens of
    Left err -> "ERROR: " ++ err
    Right cmd ->
      case cmd of
        CommandCheck typedExp -> typecheck typedExp
        CommandEval exp -> show (interpret exp)
  where
    tokens = myLexer input
