module Main where

import HM.Eval
import HM.Parser.Abs
import HM.Parser.Par
import HM.Typecheck

main :: IO ()
main = do
  putStrLn "Welcome to REPL!\n"
  interact (unlines . map repl . lines)

repl :: String -> String
repl input =
  case pExp tokens of
    Left err -> "Parsing error: " ++ err
    Right e -> case typecheck e of
      Just err -> "Typechecking error: " ++ err
      Nothing -> case eval e of
        Left err -> "Evaluation error: " ++ err
        Right outExp -> case outExp of
          (ENat n) -> show n
          ETrue -> "true"
          EFalse -> "false"
          other -> show other
  where
    tokens = myLexer input
