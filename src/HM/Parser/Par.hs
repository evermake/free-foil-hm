{-# OPTIONS_GHC -w #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
{-# LANGUAGE PatternSynonyms #-}

module HM.Parser.Par
  ( happyError
  , myLexer
  , pPattern
  , pExp3
  , pExp2
  , pExp1
  , pExp
  , pScopedExp
  , pType
  ) where

import Prelude

import qualified HM.Parser.Abs
import HM.Parser.Lex
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn10 (HM.Parser.Abs.Ident)
	| HappyAbsSyn11 (Integer)
	| HappyAbsSyn12 (HM.Parser.Abs.Pattern)
	| HappyAbsSyn13 (HM.Parser.Abs.Exp)
	| HappyAbsSyn17 (HM.Parser.Abs.ScopedExp)
	| HappyAbsSyn18 (HM.Parser.Abs.Type)

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52 :: () => Prelude.Int -> ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13,
 happyReduce_14,
 happyReduce_15,
 happyReduce_16,
 happyReduce_17,
 happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23,
 happyReduce_24,
 happyReduce_25,
 happyReduce_26 :: () => ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,134) ([0,0,4,128,449,4096,14624,0,27650,7,32832,237,2048,7600,0,192,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,1,0,0,0,0,0,4096,15200,0,0,0,32832,237,2048,0,0,0,1,0,0,0,0,0,8,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,2052,14,128,449,0,12,0,64,0,32832,237,0,512,0,2,0,0,0,1024,3800,0,1,0,24592,59,0,0,0,0,0,0,0,0,8,0,0,0,1024,0,128,475,4096,15200,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pPattern","%start_pExp3","%start_pExp2","%start_pExp1","%start_pExp","%start_pScopedExp","%start_pType","Ident","Integer","Pattern","Exp3","Exp2","Exp1","Exp","ScopedExp","Type","'('","')'","'+'","'-'","':'","'='","'Bool'","'Nat'","'else'","'false'","'if'","'in'","'iszero'","'let'","'then'","'true'","L_Ident","L_integ","%eof"]
        bit_start = st Prelude.* 37
        bit_end = (st Prelude.+ 1) Prelude.* 37
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..36]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (35) = happyShift action_8
action_0 (10) = happyGoto action_30
action_0 (12) = happyGoto action_31
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (19) = happyShift action_18
action_1 (28) = happyShift action_19
action_1 (34) = happyShift action_23
action_1 (35) = happyShift action_8
action_1 (36) = happyShift action_24
action_1 (10) = happyGoto action_12
action_1 (11) = happyGoto action_13
action_1 (13) = happyGoto action_29
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (19) = happyShift action_18
action_2 (28) = happyShift action_19
action_2 (31) = happyShift action_21
action_2 (34) = happyShift action_23
action_2 (35) = happyShift action_8
action_2 (36) = happyShift action_24
action_2 (10) = happyGoto action_12
action_2 (11) = happyGoto action_13
action_2 (13) = happyGoto action_14
action_2 (14) = happyGoto action_28
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (19) = happyShift action_18
action_3 (28) = happyShift action_19
action_3 (29) = happyShift action_20
action_3 (31) = happyShift action_21
action_3 (32) = happyShift action_22
action_3 (34) = happyShift action_23
action_3 (35) = happyShift action_8
action_3 (36) = happyShift action_24
action_3 (10) = happyGoto action_12
action_3 (11) = happyGoto action_13
action_3 (13) = happyGoto action_14
action_3 (14) = happyGoto action_15
action_3 (15) = happyGoto action_27
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (19) = happyShift action_18
action_4 (28) = happyShift action_19
action_4 (29) = happyShift action_20
action_4 (31) = happyShift action_21
action_4 (32) = happyShift action_22
action_4 (34) = happyShift action_23
action_4 (35) = happyShift action_8
action_4 (36) = happyShift action_24
action_4 (10) = happyGoto action_12
action_4 (11) = happyGoto action_13
action_4 (13) = happyGoto action_14
action_4 (14) = happyGoto action_15
action_4 (15) = happyGoto action_25
action_4 (16) = happyGoto action_26
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (19) = happyShift action_18
action_5 (28) = happyShift action_19
action_5 (29) = happyShift action_20
action_5 (31) = happyShift action_21
action_5 (32) = happyShift action_22
action_5 (34) = happyShift action_23
action_5 (35) = happyShift action_8
action_5 (36) = happyShift action_24
action_5 (10) = happyGoto action_12
action_5 (11) = happyGoto action_13
action_5 (13) = happyGoto action_14
action_5 (14) = happyGoto action_15
action_5 (15) = happyGoto action_16
action_5 (17) = happyGoto action_17
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (25) = happyShift action_10
action_6 (26) = happyShift action_11
action_6 (18) = happyGoto action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (35) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_7

action_9 (37) = happyAccept
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_26

action_11 _ = happyReduce_25

action_12 _ = happyReduce_10

action_13 _ = happyReduce_13

action_14 _ = happyReduce_18

action_15 (21) = happyShift action_32
action_15 (22) = happyShift action_33
action_15 _ = happyReduce_21

action_16 _ = happyReduce_24

action_17 (37) = happyAccept
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (19) = happyShift action_18
action_18 (28) = happyShift action_19
action_18 (29) = happyShift action_20
action_18 (31) = happyShift action_21
action_18 (32) = happyShift action_22
action_18 (34) = happyShift action_23
action_18 (35) = happyShift action_8
action_18 (36) = happyShift action_24
action_18 (10) = happyGoto action_12
action_18 (11) = happyGoto action_13
action_18 (13) = happyGoto action_14
action_18 (14) = happyGoto action_15
action_18 (15) = happyGoto action_25
action_18 (16) = happyGoto action_38
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_12

action_20 (19) = happyShift action_18
action_20 (28) = happyShift action_19
action_20 (29) = happyShift action_20
action_20 (31) = happyShift action_21
action_20 (32) = happyShift action_22
action_20 (34) = happyShift action_23
action_20 (35) = happyShift action_8
action_20 (36) = happyShift action_24
action_20 (10) = happyGoto action_12
action_20 (11) = happyGoto action_13
action_20 (13) = happyGoto action_14
action_20 (14) = happyGoto action_15
action_20 (15) = happyGoto action_37
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (19) = happyShift action_36
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (35) = happyShift action_8
action_22 (10) = happyGoto action_30
action_22 (12) = happyGoto action_35
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_11

action_24 _ = happyReduce_8

action_25 (23) = happyShift action_34
action_25 _ = happyReduce_23

action_26 (37) = happyAccept
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (37) = happyAccept
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (21) = happyShift action_32
action_28 (22) = happyShift action_33
action_28 (37) = happyAccept
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (37) = happyAccept
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_9

action_31 (37) = happyAccept
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (19) = happyShift action_18
action_32 (28) = happyShift action_19
action_32 (34) = happyShift action_23
action_32 (35) = happyShift action_8
action_32 (36) = happyShift action_24
action_32 (10) = happyGoto action_12
action_32 (11) = happyGoto action_13
action_32 (13) = happyGoto action_45
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (19) = happyShift action_18
action_33 (28) = happyShift action_19
action_33 (34) = happyShift action_23
action_33 (35) = happyShift action_8
action_33 (36) = happyShift action_24
action_33 (10) = happyGoto action_12
action_33 (11) = happyGoto action_13
action_33 (13) = happyGoto action_44
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (25) = happyShift action_10
action_34 (26) = happyShift action_11
action_34 (18) = happyGoto action_43
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (24) = happyShift action_42
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (19) = happyShift action_18
action_36 (28) = happyShift action_19
action_36 (29) = happyShift action_20
action_36 (31) = happyShift action_21
action_36 (32) = happyShift action_22
action_36 (34) = happyShift action_23
action_36 (35) = happyShift action_8
action_36 (36) = happyShift action_24
action_36 (10) = happyGoto action_12
action_36 (11) = happyGoto action_13
action_36 (13) = happyGoto action_14
action_36 (14) = happyGoto action_15
action_36 (15) = happyGoto action_25
action_36 (16) = happyGoto action_41
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (33) = happyShift action_40
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (20) = happyShift action_39
action_38 _ = happyFail (happyExpListPerState 38)

action_39 _ = happyReduce_14

action_40 (19) = happyShift action_18
action_40 (28) = happyShift action_19
action_40 (29) = happyShift action_20
action_40 (31) = happyShift action_21
action_40 (32) = happyShift action_22
action_40 (34) = happyShift action_23
action_40 (35) = happyShift action_8
action_40 (36) = happyShift action_24
action_40 (10) = happyGoto action_12
action_40 (11) = happyGoto action_13
action_40 (13) = happyGoto action_14
action_40 (14) = happyGoto action_15
action_40 (15) = happyGoto action_48
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (20) = happyShift action_47
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (19) = happyShift action_18
action_42 (28) = happyShift action_19
action_42 (29) = happyShift action_20
action_42 (31) = happyShift action_21
action_42 (32) = happyShift action_22
action_42 (34) = happyShift action_23
action_42 (35) = happyShift action_8
action_42 (36) = happyShift action_24
action_42 (10) = happyGoto action_12
action_42 (11) = happyGoto action_13
action_42 (13) = happyGoto action_14
action_42 (14) = happyGoto action_15
action_42 (15) = happyGoto action_46
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_22

action_44 _ = happyReduce_16

action_45 _ = happyReduce_15

action_46 (30) = happyShift action_50
action_46 _ = happyFail (happyExpListPerState 46)

action_47 _ = happyReduce_17

action_48 (27) = happyShift action_49
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (19) = happyShift action_18
action_49 (28) = happyShift action_19
action_49 (29) = happyShift action_20
action_49 (31) = happyShift action_21
action_49 (32) = happyShift action_22
action_49 (34) = happyShift action_23
action_49 (35) = happyShift action_8
action_49 (36) = happyShift action_24
action_49 (10) = happyGoto action_12
action_49 (11) = happyGoto action_13
action_49 (13) = happyGoto action_14
action_49 (14) = happyGoto action_15
action_49 (15) = happyGoto action_52
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (19) = happyShift action_18
action_50 (28) = happyShift action_19
action_50 (29) = happyShift action_20
action_50 (31) = happyShift action_21
action_50 (32) = happyShift action_22
action_50 (34) = happyShift action_23
action_50 (35) = happyShift action_8
action_50 (36) = happyShift action_24
action_50 (10) = happyGoto action_12
action_50 (11) = happyGoto action_13
action_50 (13) = happyGoto action_14
action_50 (14) = happyGoto action_15
action_50 (15) = happyGoto action_16
action_50 (17) = happyGoto action_51
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_20

action_52 _ = happyReduce_19

happyReduce_7 = happySpecReduce_1  10 happyReduction_7
happyReduction_7 (HappyTerminal (PT _ (TV happy_var_1)))
	 =  HappyAbsSyn10
		 (HM.Parser.Abs.Ident happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  11 happyReduction_8
happyReduction_8 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn11
		 ((read happy_var_1) :: Integer
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  12 happyReduction_9
happyReduction_9 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn12
		 (HM.Parser.Abs.PatternVar happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  13 happyReduction_10
happyReduction_10 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn13
		 (HM.Parser.Abs.EVar happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  13 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn13
		 (HM.Parser.Abs.ETrue
	)

happyReduce_12 = happySpecReduce_1  13 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn13
		 (HM.Parser.Abs.EFalse
	)

happyReduce_13 = happySpecReduce_1  13 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn13
		 (HM.Parser.Abs.ENat happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  13 happyReduction_14
happyReduction_14 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (happy_var_2
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  14 happyReduction_15
happyReduction_15 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (HM.Parser.Abs.EAdd happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  14 happyReduction_16
happyReduction_16 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (HM.Parser.Abs.ESub happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 4 14 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (HM.Parser.Abs.EIsZero happy_var_3
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_1  14 happyReduction_18
happyReduction_18 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happyReduce 6 15 happyReduction_19
happyReduction_19 ((HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (HM.Parser.Abs.EIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_20 = happyReduce 6 15 happyReduction_20
happyReduction_20 ((HappyAbsSyn17  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn13
		 (HM.Parser.Abs.ELet happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_1  15 happyReduction_21
happyReduction_21 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  16 happyReduction_22
happyReduction_22 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (HM.Parser.Abs.ETyped happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  16 happyReduction_23
happyReduction_23 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  17 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn17
		 (HM.Parser.Abs.ScopedExp happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  18 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn18
		 (HM.Parser.Abs.TNat
	)

happyReduce_26 = happySpecReduce_1  18 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn18
		 (HM.Parser.Abs.TBool
	)

happyNewToken action sts stk [] =
	action 37 37 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 19;
	PT _ (TS _ 2) -> cont 20;
	PT _ (TS _ 3) -> cont 21;
	PT _ (TS _ 4) -> cont 22;
	PT _ (TS _ 5) -> cont 23;
	PT _ (TS _ 6) -> cont 24;
	PT _ (TS _ 7) -> cont 25;
	PT _ (TS _ 8) -> cont 26;
	PT _ (TS _ 9) -> cont 27;
	PT _ (TS _ 10) -> cont 28;
	PT _ (TS _ 11) -> cont 29;
	PT _ (TS _ 12) -> cont 30;
	PT _ (TS _ 13) -> cont 31;
	PT _ (TS _ 14) -> cont 32;
	PT _ (TS _ 15) -> cont 33;
	PT _ (TS _ 16) -> cont 34;
	PT _ (TV happy_dollar_dollar) -> cont 35;
	PT _ (TI happy_dollar_dollar) -> cont 36;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 37 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = ((>>=))
happyReturn :: () => a -> Err a
happyReturn = (return)
happyThen1 m k tks = ((>>=)) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> Err a
happyError' = (\(tokens, _) -> happyError tokens)
pPattern tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn12 z -> happyReturn z; _other -> notHappyAtAll })

pExp3 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn13 z -> happyReturn z; _other -> notHappyAtAll })

pExp2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn13 z -> happyReturn z; _other -> notHappyAtAll })

pExp1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn13 z -> happyReturn z; _other -> notHappyAtAll })

pExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn13 z -> happyReturn z; _other -> notHappyAtAll })

pScopedExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn17 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_6 tks) (\x -> case x of {HappyAbsSyn18 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


type Err = Either String

happyError :: [Token] -> Err a
happyError ts = Left $
  "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ (prToken t) ++ "'"

myLexer :: String -> [Token]
myLexer = tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
