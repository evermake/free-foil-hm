module Main where

import           HM.Interpreter.Typecheck
import           HM.Parser.ParHM

main :: IO ()
main = do
  interact calc
  putStrLn ""

calc :: String -> String
calc input = do
  let tokens = myLexer input
  case pTypedExp tokens of
    Left err       -> "ERROR: " ++ err
    Right typedExp -> typecheck typedExp
