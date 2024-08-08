module Main where

import HM.Interpreter.Interpret
import HM.Parser.AbsHM
import HM.Parser.LexHM
import HM.Parser.ParHM

main :: IO ()
main = do
  interact calc
  putStrLn ""

calc :: String -> String
calc input = do
  let tokens = myLexer input
  case pExp tokens of
    Left err -> "ERROR: " ++ err
    Right exp -> interpret exp
