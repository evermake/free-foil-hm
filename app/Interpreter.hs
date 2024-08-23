module Main where

import Control.Monad.Foil (emptyScope)
import HM.Eval
import HM.Parser.Par
import HM.Syntax (toExpClosed)
import HM.Typecheck
import System.Exit

data Result
  = Success String -- Output of evaluation.
  | Failure Int String -- Exit code and error message.

main :: IO ()
main = do
  sourceCode <- getContents
  case run sourceCode of
    Success output -> putStrLn output
    Failure code msg -> do
      putStrLn msg
      exitWith (ExitFailure code)

run :: String -> Result
run input =
  case toExpClosed <$> pExp tokens of
    Left err -> Failure 1 ("Parsing error: " ++ err)
    Right e -> case inferType e of
      Left err -> Failure 2 ("Typechecking error: " ++ err)
      Right _type -> case eval emptyScope e of
        Left err -> Failure 3 ("Evaluation error: " ++ err)
        Right outExp -> Success (show outExp)
  where
    tokens = myLexer input
