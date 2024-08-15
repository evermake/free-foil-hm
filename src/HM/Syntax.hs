{-# OPTIONS_GHC -Wno-orphans #-}
module HM.Syntax where

import           Data.String   (IsString (..))
import           HM.Parser.Abs
import           HM.Parser.Par

instance IsString Exp where
  fromString = unsafeParseExp

unsafeParseExp :: String -> Exp
unsafeParseExp input =
  case pExp tokens of
    Left err -> error ("cannot parse Exp: " ++ err)
    Right e  -> e
  where
    tokens = myLexer input
