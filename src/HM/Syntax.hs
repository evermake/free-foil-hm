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

instance IsString Type where
  fromString = unsafeParseType

unsafeParseType :: String -> Type
unsafeParseType input =
  case pType tokens of
    Left err    -> error ("cannot parse Type: " ++ err)
    Right type_ -> type_
  where
    tokens = myLexer input
