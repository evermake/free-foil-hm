-- File generated by the BNF Converter (bnfc 2.9.5).

-- Templates for pattern matching on abstract syntax

{-# OPTIONS_GHC -fno-warn-unused-matches #-}

module HM.Parser.Skel where

import Prelude (($), Either(..), String, (++), Show, show)
import qualified HM.Parser.Abs

type Err = Either String
type Result = Err String

failure :: Show a => a -> Result
failure x = Left $ "Undefined case: " ++ show x

transIdent :: HM.Parser.Abs.Ident -> Result
transIdent x = case x of
  HM.Parser.Abs.Ident string -> failure x

transPattern :: HM.Parser.Abs.Pattern -> Result
transPattern x = case x of
  HM.Parser.Abs.PatternVar ident -> failure x

transExp :: HM.Parser.Abs.Exp -> Result
transExp x = case x of
  HM.Parser.Abs.EVar ident -> failure x
  HM.Parser.Abs.ETrue -> failure x
  HM.Parser.Abs.EFalse -> failure x
  HM.Parser.Abs.ENat integer -> failure x
  HM.Parser.Abs.EAdd exp1 exp2 -> failure x
  HM.Parser.Abs.ESub exp1 exp2 -> failure x
  HM.Parser.Abs.EIf exp1 exp2 exp3 -> failure x
  HM.Parser.Abs.EIsZero exp -> failure x
  HM.Parser.Abs.ETyped exp type_ -> failure x
  HM.Parser.Abs.ELet pattern_ exp scopedexp -> failure x

transScopedExp :: HM.Parser.Abs.ScopedExp -> Result
transScopedExp x = case x of
  HM.Parser.Abs.ScopedExp exp -> failure x

transType :: HM.Parser.Abs.Type -> Result
transType x = case x of
  HM.Parser.Abs.TNat -> failure x
  HM.Parser.Abs.TBool -> failure x