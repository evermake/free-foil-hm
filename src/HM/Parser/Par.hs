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
	| HappyAbsSyn11 (HM.Parser.Abs.Ident)
	| HappyAbsSyn12 (Integer)
	| HappyAbsSyn13 (HM.Parser.Abs.UVarIdent)
	| HappyAbsSyn14 (HM.Parser.Abs.Pattern)
	| HappyAbsSyn15 (HM.Parser.Abs.Exp)
	| HappyAbsSyn19 (HM.Parser.Abs.ScopedExp)
	| HappyAbsSyn20 (HM.Parser.Abs.Type)
	| HappyAbsSyn21 (HM.Parser.Abs.ScopedType)

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
 action_88 :: () => Prelude.Int -> ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

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
 happyReduce_38 :: () => ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,310) ([0,0,32768,0,256,32896,12,2048,33792,100,16384,24576,1005,0,2,8043,0,16,64344,0,0,259,10,0,2072,80,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,1536,0,0,0,0,0,0,0,0,0,32769,4021,0,0,0,0,0,0,1,512,27392,31,4096,0,0,0,0,512,0,0,0,0,0,32768,0,0,0,4,0,0,0,16384,8736,804,0,0,0,0,32784,51464,0,1536,0,0,0,0,0,0,0,0,0,0,0,0,8,25604,0,64,8224,3,6144,0,0,0,8288,320,0,768,2561,0,512,0,0,1024,0,0,0,1,0,2048,44032,125,16384,8704,820,0,0,16,0,32,0,0,0,259,10,32768,0,0,0,16576,640,0,0,0,0,0,0,0,0,2,0,512,27392,31,8192,0,0,32768,49152,2010,0,4,16086,0,49152,32832,2,4096,0,0,32768,128,0,0,0,0,0,0,0,0,0,0,0,6144,0,0,0,0,0,8192,4352,403,0,0,0,0,16392,25734,0,64,60768,3,0,0,0,4096,2180,201,32768,49152,2010,0,4,16086,0,32,63152,1,0,0,0,0,0,0,0,0,0,0,2,8043,0,32784,51465,0,0,16,0,1024,54784,62,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pPattern","%start_pExp3","%start_pExp2","%start_pExp1","%start_pExp","%start_pScopedExp","%start_pType","%start_pScopedType","Ident","Integer","UVarIdent","Pattern","Exp3","Exp2","Exp1","Exp","ScopedExp","Type","ScopedType","'('","')'","'+'","'-'","'->'","'.'","'..'","':'","'='","'Bool'","'Nat'","'['","']'","'do'","'else'","'false'","'for'","'forall'","'if'","'in'","'iszero'","'let'","'then'","'true'","'\923'","'\955'","L_Ident","L_integ","L_UVarIdent","%eof"]
        bit_start = st Prelude.* 51
        bit_end = (st Prelude.+ 1) Prelude.* 51
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..50]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (48) = happyShift action_9
action_0 (11) = happyGoto action_40
action_0 (14) = happyGoto action_41
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (22) = happyShift action_25
action_1 (37) = happyShift action_26
action_1 (45) = happyShift action_31
action_1 (48) = happyShift action_9
action_1 (49) = happyShift action_34
action_1 (11) = happyGoto action_19
action_1 (12) = happyGoto action_20
action_1 (15) = happyGoto action_39
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (22) = happyShift action_25
action_2 (37) = happyShift action_26
action_2 (42) = happyShift action_29
action_2 (45) = happyShift action_31
action_2 (48) = happyShift action_9
action_2 (49) = happyShift action_34
action_2 (11) = happyGoto action_19
action_2 (12) = happyGoto action_20
action_2 (15) = happyGoto action_21
action_2 (16) = happyGoto action_38
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (22) = happyShift action_25
action_3 (37) = happyShift action_26
action_3 (38) = happyShift action_27
action_3 (40) = happyShift action_28
action_3 (42) = happyShift action_29
action_3 (43) = happyShift action_30
action_3 (45) = happyShift action_31
action_3 (46) = happyShift action_32
action_3 (47) = happyShift action_33
action_3 (48) = happyShift action_9
action_3 (49) = happyShift action_34
action_3 (11) = happyGoto action_19
action_3 (12) = happyGoto action_20
action_3 (15) = happyGoto action_21
action_3 (16) = happyGoto action_22
action_3 (17) = happyGoto action_37
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (22) = happyShift action_25
action_4 (37) = happyShift action_26
action_4 (38) = happyShift action_27
action_4 (40) = happyShift action_28
action_4 (42) = happyShift action_29
action_4 (43) = happyShift action_30
action_4 (45) = happyShift action_31
action_4 (46) = happyShift action_32
action_4 (47) = happyShift action_33
action_4 (48) = happyShift action_9
action_4 (49) = happyShift action_34
action_4 (11) = happyGoto action_19
action_4 (12) = happyGoto action_20
action_4 (15) = happyGoto action_21
action_4 (16) = happyGoto action_22
action_4 (17) = happyGoto action_35
action_4 (18) = happyGoto action_36
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (22) = happyShift action_25
action_5 (37) = happyShift action_26
action_5 (38) = happyShift action_27
action_5 (40) = happyShift action_28
action_5 (42) = happyShift action_29
action_5 (43) = happyShift action_30
action_5 (45) = happyShift action_31
action_5 (46) = happyShift action_32
action_5 (47) = happyShift action_33
action_5 (48) = happyShift action_9
action_5 (49) = happyShift action_34
action_5 (11) = happyGoto action_19
action_5 (12) = happyGoto action_20
action_5 (15) = happyGoto action_21
action_5 (16) = happyGoto action_22
action_5 (17) = happyGoto action_23
action_5 (19) = happyGoto action_24
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (31) = happyShift action_14
action_6 (32) = happyShift action_15
action_6 (39) = happyShift action_16
action_6 (48) = happyShift action_9
action_6 (50) = happyShift action_17
action_6 (11) = happyGoto action_10
action_6 (13) = happyGoto action_11
action_6 (20) = happyGoto action_18
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (31) = happyShift action_14
action_7 (32) = happyShift action_15
action_7 (39) = happyShift action_16
action_7 (48) = happyShift action_9
action_7 (50) = happyShift action_17
action_7 (11) = happyGoto action_10
action_7 (13) = happyGoto action_11
action_7 (20) = happyGoto action_12
action_7 (21) = happyGoto action_13
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (48) = happyShift action_9
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_8

action_10 _ = happyReduce_36

action_11 _ = happyReduce_32

action_12 (26) = happyShift action_54
action_12 _ = happyReduce_38

action_13 (51) = happyAccept
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_34

action_15 _ = happyReduce_33

action_16 (48) = happyShift action_9
action_16 (11) = happyGoto action_40
action_16 (14) = happyGoto action_55
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_10

action_18 (26) = happyShift action_54
action_18 (51) = happyAccept
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_12

action_20 _ = happyReduce_15

action_21 _ = happyReduce_20

action_22 (24) = happyShift action_42
action_22 (25) = happyShift action_43
action_22 _ = happyReduce_28

action_23 (22) = happyShift action_25
action_23 (33) = happyShift action_45
action_23 (37) = happyShift action_26
action_23 (42) = happyShift action_29
action_23 (45) = happyShift action_31
action_23 (48) = happyShift action_9
action_23 (49) = happyShift action_34
action_23 (11) = happyGoto action_19
action_23 (12) = happyGoto action_20
action_23 (15) = happyGoto action_21
action_23 (16) = happyGoto action_44
action_23 _ = happyReduce_31

action_24 (51) = happyAccept
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (22) = happyShift action_25
action_25 (37) = happyShift action_26
action_25 (38) = happyShift action_27
action_25 (40) = happyShift action_28
action_25 (42) = happyShift action_29
action_25 (43) = happyShift action_30
action_25 (45) = happyShift action_31
action_25 (46) = happyShift action_32
action_25 (47) = happyShift action_33
action_25 (48) = happyShift action_9
action_25 (49) = happyShift action_34
action_25 (11) = happyGoto action_19
action_25 (12) = happyGoto action_20
action_25 (15) = happyGoto action_21
action_25 (16) = happyGoto action_22
action_25 (17) = happyGoto action_35
action_25 (18) = happyGoto action_53
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_14

action_27 (48) = happyShift action_9
action_27 (11) = happyGoto action_40
action_27 (14) = happyGoto action_52
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (22) = happyShift action_25
action_28 (37) = happyShift action_26
action_28 (38) = happyShift action_27
action_28 (40) = happyShift action_28
action_28 (42) = happyShift action_29
action_28 (43) = happyShift action_30
action_28 (45) = happyShift action_31
action_28 (46) = happyShift action_32
action_28 (47) = happyShift action_33
action_28 (48) = happyShift action_9
action_28 (49) = happyShift action_34
action_28 (11) = happyGoto action_19
action_28 (12) = happyGoto action_20
action_28 (15) = happyGoto action_21
action_28 (16) = happyGoto action_22
action_28 (17) = happyGoto action_51
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (22) = happyShift action_50
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (48) = happyShift action_9
action_30 (11) = happyGoto action_40
action_30 (14) = happyGoto action_49
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_13

action_32 (48) = happyShift action_9
action_32 (11) = happyGoto action_40
action_32 (14) = happyGoto action_48
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (48) = happyShift action_9
action_33 (11) = happyGoto action_40
action_33 (14) = happyGoto action_47
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_9

action_35 (22) = happyShift action_25
action_35 (29) = happyShift action_46
action_35 (33) = happyShift action_45
action_35 (37) = happyShift action_26
action_35 (42) = happyShift action_29
action_35 (45) = happyShift action_31
action_35 (48) = happyShift action_9
action_35 (49) = happyShift action_34
action_35 (11) = happyGoto action_19
action_35 (12) = happyGoto action_20
action_35 (15) = happyGoto action_21
action_35 (16) = happyGoto action_44
action_35 _ = happyReduce_30

action_36 (51) = happyAccept
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (22) = happyShift action_25
action_37 (33) = happyShift action_45
action_37 (37) = happyShift action_26
action_37 (42) = happyShift action_29
action_37 (45) = happyShift action_31
action_37 (48) = happyShift action_9
action_37 (49) = happyShift action_34
action_37 (51) = happyAccept
action_37 (11) = happyGoto action_19
action_37 (12) = happyGoto action_20
action_37 (15) = happyGoto action_21
action_37 (16) = happyGoto action_44
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (24) = happyShift action_42
action_38 (25) = happyShift action_43
action_38 (51) = happyAccept
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (51) = happyAccept
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_11

action_41 (51) = happyAccept
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (22) = happyShift action_25
action_42 (37) = happyShift action_26
action_42 (45) = happyShift action_31
action_42 (48) = happyShift action_9
action_42 (49) = happyShift action_34
action_42 (11) = happyGoto action_19
action_42 (12) = happyGoto action_20
action_42 (15) = happyGoto action_68
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (22) = happyShift action_25
action_43 (37) = happyShift action_26
action_43 (45) = happyShift action_31
action_43 (48) = happyShift action_9
action_43 (49) = happyShift action_34
action_43 (11) = happyGoto action_19
action_43 (12) = happyGoto action_20
action_43 (15) = happyGoto action_67
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (24) = happyShift action_42
action_44 (25) = happyShift action_43
action_44 _ = happyReduce_24

action_45 (31) = happyShift action_14
action_45 (32) = happyShift action_15
action_45 (39) = happyShift action_16
action_45 (48) = happyShift action_9
action_45 (50) = happyShift action_17
action_45 (11) = happyGoto action_10
action_45 (13) = happyGoto action_11
action_45 (20) = happyGoto action_66
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (31) = happyShift action_14
action_46 (32) = happyShift action_15
action_46 (39) = happyShift action_16
action_46 (48) = happyShift action_9
action_46 (50) = happyShift action_17
action_46 (11) = happyGoto action_10
action_46 (13) = happyGoto action_11
action_46 (20) = happyGoto action_65
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (29) = happyShift action_64
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (27) = happyShift action_63
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (30) = happyShift action_62
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (22) = happyShift action_25
action_50 (37) = happyShift action_26
action_50 (38) = happyShift action_27
action_50 (40) = happyShift action_28
action_50 (42) = happyShift action_29
action_50 (43) = happyShift action_30
action_50 (45) = happyShift action_31
action_50 (46) = happyShift action_32
action_50 (47) = happyShift action_33
action_50 (48) = happyShift action_9
action_50 (49) = happyShift action_34
action_50 (11) = happyGoto action_19
action_50 (12) = happyGoto action_20
action_50 (15) = happyGoto action_21
action_50 (16) = happyGoto action_22
action_50 (17) = happyGoto action_35
action_50 (18) = happyGoto action_61
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (22) = happyShift action_25
action_51 (33) = happyShift action_45
action_51 (37) = happyShift action_26
action_51 (42) = happyShift action_29
action_51 (44) = happyShift action_60
action_51 (45) = happyShift action_31
action_51 (48) = happyShift action_9
action_51 (49) = happyShift action_34
action_51 (11) = happyGoto action_19
action_51 (12) = happyGoto action_20
action_51 (15) = happyGoto action_21
action_51 (16) = happyGoto action_44
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (41) = happyShift action_59
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (23) = happyShift action_58
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (31) = happyShift action_14
action_54 (32) = happyShift action_15
action_54 (39) = happyShift action_16
action_54 (48) = happyShift action_9
action_54 (50) = happyShift action_17
action_54 (11) = happyGoto action_10
action_54 (13) = happyGoto action_11
action_54 (20) = happyGoto action_57
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (27) = happyShift action_56
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (31) = happyShift action_14
action_56 (32) = happyShift action_15
action_56 (39) = happyShift action_16
action_56 (48) = happyShift action_9
action_56 (50) = happyShift action_17
action_56 (11) = happyGoto action_10
action_56 (13) = happyGoto action_11
action_56 (20) = happyGoto action_12
action_56 (21) = happyGoto action_76
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (26) = happyShift action_54
action_57 _ = happyReduce_35

action_58 _ = happyReduce_16

action_59 (33) = happyShift action_75
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (22) = happyShift action_25
action_60 (37) = happyShift action_26
action_60 (38) = happyShift action_27
action_60 (40) = happyShift action_28
action_60 (42) = happyShift action_29
action_60 (43) = happyShift action_30
action_60 (45) = happyShift action_31
action_60 (46) = happyShift action_32
action_60 (47) = happyShift action_33
action_60 (48) = happyShift action_9
action_60 (49) = happyShift action_34
action_60 (11) = happyGoto action_19
action_60 (12) = happyGoto action_20
action_60 (15) = happyGoto action_21
action_60 (16) = happyGoto action_22
action_60 (17) = happyGoto action_74
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (23) = happyShift action_73
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (22) = happyShift action_25
action_62 (37) = happyShift action_26
action_62 (38) = happyShift action_27
action_62 (40) = happyShift action_28
action_62 (42) = happyShift action_29
action_62 (43) = happyShift action_30
action_62 (45) = happyShift action_31
action_62 (46) = happyShift action_32
action_62 (47) = happyShift action_33
action_62 (48) = happyShift action_9
action_62 (49) = happyShift action_34
action_62 (11) = happyGoto action_19
action_62 (12) = happyGoto action_20
action_62 (15) = happyGoto action_21
action_62 (16) = happyGoto action_22
action_62 (17) = happyGoto action_72
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (22) = happyShift action_25
action_63 (37) = happyShift action_26
action_63 (38) = happyShift action_27
action_63 (40) = happyShift action_28
action_63 (42) = happyShift action_29
action_63 (43) = happyShift action_30
action_63 (45) = happyShift action_31
action_63 (46) = happyShift action_32
action_63 (47) = happyShift action_33
action_63 (48) = happyShift action_9
action_63 (49) = happyShift action_34
action_63 (11) = happyGoto action_19
action_63 (12) = happyGoto action_20
action_63 (15) = happyGoto action_21
action_63 (16) = happyGoto action_22
action_63 (17) = happyGoto action_23
action_63 (19) = happyGoto action_71
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (31) = happyShift action_14
action_64 (32) = happyShift action_15
action_64 (39) = happyShift action_16
action_64 (48) = happyShift action_9
action_64 (50) = happyShift action_17
action_64 (11) = happyGoto action_10
action_64 (13) = happyGoto action_11
action_64 (20) = happyGoto action_70
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (26) = happyShift action_54
action_65 _ = happyReduce_29

action_66 (26) = happyShift action_54
action_66 (34) = happyShift action_69
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_18

action_68 _ = happyReduce_17

action_69 _ = happyReduce_26

action_70 (26) = happyShift action_54
action_70 (27) = happyShift action_80
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_25

action_72 (22) = happyShift action_25
action_72 (33) = happyShift action_45
action_72 (37) = happyShift action_26
action_72 (41) = happyShift action_79
action_72 (42) = happyShift action_29
action_72 (45) = happyShift action_31
action_72 (48) = happyShift action_9
action_72 (49) = happyShift action_34
action_72 (11) = happyGoto action_19
action_72 (12) = happyGoto action_20
action_72 (15) = happyGoto action_21
action_72 (16) = happyGoto action_44
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_19

action_74 (22) = happyShift action_25
action_74 (33) = happyShift action_45
action_74 (36) = happyShift action_78
action_74 (37) = happyShift action_26
action_74 (42) = happyShift action_29
action_74 (45) = happyShift action_31
action_74 (48) = happyShift action_9
action_74 (49) = happyShift action_34
action_74 (11) = happyGoto action_19
action_74 (12) = happyGoto action_20
action_74 (15) = happyGoto action_21
action_74 (16) = happyGoto action_44
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (22) = happyShift action_25
action_75 (37) = happyShift action_26
action_75 (38) = happyShift action_27
action_75 (40) = happyShift action_28
action_75 (42) = happyShift action_29
action_75 (43) = happyShift action_30
action_75 (45) = happyShift action_31
action_75 (46) = happyShift action_32
action_75 (47) = happyShift action_33
action_75 (48) = happyShift action_9
action_75 (49) = happyShift action_34
action_75 (11) = happyGoto action_19
action_75 (12) = happyGoto action_20
action_75 (15) = happyGoto action_21
action_75 (16) = happyGoto action_22
action_75 (17) = happyGoto action_77
action_75 _ = happyFail (happyExpListPerState 75)

action_76 _ = happyReduce_37

action_77 (22) = happyShift action_25
action_77 (28) = happyShift action_84
action_77 (33) = happyShift action_45
action_77 (37) = happyShift action_26
action_77 (42) = happyShift action_29
action_77 (45) = happyShift action_31
action_77 (48) = happyShift action_9
action_77 (49) = happyShift action_34
action_77 (11) = happyGoto action_19
action_77 (12) = happyGoto action_20
action_77 (15) = happyGoto action_21
action_77 (16) = happyGoto action_44
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (22) = happyShift action_25
action_78 (37) = happyShift action_26
action_78 (38) = happyShift action_27
action_78 (40) = happyShift action_28
action_78 (42) = happyShift action_29
action_78 (43) = happyShift action_30
action_78 (45) = happyShift action_31
action_78 (46) = happyShift action_32
action_78 (47) = happyShift action_33
action_78 (48) = happyShift action_9
action_78 (49) = happyShift action_34
action_78 (11) = happyGoto action_19
action_78 (12) = happyGoto action_20
action_78 (15) = happyGoto action_21
action_78 (16) = happyGoto action_22
action_78 (17) = happyGoto action_83
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (22) = happyShift action_25
action_79 (37) = happyShift action_26
action_79 (38) = happyShift action_27
action_79 (40) = happyShift action_28
action_79 (42) = happyShift action_29
action_79 (43) = happyShift action_30
action_79 (45) = happyShift action_31
action_79 (46) = happyShift action_32
action_79 (47) = happyShift action_33
action_79 (48) = happyShift action_9
action_79 (49) = happyShift action_34
action_79 (11) = happyGoto action_19
action_79 (12) = happyGoto action_20
action_79 (15) = happyGoto action_21
action_79 (16) = happyGoto action_22
action_79 (17) = happyGoto action_23
action_79 (19) = happyGoto action_82
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (22) = happyShift action_25
action_80 (37) = happyShift action_26
action_80 (38) = happyShift action_27
action_80 (40) = happyShift action_28
action_80 (42) = happyShift action_29
action_80 (43) = happyShift action_30
action_80 (45) = happyShift action_31
action_80 (46) = happyShift action_32
action_80 (47) = happyShift action_33
action_80 (48) = happyShift action_9
action_80 (49) = happyShift action_34
action_80 (11) = happyGoto action_19
action_80 (12) = happyGoto action_20
action_80 (15) = happyGoto action_21
action_80 (16) = happyGoto action_22
action_80 (17) = happyGoto action_23
action_80 (19) = happyGoto action_81
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_23

action_82 _ = happyReduce_22

action_83 (22) = happyShift action_25
action_83 (33) = happyShift action_45
action_83 (37) = happyShift action_26
action_83 (42) = happyShift action_29
action_83 (45) = happyShift action_31
action_83 (48) = happyShift action_9
action_83 (49) = happyShift action_34
action_83 (11) = happyGoto action_19
action_83 (12) = happyGoto action_20
action_83 (15) = happyGoto action_21
action_83 (16) = happyGoto action_44
action_83 _ = happyReduce_21

action_84 (22) = happyShift action_25
action_84 (37) = happyShift action_26
action_84 (38) = happyShift action_27
action_84 (40) = happyShift action_28
action_84 (42) = happyShift action_29
action_84 (43) = happyShift action_30
action_84 (45) = happyShift action_31
action_84 (46) = happyShift action_32
action_84 (47) = happyShift action_33
action_84 (48) = happyShift action_9
action_84 (49) = happyShift action_34
action_84 (11) = happyGoto action_19
action_84 (12) = happyGoto action_20
action_84 (15) = happyGoto action_21
action_84 (16) = happyGoto action_22
action_84 (17) = happyGoto action_85
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (22) = happyShift action_25
action_85 (33) = happyShift action_45
action_85 (34) = happyShift action_86
action_85 (37) = happyShift action_26
action_85 (42) = happyShift action_29
action_85 (45) = happyShift action_31
action_85 (48) = happyShift action_9
action_85 (49) = happyShift action_34
action_85 (11) = happyGoto action_19
action_85 (12) = happyGoto action_20
action_85 (15) = happyGoto action_21
action_85 (16) = happyGoto action_44
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (35) = happyShift action_87
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (22) = happyShift action_25
action_87 (37) = happyShift action_26
action_87 (38) = happyShift action_27
action_87 (40) = happyShift action_28
action_87 (42) = happyShift action_29
action_87 (43) = happyShift action_30
action_87 (45) = happyShift action_31
action_87 (46) = happyShift action_32
action_87 (47) = happyShift action_33
action_87 (48) = happyShift action_9
action_87 (49) = happyShift action_34
action_87 (11) = happyGoto action_19
action_87 (12) = happyGoto action_20
action_87 (15) = happyGoto action_21
action_87 (16) = happyGoto action_22
action_87 (17) = happyGoto action_23
action_87 (19) = happyGoto action_88
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_27

happyReduce_8 = happySpecReduce_1  11 happyReduction_8
happyReduction_8 (HappyTerminal (PT _ (TV happy_var_1)))
	 =  HappyAbsSyn11
		 (HM.Parser.Abs.Ident happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  12 happyReduction_9
happyReduction_9 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn12
		 ((read happy_var_1) :: Integer
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  13 happyReduction_10
happyReduction_10 (HappyTerminal (PT _ (T_UVarIdent happy_var_1)))
	 =  HappyAbsSyn13
		 (HM.Parser.Abs.UVarIdent happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  14 happyReduction_11
happyReduction_11 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn14
		 (HM.Parser.Abs.PatternVar happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  15 happyReduction_12
happyReduction_12 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn15
		 (HM.Parser.Abs.EVar happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  15 happyReduction_13
happyReduction_13 _
	 =  HappyAbsSyn15
		 (HM.Parser.Abs.ETrue
	)

happyReduce_14 = happySpecReduce_1  15 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn15
		 (HM.Parser.Abs.EFalse
	)

happyReduce_15 = happySpecReduce_1  15 happyReduction_15
happyReduction_15 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn15
		 (HM.Parser.Abs.ENat happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  15 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  16 happyReduction_17
happyReduction_17 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (HM.Parser.Abs.EAdd happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  16 happyReduction_18
happyReduction_18 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (HM.Parser.Abs.ESub happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happyReduce 4 16 happyReduction_19
happyReduction_19 (_ `HappyStk`
	(HappyAbsSyn15  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (HM.Parser.Abs.EIsZero happy_var_3
	) `HappyStk` happyRest

happyReduce_20 = happySpecReduce_1  16 happyReduction_20
happyReduction_20 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happyReduce 6 17 happyReduction_21
happyReduction_21 ((HappyAbsSyn15  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (HM.Parser.Abs.EIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 6 17 happyReduction_22
happyReduction_22 ((HappyAbsSyn19  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (HM.Parser.Abs.ELet happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 6 17 happyReduction_23
happyReduction_23 ((HappyAbsSyn19  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (HM.Parser.Abs.EAbs happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_2  17 happyReduction_24
happyReduction_24 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (HM.Parser.Abs.EApp happy_var_1 happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 4 17 happyReduction_25
happyReduction_25 ((HappyAbsSyn19  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (HM.Parser.Abs.ETAbs happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 4 17 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn20  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (HM.Parser.Abs.ETApp happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 10 17 happyReduction_27
happyReduction_27 ((HappyAbsSyn19  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (HM.Parser.Abs.EFor happy_var_2 happy_var_5 happy_var_7 happy_var_10
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_1  17 happyReduction_28
happyReduction_28 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  18 happyReduction_29
happyReduction_29 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (HM.Parser.Abs.ETyped happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  18 happyReduction_30
happyReduction_30 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  19 happyReduction_31
happyReduction_31 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn19
		 (HM.Parser.Abs.ScopedExp happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  20 happyReduction_32
happyReduction_32 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn20
		 (HM.Parser.Abs.TUVar happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  20 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn20
		 (HM.Parser.Abs.TNat
	)

happyReduce_34 = happySpecReduce_1  20 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn20
		 (HM.Parser.Abs.TBool
	)

happyReduce_35 = happySpecReduce_3  20 happyReduction_35
happyReduction_35 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (HM.Parser.Abs.TArrow happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  20 happyReduction_36
happyReduction_36 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn20
		 (HM.Parser.Abs.TVar happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happyReduce 4 20 happyReduction_37
happyReduction_37 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (HM.Parser.Abs.TForAll happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_1  21 happyReduction_38
happyReduction_38 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (HM.Parser.Abs.ScopedType happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 51 51 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 22;
	PT _ (TS _ 2) -> cont 23;
	PT _ (TS _ 3) -> cont 24;
	PT _ (TS _ 4) -> cont 25;
	PT _ (TS _ 5) -> cont 26;
	PT _ (TS _ 6) -> cont 27;
	PT _ (TS _ 7) -> cont 28;
	PT _ (TS _ 8) -> cont 29;
	PT _ (TS _ 9) -> cont 30;
	PT _ (TS _ 10) -> cont 31;
	PT _ (TS _ 11) -> cont 32;
	PT _ (TS _ 12) -> cont 33;
	PT _ (TS _ 13) -> cont 34;
	PT _ (TS _ 14) -> cont 35;
	PT _ (TS _ 15) -> cont 36;
	PT _ (TS _ 16) -> cont 37;
	PT _ (TS _ 17) -> cont 38;
	PT _ (TS _ 18) -> cont 39;
	PT _ (TS _ 19) -> cont 40;
	PT _ (TS _ 20) -> cont 41;
	PT _ (TS _ 21) -> cont 42;
	PT _ (TS _ 22) -> cont 43;
	PT _ (TS _ 23) -> cont 44;
	PT _ (TS _ 24) -> cont 45;
	PT _ (TS _ 25) -> cont 46;
	PT _ (TS _ 26) -> cont 47;
	PT _ (TV happy_dollar_dollar) -> cont 48;
	PT _ (TI happy_dollar_dollar) -> cont 49;
	PT _ (T_UVarIdent happy_dollar_dollar) -> cont 50;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 51 tk tks = happyError' (tks, explist)
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
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn14 z -> happyReturn z; _other -> notHappyAtAll })

pExp3 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn15 z -> happyReturn z; _other -> notHappyAtAll })

pExp2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn15 z -> happyReturn z; _other -> notHappyAtAll })

pExp1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn15 z -> happyReturn z; _other -> notHappyAtAll })

pExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn15 z -> happyReturn z; _other -> notHappyAtAll })

pScopedExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn19 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_6 tks) (\x -> case x of {HappyAbsSyn20 z -> happyReturn z; _other -> notHappyAtAll })

pScopedType tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_7 tks) (\x -> case x of {HappyAbsSyn21 z -> happyReturn z; _other -> notHappyAtAll })

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
