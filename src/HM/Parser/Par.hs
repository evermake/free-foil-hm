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
  , pTypePattern
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
	| HappyAbsSyn12 (HM.Parser.Abs.Ident)
	| HappyAbsSyn13 (Integer)
	| HappyAbsSyn14 (HM.Parser.Abs.Pattern)
	| HappyAbsSyn15 (HM.Parser.Abs.Exp)
	| HappyAbsSyn19 (HM.Parser.Abs.ScopedExp)
	| HappyAbsSyn20 (HM.Parser.Abs.Type)
	| HappyAbsSyn21 (HM.Parser.Abs.ScopedType)
	| HappyAbsSyn22 (HM.Parser.Abs.TypePattern)

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
 action_80 :: () => Prelude.Int -> ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

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
 happyReduce_36 :: () => ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,259) ([0,0,32768,0,256,32896,6,1024,16896,26,4096,22528,123,16384,24576,493,0,32769,1973,0,6144,2056,0,24576,8224,0,0,32768,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,1,0,0,0,0,0,0,0,0,0,0,0,192,0,0,0,0,0,0,0,0,1024,54784,30,0,0,0,0,0,128,0,32769,1973,0,4,0,0,0,8192,0,0,0,0,0,0,2,0,0,0,4096,2056,105,0,0,0,0,32769,1680,0,48,0,0,0,0,0,0,0,0,0,0,0,1024,512,26,4096,2048,104,0,3,0,0,1536,514,0,128,0,0,4096,0,0,64,60768,1,256,53376,6,0,8192,0,8192,0,0,0,33152,128,0,32,0,0,6144,2056,0,0,0,0,0,0,0,0,8,0,1024,54784,30,8192,0,0,16384,24576,493,0,32769,1973,0,64,0,0,0,0,0,0,0,0,0,0,0,1024,25088,26,0,0,0,16384,12288,420,0,32769,1973,0,0,0,0,1040,26888,0,64,60768,1,256,46464,7,0,0,0,0,0,0,16384,24576,493,0,36865,1680,0,32768,0,0,16,31576,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pPattern","%start_pExp3","%start_pExp2","%start_pExp1","%start_pExp","%start_pScopedExp","%start_pType","%start_pScopedType","%start_pTypePattern","Ident","Integer","Pattern","Exp3","Exp2","Exp1","Exp","ScopedExp","Type","ScopedType","TypePattern","'('","')'","'+'","'-'","'->'","'.'","'..'","':'","'='","'Bool'","'Nat'","'['","']'","'do'","'else'","'false'","'for'","'forall'","'if'","'in'","'iszero'","'let'","'then'","'true'","'\955'","L_Ident","L_integ","%eof"]
        bit_start = st Prelude.* 50
        bit_end = (st Prelude.+ 1) Prelude.* 50
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..49]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (48) = happyShift action_10
action_0 (12) = happyGoto action_40
action_0 (14) = happyGoto action_41
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (23) = happyShift action_26
action_1 (38) = happyShift action_27
action_1 (46) = happyShift action_32
action_1 (48) = happyShift action_10
action_1 (49) = happyShift action_34
action_1 (12) = happyGoto action_20
action_1 (13) = happyGoto action_21
action_1 (15) = happyGoto action_39
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (23) = happyShift action_26
action_2 (38) = happyShift action_27
action_2 (43) = happyShift action_30
action_2 (46) = happyShift action_32
action_2 (48) = happyShift action_10
action_2 (49) = happyShift action_34
action_2 (12) = happyGoto action_20
action_2 (13) = happyGoto action_21
action_2 (15) = happyGoto action_22
action_2 (16) = happyGoto action_38
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (23) = happyShift action_26
action_3 (38) = happyShift action_27
action_3 (39) = happyShift action_28
action_3 (41) = happyShift action_29
action_3 (43) = happyShift action_30
action_3 (44) = happyShift action_31
action_3 (46) = happyShift action_32
action_3 (47) = happyShift action_33
action_3 (48) = happyShift action_10
action_3 (49) = happyShift action_34
action_3 (12) = happyGoto action_20
action_3 (13) = happyGoto action_21
action_3 (15) = happyGoto action_22
action_3 (16) = happyGoto action_23
action_3 (17) = happyGoto action_37
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (23) = happyShift action_26
action_4 (38) = happyShift action_27
action_4 (39) = happyShift action_28
action_4 (41) = happyShift action_29
action_4 (43) = happyShift action_30
action_4 (44) = happyShift action_31
action_4 (46) = happyShift action_32
action_4 (47) = happyShift action_33
action_4 (48) = happyShift action_10
action_4 (49) = happyShift action_34
action_4 (12) = happyGoto action_20
action_4 (13) = happyGoto action_21
action_4 (15) = happyGoto action_22
action_4 (16) = happyGoto action_23
action_4 (17) = happyGoto action_35
action_4 (18) = happyGoto action_36
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (23) = happyShift action_26
action_5 (38) = happyShift action_27
action_5 (39) = happyShift action_28
action_5 (41) = happyShift action_29
action_5 (43) = happyShift action_30
action_5 (44) = happyShift action_31
action_5 (46) = happyShift action_32
action_5 (47) = happyShift action_33
action_5 (48) = happyShift action_10
action_5 (49) = happyShift action_34
action_5 (12) = happyGoto action_20
action_5 (13) = happyGoto action_21
action_5 (15) = happyGoto action_22
action_5 (16) = happyGoto action_23
action_5 (17) = happyGoto action_24
action_5 (19) = happyGoto action_25
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (32) = happyShift action_16
action_6 (33) = happyShift action_17
action_6 (40) = happyShift action_18
action_6 (48) = happyShift action_10
action_6 (12) = happyGoto action_13
action_6 (20) = happyGoto action_19
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (32) = happyShift action_16
action_7 (33) = happyShift action_17
action_7 (40) = happyShift action_18
action_7 (48) = happyShift action_10
action_7 (12) = happyGoto action_13
action_7 (20) = happyGoto action_14
action_7 (21) = happyGoto action_15
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (48) = happyShift action_10
action_8 (12) = happyGoto action_11
action_8 (22) = happyGoto action_12
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (48) = happyShift action_10
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_9

action_11 _ = happyReduce_36

action_12 (50) = happyAccept
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_33

action_14 (27) = happyShift action_52
action_14 _ = happyReduce_35

action_15 (50) = happyAccept
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_31

action_17 _ = happyReduce_30

action_18 (48) = happyShift action_10
action_18 (12) = happyGoto action_11
action_18 (22) = happyGoto action_53
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (27) = happyShift action_52
action_19 (50) = happyAccept
action_19 _ = happyFail (happyExpListPerState 19)

action_20 _ = happyReduce_12

action_21 _ = happyReduce_15

action_22 _ = happyReduce_20

action_23 (25) = happyShift action_42
action_23 (26) = happyShift action_43
action_23 _ = happyReduce_26

action_24 (23) = happyShift action_26
action_24 (38) = happyShift action_27
action_24 (43) = happyShift action_30
action_24 (46) = happyShift action_32
action_24 (48) = happyShift action_10
action_24 (49) = happyShift action_34
action_24 (12) = happyGoto action_20
action_24 (13) = happyGoto action_21
action_24 (15) = happyGoto action_22
action_24 (16) = happyGoto action_44
action_24 _ = happyReduce_29

action_25 (50) = happyAccept
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (23) = happyShift action_26
action_26 (38) = happyShift action_27
action_26 (39) = happyShift action_28
action_26 (41) = happyShift action_29
action_26 (43) = happyShift action_30
action_26 (44) = happyShift action_31
action_26 (46) = happyShift action_32
action_26 (47) = happyShift action_33
action_26 (48) = happyShift action_10
action_26 (49) = happyShift action_34
action_26 (12) = happyGoto action_20
action_26 (13) = happyGoto action_21
action_26 (15) = happyGoto action_22
action_26 (16) = happyGoto action_23
action_26 (17) = happyGoto action_35
action_26 (18) = happyGoto action_51
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_14

action_28 (48) = happyShift action_10
action_28 (12) = happyGoto action_40
action_28 (14) = happyGoto action_50
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (23) = happyShift action_26
action_29 (38) = happyShift action_27
action_29 (39) = happyShift action_28
action_29 (41) = happyShift action_29
action_29 (43) = happyShift action_30
action_29 (44) = happyShift action_31
action_29 (46) = happyShift action_32
action_29 (47) = happyShift action_33
action_29 (48) = happyShift action_10
action_29 (49) = happyShift action_34
action_29 (12) = happyGoto action_20
action_29 (13) = happyGoto action_21
action_29 (15) = happyGoto action_22
action_29 (16) = happyGoto action_23
action_29 (17) = happyGoto action_49
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (23) = happyShift action_48
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (48) = happyShift action_10
action_31 (12) = happyGoto action_40
action_31 (14) = happyGoto action_47
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_13

action_33 (48) = happyShift action_10
action_33 (12) = happyGoto action_40
action_33 (14) = happyGoto action_46
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_10

action_35 (23) = happyShift action_26
action_35 (30) = happyShift action_45
action_35 (38) = happyShift action_27
action_35 (43) = happyShift action_30
action_35 (46) = happyShift action_32
action_35 (48) = happyShift action_10
action_35 (49) = happyShift action_34
action_35 (12) = happyGoto action_20
action_35 (13) = happyGoto action_21
action_35 (15) = happyGoto action_22
action_35 (16) = happyGoto action_44
action_35 _ = happyReduce_28

action_36 (50) = happyAccept
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (23) = happyShift action_26
action_37 (38) = happyShift action_27
action_37 (43) = happyShift action_30
action_37 (46) = happyShift action_32
action_37 (48) = happyShift action_10
action_37 (49) = happyShift action_34
action_37 (50) = happyAccept
action_37 (12) = happyGoto action_20
action_37 (13) = happyGoto action_21
action_37 (15) = happyGoto action_22
action_37 (16) = happyGoto action_44
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (25) = happyShift action_42
action_38 (26) = happyShift action_43
action_38 (50) = happyAccept
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (50) = happyAccept
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_11

action_41 (50) = happyAccept
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (23) = happyShift action_26
action_42 (38) = happyShift action_27
action_42 (46) = happyShift action_32
action_42 (48) = happyShift action_10
action_42 (49) = happyShift action_34
action_42 (12) = happyGoto action_20
action_42 (13) = happyGoto action_21
action_42 (15) = happyGoto action_64
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (23) = happyShift action_26
action_43 (38) = happyShift action_27
action_43 (46) = happyShift action_32
action_43 (48) = happyShift action_10
action_43 (49) = happyShift action_34
action_43 (12) = happyGoto action_20
action_43 (13) = happyGoto action_21
action_43 (15) = happyGoto action_63
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (25) = happyShift action_42
action_44 (26) = happyShift action_43
action_44 _ = happyReduce_24

action_45 (32) = happyShift action_16
action_45 (33) = happyShift action_17
action_45 (40) = happyShift action_18
action_45 (48) = happyShift action_10
action_45 (12) = happyGoto action_13
action_45 (20) = happyGoto action_62
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (28) = happyShift action_61
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (31) = happyShift action_60
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (23) = happyShift action_26
action_48 (38) = happyShift action_27
action_48 (39) = happyShift action_28
action_48 (41) = happyShift action_29
action_48 (43) = happyShift action_30
action_48 (44) = happyShift action_31
action_48 (46) = happyShift action_32
action_48 (47) = happyShift action_33
action_48 (48) = happyShift action_10
action_48 (49) = happyShift action_34
action_48 (12) = happyGoto action_20
action_48 (13) = happyGoto action_21
action_48 (15) = happyGoto action_22
action_48 (16) = happyGoto action_23
action_48 (17) = happyGoto action_35
action_48 (18) = happyGoto action_59
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (23) = happyShift action_26
action_49 (38) = happyShift action_27
action_49 (43) = happyShift action_30
action_49 (45) = happyShift action_58
action_49 (46) = happyShift action_32
action_49 (48) = happyShift action_10
action_49 (49) = happyShift action_34
action_49 (12) = happyGoto action_20
action_49 (13) = happyGoto action_21
action_49 (15) = happyGoto action_22
action_49 (16) = happyGoto action_44
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (42) = happyShift action_57
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (24) = happyShift action_56
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (32) = happyShift action_16
action_52 (33) = happyShift action_17
action_52 (40) = happyShift action_18
action_52 (48) = happyShift action_10
action_52 (12) = happyGoto action_13
action_52 (20) = happyGoto action_55
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (28) = happyShift action_54
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (32) = happyShift action_16
action_54 (33) = happyShift action_17
action_54 (40) = happyShift action_18
action_54 (48) = happyShift action_10
action_54 (12) = happyGoto action_13
action_54 (20) = happyGoto action_14
action_54 (21) = happyGoto action_70
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (27) = happyShift action_52
action_55 _ = happyReduce_32

action_56 _ = happyReduce_16

action_57 (34) = happyShift action_69
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (23) = happyShift action_26
action_58 (38) = happyShift action_27
action_58 (39) = happyShift action_28
action_58 (41) = happyShift action_29
action_58 (43) = happyShift action_30
action_58 (44) = happyShift action_31
action_58 (46) = happyShift action_32
action_58 (47) = happyShift action_33
action_58 (48) = happyShift action_10
action_58 (49) = happyShift action_34
action_58 (12) = happyGoto action_20
action_58 (13) = happyGoto action_21
action_58 (15) = happyGoto action_22
action_58 (16) = happyGoto action_23
action_58 (17) = happyGoto action_68
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (24) = happyShift action_67
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (23) = happyShift action_26
action_60 (38) = happyShift action_27
action_60 (39) = happyShift action_28
action_60 (41) = happyShift action_29
action_60 (43) = happyShift action_30
action_60 (44) = happyShift action_31
action_60 (46) = happyShift action_32
action_60 (47) = happyShift action_33
action_60 (48) = happyShift action_10
action_60 (49) = happyShift action_34
action_60 (12) = happyGoto action_20
action_60 (13) = happyGoto action_21
action_60 (15) = happyGoto action_22
action_60 (16) = happyGoto action_23
action_60 (17) = happyGoto action_66
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (23) = happyShift action_26
action_61 (38) = happyShift action_27
action_61 (39) = happyShift action_28
action_61 (41) = happyShift action_29
action_61 (43) = happyShift action_30
action_61 (44) = happyShift action_31
action_61 (46) = happyShift action_32
action_61 (47) = happyShift action_33
action_61 (48) = happyShift action_10
action_61 (49) = happyShift action_34
action_61 (12) = happyGoto action_20
action_61 (13) = happyGoto action_21
action_61 (15) = happyGoto action_22
action_61 (16) = happyGoto action_23
action_61 (17) = happyGoto action_24
action_61 (19) = happyGoto action_65
action_61 _ = happyFail (happyExpListPerState 61)

action_62 (27) = happyShift action_52
action_62 _ = happyReduce_27

action_63 _ = happyReduce_18

action_64 _ = happyReduce_17

action_65 _ = happyReduce_23

action_66 (23) = happyShift action_26
action_66 (38) = happyShift action_27
action_66 (42) = happyShift action_73
action_66 (43) = happyShift action_30
action_66 (46) = happyShift action_32
action_66 (48) = happyShift action_10
action_66 (49) = happyShift action_34
action_66 (12) = happyGoto action_20
action_66 (13) = happyGoto action_21
action_66 (15) = happyGoto action_22
action_66 (16) = happyGoto action_44
action_66 _ = happyFail (happyExpListPerState 66)

action_67 _ = happyReduce_19

action_68 (23) = happyShift action_26
action_68 (37) = happyShift action_72
action_68 (38) = happyShift action_27
action_68 (43) = happyShift action_30
action_68 (46) = happyShift action_32
action_68 (48) = happyShift action_10
action_68 (49) = happyShift action_34
action_68 (12) = happyGoto action_20
action_68 (13) = happyGoto action_21
action_68 (15) = happyGoto action_22
action_68 (16) = happyGoto action_44
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (23) = happyShift action_26
action_69 (38) = happyShift action_27
action_69 (39) = happyShift action_28
action_69 (41) = happyShift action_29
action_69 (43) = happyShift action_30
action_69 (44) = happyShift action_31
action_69 (46) = happyShift action_32
action_69 (47) = happyShift action_33
action_69 (48) = happyShift action_10
action_69 (49) = happyShift action_34
action_69 (12) = happyGoto action_20
action_69 (13) = happyGoto action_21
action_69 (15) = happyGoto action_22
action_69 (16) = happyGoto action_23
action_69 (17) = happyGoto action_71
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_34

action_71 (23) = happyShift action_26
action_71 (29) = happyShift action_76
action_71 (38) = happyShift action_27
action_71 (43) = happyShift action_30
action_71 (46) = happyShift action_32
action_71 (48) = happyShift action_10
action_71 (49) = happyShift action_34
action_71 (12) = happyGoto action_20
action_71 (13) = happyGoto action_21
action_71 (15) = happyGoto action_22
action_71 (16) = happyGoto action_44
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (23) = happyShift action_26
action_72 (38) = happyShift action_27
action_72 (39) = happyShift action_28
action_72 (41) = happyShift action_29
action_72 (43) = happyShift action_30
action_72 (44) = happyShift action_31
action_72 (46) = happyShift action_32
action_72 (47) = happyShift action_33
action_72 (48) = happyShift action_10
action_72 (49) = happyShift action_34
action_72 (12) = happyGoto action_20
action_72 (13) = happyGoto action_21
action_72 (15) = happyGoto action_22
action_72 (16) = happyGoto action_23
action_72 (17) = happyGoto action_75
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (23) = happyShift action_26
action_73 (38) = happyShift action_27
action_73 (39) = happyShift action_28
action_73 (41) = happyShift action_29
action_73 (43) = happyShift action_30
action_73 (44) = happyShift action_31
action_73 (46) = happyShift action_32
action_73 (47) = happyShift action_33
action_73 (48) = happyShift action_10
action_73 (49) = happyShift action_34
action_73 (12) = happyGoto action_20
action_73 (13) = happyGoto action_21
action_73 (15) = happyGoto action_22
action_73 (16) = happyGoto action_23
action_73 (17) = happyGoto action_24
action_73 (19) = happyGoto action_74
action_73 _ = happyFail (happyExpListPerState 73)

action_74 _ = happyReduce_22

action_75 (23) = happyShift action_26
action_75 (38) = happyShift action_27
action_75 (43) = happyShift action_30
action_75 (46) = happyShift action_32
action_75 (48) = happyShift action_10
action_75 (49) = happyShift action_34
action_75 (12) = happyGoto action_20
action_75 (13) = happyGoto action_21
action_75 (15) = happyGoto action_22
action_75 (16) = happyGoto action_44
action_75 _ = happyReduce_21

action_76 (23) = happyShift action_26
action_76 (38) = happyShift action_27
action_76 (39) = happyShift action_28
action_76 (41) = happyShift action_29
action_76 (43) = happyShift action_30
action_76 (44) = happyShift action_31
action_76 (46) = happyShift action_32
action_76 (47) = happyShift action_33
action_76 (48) = happyShift action_10
action_76 (49) = happyShift action_34
action_76 (12) = happyGoto action_20
action_76 (13) = happyGoto action_21
action_76 (15) = happyGoto action_22
action_76 (16) = happyGoto action_23
action_76 (17) = happyGoto action_77
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (23) = happyShift action_26
action_77 (35) = happyShift action_78
action_77 (38) = happyShift action_27
action_77 (43) = happyShift action_30
action_77 (46) = happyShift action_32
action_77 (48) = happyShift action_10
action_77 (49) = happyShift action_34
action_77 (12) = happyGoto action_20
action_77 (13) = happyGoto action_21
action_77 (15) = happyGoto action_22
action_77 (16) = happyGoto action_44
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (36) = happyShift action_79
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (23) = happyShift action_26
action_79 (38) = happyShift action_27
action_79 (39) = happyShift action_28
action_79 (41) = happyShift action_29
action_79 (43) = happyShift action_30
action_79 (44) = happyShift action_31
action_79 (46) = happyShift action_32
action_79 (47) = happyShift action_33
action_79 (48) = happyShift action_10
action_79 (49) = happyShift action_34
action_79 (12) = happyGoto action_20
action_79 (13) = happyGoto action_21
action_79 (15) = happyGoto action_22
action_79 (16) = happyGoto action_23
action_79 (17) = happyGoto action_24
action_79 (19) = happyGoto action_80
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_25

happyReduce_9 = happySpecReduce_1  12 happyReduction_9
happyReduction_9 (HappyTerminal (PT _ (TV happy_var_1)))
	 =  HappyAbsSyn12
		 (HM.Parser.Abs.Ident happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  13 happyReduction_10
happyReduction_10 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn13
		 ((read happy_var_1) :: Integer
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  14 happyReduction_11
happyReduction_11 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn14
		 (HM.Parser.Abs.PatternVar happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  15 happyReduction_12
happyReduction_12 (HappyAbsSyn12  happy_var_1)
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
happyReduction_15 (HappyAbsSyn13  happy_var_1)
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

happyReduce_23 = happyReduce 4 17 happyReduction_23
happyReduction_23 ((HappyAbsSyn19  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (HM.Parser.Abs.EAbs happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_2  17 happyReduction_24
happyReduction_24 (HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (HM.Parser.Abs.EApp happy_var_1 happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 10 17 happyReduction_25
happyReduction_25 ((HappyAbsSyn19  happy_var_10) `HappyStk`
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

happyReduce_26 = happySpecReduce_1  17 happyReduction_26
happyReduction_26 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  18 happyReduction_27
happyReduction_27 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (HM.Parser.Abs.ETyped happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  18 happyReduction_28
happyReduction_28 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  19 happyReduction_29
happyReduction_29 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn19
		 (HM.Parser.Abs.ScopedExp happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  20 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn20
		 (HM.Parser.Abs.TNat
	)

happyReduce_31 = happySpecReduce_1  20 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn20
		 (HM.Parser.Abs.TBool
	)

happyReduce_32 = happySpecReduce_3  20 happyReduction_32
happyReduction_32 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (HM.Parser.Abs.TArrow happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  20 happyReduction_33
happyReduction_33 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn20
		 (HM.Parser.Abs.TVar happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happyReduce 4 20 happyReduction_34
happyReduction_34 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 (HM.Parser.Abs.TForAll happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_1  21 happyReduction_35
happyReduction_35 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn21
		 (HM.Parser.Abs.ScopedType happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  22 happyReduction_36
happyReduction_36 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn22
		 (HM.Parser.Abs.TPatternVar happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 50 50 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 23;
	PT _ (TS _ 2) -> cont 24;
	PT _ (TS _ 3) -> cont 25;
	PT _ (TS _ 4) -> cont 26;
	PT _ (TS _ 5) -> cont 27;
	PT _ (TS _ 6) -> cont 28;
	PT _ (TS _ 7) -> cont 29;
	PT _ (TS _ 8) -> cont 30;
	PT _ (TS _ 9) -> cont 31;
	PT _ (TS _ 10) -> cont 32;
	PT _ (TS _ 11) -> cont 33;
	PT _ (TS _ 12) -> cont 34;
	PT _ (TS _ 13) -> cont 35;
	PT _ (TS _ 14) -> cont 36;
	PT _ (TS _ 15) -> cont 37;
	PT _ (TS _ 16) -> cont 38;
	PT _ (TS _ 17) -> cont 39;
	PT _ (TS _ 18) -> cont 40;
	PT _ (TS _ 19) -> cont 41;
	PT _ (TS _ 20) -> cont 42;
	PT _ (TS _ 21) -> cont 43;
	PT _ (TS _ 22) -> cont 44;
	PT _ (TS _ 23) -> cont 45;
	PT _ (TS _ 24) -> cont 46;
	PT _ (TS _ 25) -> cont 47;
	PT _ (TV happy_dollar_dollar) -> cont 48;
	PT _ (TI happy_dollar_dollar) -> cont 49;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 50 tk tks = happyError' (tks, explist)
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

pTypePattern tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_8 tks) (\x -> case x of {HappyAbsSyn22 z -> happyReturn z; _other -> notHappyAtAll })

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
