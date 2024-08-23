module Main where

import HM.Interpret
import System.Exit

main :: IO ()
main = do
  sourceCode <- getContents
  case interpret sourceCode of
    Success output -> putStrLn output
    Failure errorKind errorMsg -> do
      putStrLn errorMsg
      exitWith (ExitFailure (errorCode errorKind))

errorCode :: ErrorKind -> Int
errorCode ParsingError = 1
errorCode TypecheckingError = 2
errorCode EvaluationError = 3
