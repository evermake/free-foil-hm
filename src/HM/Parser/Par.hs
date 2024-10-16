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
  , pScopedType
  , pTerm
  , pScopedTerm
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
	| HappyAbsSyn13 (HM.Parser.Abs.Ident)
	| HappyAbsSyn14 (Integer)
	| HappyAbsSyn15 (HM.Parser.Abs.UVarIdent)
	| HappyAbsSyn16 (HM.Parser.Abs.Pattern)
	| HappyAbsSyn17 (HM.Parser.Abs.Exp)
	| HappyAbsSyn21 (HM.Parser.Abs.ScopedExp)
	| HappyAbsSyn22 (HM.Parser.Abs.Type)
	| HappyAbsSyn23 (HM.Parser.Abs.ScopedType)
	| HappyAbsSyn24 (HM.Parser.Abs.Term)
	| HappyAbsSyn25 (HM.Parser.Abs.ScopedTerm)

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
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86,
 action_87,
 action_88,
 action_89,
 action_90,
 action_91,
 action_92,
 action_93,
 action_94,
 action_95,
 action_96 :: () => Prelude.Int -> ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

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
 happyReduce_26,
 happyReduce_27,
 happyReduce_28,
 happyReduce_29,
 happyReduce_30,
 happyReduce_31,
 happyReduce_32,
 happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38,
 happyReduce_39,
 happyReduce_40,
 happyReduce_41,
 happyReduce_42,
 happyReduce_43 :: () => ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,357) ([0,0,0,8,0,32769,3200,0,128,18496,6,16384,24576,1005,0,32,63152,1,4096,22528,251,0,12288,40976,0,0,2072,80,0,3074,16239,0,256,46982,31,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6144,0,0,0,34945,3216,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,8,32172,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,0,1,8192,45056,502,0,16,0,0,0,0,32,0,0,0,0,0,0,8,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32784,51464,0,24576,0,0,0,0,0,0,0,0,0,0,0,0,0,128,16448,6,16384,8192,800,0,384,0,0,0,8288,320,0,12288,40976,0,0,2,0,0,64,0,0,0,1,0,32768,49152,2010,0,64,13346,3,0,4,0,0,0,128,0,4096,0,0,0,6144,20488,0,8192,0,0,0,0,0,0,0,4,0,0,33152,1280,0,32,63152,1,8192,0,0,0,8,32172,0,1024,54784,62,0,3072,10244,0,0,0,0,0,2056,0,0,0,0,0,0,0,0,0,0,0,0,32768,1,0,0,0,0,0,512,12560,25,0,0,0,0,128,18532,6,0,0,0,0,32,63152,1,4096,2180,201,0,8,32172,0,1024,54784,62,0,2,8043,0,0,0,0,0,0,0,0,0,0,0,8192,45056,502,0,32784,51465,0,0,256,0,0,4,16086,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pPattern","%start_pExp3","%start_pExp2","%start_pExp1","%start_pExp","%start_pScopedExp","%start_pType","%start_pScopedType","%start_pTerm","%start_pScopedTerm","Ident","Integer","UVarIdent","Pattern","Exp3","Exp2","Exp1","Exp","ScopedExp","Type","ScopedType","Term","ScopedTerm","'('","')'","'+'","'-'","'->'","'.'","'..'","':'","'='","'Bool'","'Nat'","'['","']'","'do'","'else'","'false'","'for'","'forall'","'if'","'in'","'iszero'","'let'","'then'","'true'","'\923'","'\955'","L_Ident","L_integ","L_UVarIdent","%eof"]
        bit_start = st Prelude.* 55
        bit_end = (st Prelude.+ 1) Prelude.* 55
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..54]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (52) = happyShift action_11
action_0 (13) = happyGoto action_48
action_0 (16) = happyGoto action_49
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (26) = happyShift action_22
action_1 (41) = happyShift action_25
action_1 (49) = happyShift action_31
action_1 (52) = happyShift action_11
action_1 (53) = happyShift action_34
action_1 (13) = happyGoto action_41
action_1 (14) = happyGoto action_13
action_1 (17) = happyGoto action_47
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (26) = happyShift action_22
action_2 (41) = happyShift action_25
action_2 (46) = happyShift action_29
action_2 (49) = happyShift action_31
action_2 (52) = happyShift action_11
action_2 (53) = happyShift action_34
action_2 (13) = happyGoto action_41
action_2 (14) = happyGoto action_13
action_2 (17) = happyGoto action_15
action_2 (18) = happyGoto action_46
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (26) = happyShift action_22
action_3 (41) = happyShift action_25
action_3 (42) = happyShift action_26
action_3 (44) = happyShift action_28
action_3 (46) = happyShift action_29
action_3 (47) = happyShift action_30
action_3 (49) = happyShift action_31
action_3 (50) = happyShift action_32
action_3 (51) = happyShift action_33
action_3 (52) = happyShift action_11
action_3 (53) = happyShift action_34
action_3 (13) = happyGoto action_41
action_3 (14) = happyGoto action_13
action_3 (17) = happyGoto action_15
action_3 (18) = happyGoto action_16
action_3 (19) = happyGoto action_45
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (26) = happyShift action_22
action_4 (41) = happyShift action_25
action_4 (42) = happyShift action_26
action_4 (44) = happyShift action_28
action_4 (46) = happyShift action_29
action_4 (47) = happyShift action_30
action_4 (49) = happyShift action_31
action_4 (50) = happyShift action_32
action_4 (51) = happyShift action_33
action_4 (52) = happyShift action_11
action_4 (53) = happyShift action_34
action_4 (13) = happyGoto action_41
action_4 (14) = happyGoto action_13
action_4 (17) = happyGoto action_15
action_4 (18) = happyGoto action_16
action_4 (19) = happyGoto action_17
action_4 (20) = happyGoto action_44
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (26) = happyShift action_22
action_5 (41) = happyShift action_25
action_5 (42) = happyShift action_26
action_5 (44) = happyShift action_28
action_5 (46) = happyShift action_29
action_5 (47) = happyShift action_30
action_5 (49) = happyShift action_31
action_5 (50) = happyShift action_32
action_5 (51) = happyShift action_33
action_5 (52) = happyShift action_11
action_5 (53) = happyShift action_34
action_5 (13) = happyGoto action_41
action_5 (14) = happyGoto action_13
action_5 (17) = happyGoto action_15
action_5 (18) = happyGoto action_16
action_5 (19) = happyGoto action_42
action_5 (21) = happyGoto action_43
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (35) = happyShift action_23
action_6 (36) = happyShift action_24
action_6 (43) = happyShift action_27
action_6 (52) = happyShift action_11
action_6 (54) = happyShift action_35
action_6 (13) = happyGoto action_37
action_6 (15) = happyGoto action_14
action_6 (22) = happyGoto action_40
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (35) = happyShift action_23
action_7 (36) = happyShift action_24
action_7 (43) = happyShift action_27
action_7 (52) = happyShift action_11
action_7 (54) = happyShift action_35
action_7 (13) = happyGoto action_37
action_7 (15) = happyGoto action_14
action_7 (22) = happyGoto action_38
action_7 (23) = happyGoto action_39
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (26) = happyShift action_22
action_8 (35) = happyShift action_23
action_8 (36) = happyShift action_24
action_8 (41) = happyShift action_25
action_8 (42) = happyShift action_26
action_8 (43) = happyShift action_27
action_8 (44) = happyShift action_28
action_8 (46) = happyShift action_29
action_8 (47) = happyShift action_30
action_8 (49) = happyShift action_31
action_8 (50) = happyShift action_32
action_8 (51) = happyShift action_33
action_8 (52) = happyShift action_11
action_8 (53) = happyShift action_34
action_8 (54) = happyShift action_35
action_8 (13) = happyGoto action_12
action_8 (14) = happyGoto action_13
action_8 (15) = happyGoto action_14
action_8 (17) = happyGoto action_15
action_8 (18) = happyGoto action_16
action_8 (19) = happyGoto action_17
action_8 (20) = happyGoto action_18
action_8 (22) = happyGoto action_19
action_8 (24) = happyGoto action_36
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (26) = happyShift action_22
action_9 (35) = happyShift action_23
action_9 (36) = happyShift action_24
action_9 (41) = happyShift action_25
action_9 (42) = happyShift action_26
action_9 (43) = happyShift action_27
action_9 (44) = happyShift action_28
action_9 (46) = happyShift action_29
action_9 (47) = happyShift action_30
action_9 (49) = happyShift action_31
action_9 (50) = happyShift action_32
action_9 (51) = happyShift action_33
action_9 (52) = happyShift action_11
action_9 (53) = happyShift action_34
action_9 (54) = happyShift action_35
action_9 (13) = happyGoto action_12
action_9 (14) = happyGoto action_13
action_9 (15) = happyGoto action_14
action_9 (17) = happyGoto action_15
action_9 (18) = happyGoto action_16
action_9 (19) = happyGoto action_17
action_9 (20) = happyGoto action_18
action_9 (22) = happyGoto action_19
action_9 (24) = happyGoto action_20
action_9 (25) = happyGoto action_21
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (52) = happyShift action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 _ = happyReduce_10

action_12 (30) = happyReduce_38
action_12 (55) = happyReduce_38
action_12 _ = happyReduce_14

action_13 _ = happyReduce_17

action_14 _ = happyReduce_34

action_15 _ = happyReduce_22

action_16 (28) = happyShift action_50
action_16 (29) = happyShift action_51
action_16 _ = happyReduce_30

action_17 (26) = happyShift action_22
action_17 (33) = happyShift action_63
action_17 (37) = happyShift action_53
action_17 (41) = happyShift action_25
action_17 (46) = happyShift action_29
action_17 (49) = happyShift action_31
action_17 (52) = happyShift action_11
action_17 (53) = happyShift action_34
action_17 (13) = happyGoto action_41
action_17 (14) = happyGoto action_13
action_17 (17) = happyGoto action_15
action_17 (18) = happyGoto action_52
action_17 _ = happyReduce_32

action_18 _ = happyReduce_41

action_19 (30) = happyShift action_54
action_19 _ = happyReduce_42

action_20 _ = happyReduce_43

action_21 (55) = happyAccept
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (26) = happyShift action_22
action_22 (41) = happyShift action_25
action_22 (42) = happyShift action_26
action_22 (44) = happyShift action_28
action_22 (46) = happyShift action_29
action_22 (47) = happyShift action_30
action_22 (49) = happyShift action_31
action_22 (50) = happyShift action_32
action_22 (51) = happyShift action_33
action_22 (52) = happyShift action_11
action_22 (53) = happyShift action_34
action_22 (13) = happyGoto action_41
action_22 (14) = happyGoto action_13
action_22 (17) = happyGoto action_15
action_22 (18) = happyGoto action_16
action_22 (19) = happyGoto action_17
action_22 (20) = happyGoto action_62
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_36

action_24 _ = happyReduce_35

action_25 _ = happyReduce_16

action_26 (52) = happyShift action_11
action_26 (13) = happyGoto action_48
action_26 (16) = happyGoto action_61
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (52) = happyShift action_11
action_27 (13) = happyGoto action_48
action_27 (16) = happyGoto action_60
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (26) = happyShift action_22
action_28 (41) = happyShift action_25
action_28 (42) = happyShift action_26
action_28 (44) = happyShift action_28
action_28 (46) = happyShift action_29
action_28 (47) = happyShift action_30
action_28 (49) = happyShift action_31
action_28 (50) = happyShift action_32
action_28 (51) = happyShift action_33
action_28 (52) = happyShift action_11
action_28 (53) = happyShift action_34
action_28 (13) = happyGoto action_41
action_28 (14) = happyGoto action_13
action_28 (17) = happyGoto action_15
action_28 (18) = happyGoto action_16
action_28 (19) = happyGoto action_59
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (26) = happyShift action_58
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (52) = happyShift action_11
action_30 (13) = happyGoto action_48
action_30 (16) = happyGoto action_57
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_15

action_32 (52) = happyShift action_11
action_32 (13) = happyGoto action_48
action_32 (16) = happyGoto action_56
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (52) = happyShift action_11
action_33 (13) = happyGoto action_48
action_33 (16) = happyGoto action_55
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_11

action_35 _ = happyReduce_12

action_36 (55) = happyAccept
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_38

action_38 (30) = happyShift action_54
action_38 _ = happyReduce_40

action_39 (55) = happyAccept
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (30) = happyShift action_54
action_40 (55) = happyAccept
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_14

action_42 (26) = happyShift action_22
action_42 (37) = happyShift action_53
action_42 (41) = happyShift action_25
action_42 (46) = happyShift action_29
action_42 (49) = happyShift action_31
action_42 (52) = happyShift action_11
action_42 (53) = happyShift action_34
action_42 (13) = happyGoto action_41
action_42 (14) = happyGoto action_13
action_42 (17) = happyGoto action_15
action_42 (18) = happyGoto action_52
action_42 _ = happyReduce_33

action_43 (55) = happyAccept
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (55) = happyAccept
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (26) = happyShift action_22
action_45 (37) = happyShift action_53
action_45 (41) = happyShift action_25
action_45 (46) = happyShift action_29
action_45 (49) = happyShift action_31
action_45 (52) = happyShift action_11
action_45 (53) = happyShift action_34
action_45 (55) = happyAccept
action_45 (13) = happyGoto action_41
action_45 (14) = happyGoto action_13
action_45 (17) = happyGoto action_15
action_45 (18) = happyGoto action_52
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (28) = happyShift action_50
action_46 (29) = happyShift action_51
action_46 (55) = happyAccept
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (55) = happyAccept
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_13

action_49 (55) = happyAccept
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (26) = happyShift action_22
action_50 (41) = happyShift action_25
action_50 (49) = happyShift action_31
action_50 (52) = happyShift action_11
action_50 (53) = happyShift action_34
action_50 (13) = happyGoto action_41
action_50 (14) = happyGoto action_13
action_50 (17) = happyGoto action_76
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (26) = happyShift action_22
action_51 (41) = happyShift action_25
action_51 (49) = happyShift action_31
action_51 (52) = happyShift action_11
action_51 (53) = happyShift action_34
action_51 (13) = happyGoto action_41
action_51 (14) = happyGoto action_13
action_51 (17) = happyGoto action_75
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (28) = happyShift action_50
action_52 (29) = happyShift action_51
action_52 _ = happyReduce_26

action_53 (35) = happyShift action_23
action_53 (36) = happyShift action_24
action_53 (43) = happyShift action_27
action_53 (52) = happyShift action_11
action_53 (54) = happyShift action_35
action_53 (13) = happyGoto action_37
action_53 (15) = happyGoto action_14
action_53 (22) = happyGoto action_74
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (35) = happyShift action_23
action_54 (36) = happyShift action_24
action_54 (43) = happyShift action_27
action_54 (52) = happyShift action_11
action_54 (54) = happyShift action_35
action_54 (13) = happyGoto action_37
action_54 (15) = happyGoto action_14
action_54 (22) = happyGoto action_73
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (33) = happyShift action_72
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (31) = happyShift action_71
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (34) = happyShift action_70
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (26) = happyShift action_22
action_58 (41) = happyShift action_25
action_58 (42) = happyShift action_26
action_58 (44) = happyShift action_28
action_58 (46) = happyShift action_29
action_58 (47) = happyShift action_30
action_58 (49) = happyShift action_31
action_58 (50) = happyShift action_32
action_58 (51) = happyShift action_33
action_58 (52) = happyShift action_11
action_58 (53) = happyShift action_34
action_58 (13) = happyGoto action_41
action_58 (14) = happyGoto action_13
action_58 (17) = happyGoto action_15
action_58 (18) = happyGoto action_16
action_58 (19) = happyGoto action_17
action_58 (20) = happyGoto action_69
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (26) = happyShift action_22
action_59 (37) = happyShift action_53
action_59 (41) = happyShift action_25
action_59 (46) = happyShift action_29
action_59 (48) = happyShift action_68
action_59 (49) = happyShift action_31
action_59 (52) = happyShift action_11
action_59 (53) = happyShift action_34
action_59 (13) = happyGoto action_41
action_59 (14) = happyGoto action_13
action_59 (17) = happyGoto action_15
action_59 (18) = happyGoto action_52
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (31) = happyShift action_67
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (45) = happyShift action_66
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (27) = happyShift action_65
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (35) = happyShift action_23
action_63 (36) = happyShift action_24
action_63 (43) = happyShift action_27
action_63 (52) = happyShift action_11
action_63 (54) = happyShift action_35
action_63 (13) = happyGoto action_37
action_63 (15) = happyGoto action_14
action_63 (22) = happyGoto action_64
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (30) = happyShift action_54
action_64 _ = happyReduce_31

action_65 _ = happyReduce_18

action_66 (37) = happyShift action_84
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (35) = happyShift action_23
action_67 (36) = happyShift action_24
action_67 (43) = happyShift action_27
action_67 (52) = happyShift action_11
action_67 (54) = happyShift action_35
action_67 (13) = happyGoto action_37
action_67 (15) = happyGoto action_14
action_67 (22) = happyGoto action_38
action_67 (23) = happyGoto action_83
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (26) = happyShift action_22
action_68 (41) = happyShift action_25
action_68 (42) = happyShift action_26
action_68 (44) = happyShift action_28
action_68 (46) = happyShift action_29
action_68 (47) = happyShift action_30
action_68 (49) = happyShift action_31
action_68 (50) = happyShift action_32
action_68 (51) = happyShift action_33
action_68 (52) = happyShift action_11
action_68 (53) = happyShift action_34
action_68 (13) = happyGoto action_41
action_68 (14) = happyGoto action_13
action_68 (17) = happyGoto action_15
action_68 (18) = happyGoto action_16
action_68 (19) = happyGoto action_82
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (27) = happyShift action_81
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (26) = happyShift action_22
action_70 (41) = happyShift action_25
action_70 (42) = happyShift action_26
action_70 (44) = happyShift action_28
action_70 (46) = happyShift action_29
action_70 (47) = happyShift action_30
action_70 (49) = happyShift action_31
action_70 (50) = happyShift action_32
action_70 (51) = happyShift action_33
action_70 (52) = happyShift action_11
action_70 (53) = happyShift action_34
action_70 (13) = happyGoto action_41
action_70 (14) = happyGoto action_13
action_70 (17) = happyGoto action_15
action_70 (18) = happyGoto action_16
action_70 (19) = happyGoto action_80
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (26) = happyShift action_22
action_71 (41) = happyShift action_25
action_71 (42) = happyShift action_26
action_71 (44) = happyShift action_28
action_71 (46) = happyShift action_29
action_71 (47) = happyShift action_30
action_71 (49) = happyShift action_31
action_71 (50) = happyShift action_32
action_71 (51) = happyShift action_33
action_71 (52) = happyShift action_11
action_71 (53) = happyShift action_34
action_71 (13) = happyGoto action_41
action_71 (14) = happyGoto action_13
action_71 (17) = happyGoto action_15
action_71 (18) = happyGoto action_16
action_71 (19) = happyGoto action_42
action_71 (21) = happyGoto action_79
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (35) = happyShift action_23
action_72 (36) = happyShift action_24
action_72 (43) = happyShift action_27
action_72 (52) = happyShift action_11
action_72 (54) = happyShift action_35
action_72 (13) = happyGoto action_37
action_72 (15) = happyGoto action_14
action_72 (22) = happyGoto action_78
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (30) = happyShift action_54
action_73 _ = happyReduce_37

action_74 (30) = happyShift action_54
action_74 (38) = happyShift action_77
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_20

action_76 _ = happyReduce_19

action_77 _ = happyReduce_28

action_78 (30) = happyShift action_54
action_78 (31) = happyShift action_88
action_78 _ = happyFail (happyExpListPerState 78)

action_79 _ = happyReduce_27

action_80 (26) = happyShift action_22
action_80 (37) = happyShift action_53
action_80 (41) = happyShift action_25
action_80 (45) = happyShift action_87
action_80 (46) = happyShift action_29
action_80 (49) = happyShift action_31
action_80 (52) = happyShift action_11
action_80 (53) = happyShift action_34
action_80 (13) = happyGoto action_41
action_80 (14) = happyGoto action_13
action_80 (17) = happyGoto action_15
action_80 (18) = happyGoto action_52
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_21

action_82 (26) = happyShift action_22
action_82 (37) = happyShift action_53
action_82 (40) = happyShift action_86
action_82 (41) = happyShift action_25
action_82 (46) = happyShift action_29
action_82 (49) = happyShift action_31
action_82 (52) = happyShift action_11
action_82 (53) = happyShift action_34
action_82 (13) = happyGoto action_41
action_82 (14) = happyGoto action_13
action_82 (17) = happyGoto action_15
action_82 (18) = happyGoto action_52
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_39

action_84 (26) = happyShift action_22
action_84 (41) = happyShift action_25
action_84 (42) = happyShift action_26
action_84 (44) = happyShift action_28
action_84 (46) = happyShift action_29
action_84 (47) = happyShift action_30
action_84 (49) = happyShift action_31
action_84 (50) = happyShift action_32
action_84 (51) = happyShift action_33
action_84 (52) = happyShift action_11
action_84 (53) = happyShift action_34
action_84 (13) = happyGoto action_41
action_84 (14) = happyGoto action_13
action_84 (17) = happyGoto action_15
action_84 (18) = happyGoto action_16
action_84 (19) = happyGoto action_85
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (26) = happyShift action_22
action_85 (32) = happyShift action_92
action_85 (37) = happyShift action_53
action_85 (41) = happyShift action_25
action_85 (46) = happyShift action_29
action_85 (49) = happyShift action_31
action_85 (52) = happyShift action_11
action_85 (53) = happyShift action_34
action_85 (13) = happyGoto action_41
action_85 (14) = happyGoto action_13
action_85 (17) = happyGoto action_15
action_85 (18) = happyGoto action_52
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (26) = happyShift action_22
action_86 (41) = happyShift action_25
action_86 (42) = happyShift action_26
action_86 (44) = happyShift action_28
action_86 (46) = happyShift action_29
action_86 (47) = happyShift action_30
action_86 (49) = happyShift action_31
action_86 (50) = happyShift action_32
action_86 (51) = happyShift action_33
action_86 (52) = happyShift action_11
action_86 (53) = happyShift action_34
action_86 (13) = happyGoto action_41
action_86 (14) = happyGoto action_13
action_86 (17) = happyGoto action_15
action_86 (18) = happyGoto action_16
action_86 (19) = happyGoto action_91
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (26) = happyShift action_22
action_87 (41) = happyShift action_25
action_87 (42) = happyShift action_26
action_87 (44) = happyShift action_28
action_87 (46) = happyShift action_29
action_87 (47) = happyShift action_30
action_87 (49) = happyShift action_31
action_87 (50) = happyShift action_32
action_87 (51) = happyShift action_33
action_87 (52) = happyShift action_11
action_87 (53) = happyShift action_34
action_87 (13) = happyGoto action_41
action_87 (14) = happyGoto action_13
action_87 (17) = happyGoto action_15
action_87 (18) = happyGoto action_16
action_87 (19) = happyGoto action_42
action_87 (21) = happyGoto action_90
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (26) = happyShift action_22
action_88 (41) = happyShift action_25
action_88 (42) = happyShift action_26
action_88 (44) = happyShift action_28
action_88 (46) = happyShift action_29
action_88 (47) = happyShift action_30
action_88 (49) = happyShift action_31
action_88 (50) = happyShift action_32
action_88 (51) = happyShift action_33
action_88 (52) = happyShift action_11
action_88 (53) = happyShift action_34
action_88 (13) = happyGoto action_41
action_88 (14) = happyGoto action_13
action_88 (17) = happyGoto action_15
action_88 (18) = happyGoto action_16
action_88 (19) = happyGoto action_42
action_88 (21) = happyGoto action_89
action_88 _ = happyFail (happyExpListPerState 88)

action_89 _ = happyReduce_25

action_90 _ = happyReduce_24

action_91 (26) = happyShift action_22
action_91 (37) = happyShift action_53
action_91 (41) = happyShift action_25
action_91 (46) = happyShift action_29
action_91 (49) = happyShift action_31
action_91 (52) = happyShift action_11
action_91 (53) = happyShift action_34
action_91 (13) = happyGoto action_41
action_91 (14) = happyGoto action_13
action_91 (17) = happyGoto action_15
action_91 (18) = happyGoto action_52
action_91 _ = happyReduce_23

action_92 (26) = happyShift action_22
action_92 (41) = happyShift action_25
action_92 (42) = happyShift action_26
action_92 (44) = happyShift action_28
action_92 (46) = happyShift action_29
action_92 (47) = happyShift action_30
action_92 (49) = happyShift action_31
action_92 (50) = happyShift action_32
action_92 (51) = happyShift action_33
action_92 (52) = happyShift action_11
action_92 (53) = happyShift action_34
action_92 (13) = happyGoto action_41
action_92 (14) = happyGoto action_13
action_92 (17) = happyGoto action_15
action_92 (18) = happyGoto action_16
action_92 (19) = happyGoto action_93
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (26) = happyShift action_22
action_93 (37) = happyShift action_53
action_93 (38) = happyShift action_94
action_93 (41) = happyShift action_25
action_93 (46) = happyShift action_29
action_93 (49) = happyShift action_31
action_93 (52) = happyShift action_11
action_93 (53) = happyShift action_34
action_93 (13) = happyGoto action_41
action_93 (14) = happyGoto action_13
action_93 (17) = happyGoto action_15
action_93 (18) = happyGoto action_52
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (39) = happyShift action_95
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (26) = happyShift action_22
action_95 (41) = happyShift action_25
action_95 (42) = happyShift action_26
action_95 (44) = happyShift action_28
action_95 (46) = happyShift action_29
action_95 (47) = happyShift action_30
action_95 (49) = happyShift action_31
action_95 (50) = happyShift action_32
action_95 (51) = happyShift action_33
action_95 (52) = happyShift action_11
action_95 (53) = happyShift action_34
action_95 (13) = happyGoto action_41
action_95 (14) = happyGoto action_13
action_95 (17) = happyGoto action_15
action_95 (18) = happyGoto action_16
action_95 (19) = happyGoto action_42
action_95 (21) = happyGoto action_96
action_95 _ = happyFail (happyExpListPerState 95)

action_96 _ = happyReduce_29

happyReduce_10 = happySpecReduce_1  13 happyReduction_10
happyReduction_10 (HappyTerminal (PT _ (TV happy_var_1)))
	 =  HappyAbsSyn13
		 (HM.Parser.Abs.Ident happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  14 happyReduction_11
happyReduction_11 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn14
		 ((read happy_var_1) :: Integer
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  15 happyReduction_12
happyReduction_12 (HappyTerminal (PT _ (T_UVarIdent happy_var_1)))
	 =  HappyAbsSyn15
		 (HM.Parser.Abs.UVarIdent happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  16 happyReduction_13
happyReduction_13 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn16
		 (HM.Parser.Abs.PatternVar happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  17 happyReduction_14
happyReduction_14 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn17
		 (HM.Parser.Abs.EVar happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  17 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn17
		 (HM.Parser.Abs.ETrue
	)

happyReduce_16 = happySpecReduce_1  17 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn17
		 (HM.Parser.Abs.EFalse
	)

happyReduce_17 = happySpecReduce_1  17 happyReduction_17
happyReduction_17 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn17
		 (HM.Parser.Abs.ENat happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  17 happyReduction_18
happyReduction_18 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (happy_var_2
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  18 happyReduction_19
happyReduction_19 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (HM.Parser.Abs.EAdd happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  18 happyReduction_20
happyReduction_20 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (HM.Parser.Abs.ESub happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 4 18 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (HM.Parser.Abs.EIsZero happy_var_3
	) `HappyStk` happyRest

happyReduce_22 = happySpecReduce_1  18 happyReduction_22
happyReduction_22 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happyReduce 6 19 happyReduction_23
happyReduction_23 ((HappyAbsSyn17  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (HM.Parser.Abs.EIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 6 19 happyReduction_24
happyReduction_24 ((HappyAbsSyn21  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (HM.Parser.Abs.ELet happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 6 19 happyReduction_25
happyReduction_25 ((HappyAbsSyn21  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (HM.Parser.Abs.EAbs happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_2  19 happyReduction_26
happyReduction_26 (HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (HM.Parser.Abs.EApp happy_var_1 happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 4 19 happyReduction_27
happyReduction_27 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (HM.Parser.Abs.ETAbs happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 4 19 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn22  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (HM.Parser.Abs.ETApp happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 10 19 happyReduction_29
happyReduction_29 ((HappyAbsSyn21  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (HM.Parser.Abs.EFor happy_var_2 happy_var_5 happy_var_7 happy_var_10
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_1  19 happyReduction_30
happyReduction_30 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  20 happyReduction_31
happyReduction_31 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (HM.Parser.Abs.ETyped happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  20 happyReduction_32
happyReduction_32 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  21 happyReduction_33
happyReduction_33 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn21
		 (HM.Parser.Abs.ScopedExp happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  22 happyReduction_34
happyReduction_34 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn22
		 (HM.Parser.Abs.TUVar happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  22 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn22
		 (HM.Parser.Abs.TNat
	)

happyReduce_36 = happySpecReduce_1  22 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn22
		 (HM.Parser.Abs.TBool
	)

happyReduce_37 = happySpecReduce_3  22 happyReduction_37
happyReduction_37 (HappyAbsSyn22  happy_var_3)
	_
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn22
		 (HM.Parser.Abs.TArrow happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  22 happyReduction_38
happyReduction_38 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn22
		 (HM.Parser.Abs.TVar happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happyReduce 4 22 happyReduction_39
happyReduction_39 ((HappyAbsSyn23  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 (HM.Parser.Abs.TForAll happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_40 = happySpecReduce_1  23 happyReduction_40
happyReduction_40 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn23
		 (HM.Parser.Abs.ScopedType happy_var_1
	)
happyReduction_40 _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  24 happyReduction_41
happyReduction_41 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn24
		 (HM.Parser.Abs.TermExp happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  24 happyReduction_42
happyReduction_42 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn24
		 (HM.Parser.Abs.TermType happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  25 happyReduction_43
happyReduction_43 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn25
		 (HM.Parser.Abs.ScopedTerm happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 55 55 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 26;
	PT _ (TS _ 2) -> cont 27;
	PT _ (TS _ 3) -> cont 28;
	PT _ (TS _ 4) -> cont 29;
	PT _ (TS _ 5) -> cont 30;
	PT _ (TS _ 6) -> cont 31;
	PT _ (TS _ 7) -> cont 32;
	PT _ (TS _ 8) -> cont 33;
	PT _ (TS _ 9) -> cont 34;
	PT _ (TS _ 10) -> cont 35;
	PT _ (TS _ 11) -> cont 36;
	PT _ (TS _ 12) -> cont 37;
	PT _ (TS _ 13) -> cont 38;
	PT _ (TS _ 14) -> cont 39;
	PT _ (TS _ 15) -> cont 40;
	PT _ (TS _ 16) -> cont 41;
	PT _ (TS _ 17) -> cont 42;
	PT _ (TS _ 18) -> cont 43;
	PT _ (TS _ 19) -> cont 44;
	PT _ (TS _ 20) -> cont 45;
	PT _ (TS _ 21) -> cont 46;
	PT _ (TS _ 22) -> cont 47;
	PT _ (TS _ 23) -> cont 48;
	PT _ (TS _ 24) -> cont 49;
	PT _ (TS _ 25) -> cont 50;
	PT _ (TS _ 26) -> cont 51;
	PT _ (TV happy_dollar_dollar) -> cont 52;
	PT _ (TI happy_dollar_dollar) -> cont 53;
	PT _ (T_UVarIdent happy_dollar_dollar) -> cont 54;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 55 tk tks = happyError' (tks, explist)
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
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn16 z -> happyReturn z; _other -> notHappyAtAll })

pExp3 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn17 z -> happyReturn z; _other -> notHappyAtAll })

pExp2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn17 z -> happyReturn z; _other -> notHappyAtAll })

pExp1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn17 z -> happyReturn z; _other -> notHappyAtAll })

pExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn17 z -> happyReturn z; _other -> notHappyAtAll })

pScopedExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn21 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_6 tks) (\x -> case x of {HappyAbsSyn22 z -> happyReturn z; _other -> notHappyAtAll })

pScopedType tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_7 tks) (\x -> case x of {HappyAbsSyn23 z -> happyReturn z; _other -> notHappyAtAll })

pTerm tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_8 tks) (\x -> case x of {HappyAbsSyn24 z -> happyReturn z; _other -> notHappyAtAll })

pScopedTerm tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_9 tks) (\x -> case x of {HappyAbsSyn25 z -> happyReturn z; _other -> notHappyAtAll })

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
