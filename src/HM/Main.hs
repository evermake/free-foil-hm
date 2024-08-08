module HM.Main where

import HM.Interpreter.Interpret
import HM.Parser.AbsHM
import HM.Parser.ErrM
import HM.Parser.LexHM
import HM.Parser.ParHM

main = do
  interact calc
  putStrLn ""

calc s =
  let Ok e = pExp (myLexer s)
   in interpret e
