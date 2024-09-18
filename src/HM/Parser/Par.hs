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
	| HappyAbsSyn14 (HM.Parser.Abs.UVarIdent)
	| HappyAbsSyn15 (HM.Parser.Abs.Pattern)
	| HappyAbsSyn16 (HM.Parser.Abs.Exp)
	| HappyAbsSyn20 (HM.Parser.Abs.ScopedExp)
	| HappyAbsSyn21 (HM.Parser.Abs.Type)
	| HappyAbsSyn22 (HM.Parser.Abs.ScopedType)
	| HappyAbsSyn23 (HM.Parser.Abs.TypePattern)

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
 happyReduce_36,
 happyReduce_37 :: () => ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,281) ([0,0,32768,0,1024,512,13,8192,4096,105,0,32769,987,0,8,7900,0,64,63200,0,0,12,10,0,96,80,0,0,128,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,256,56192,3,0,0,0,0,0,64,0,2,1975,0,16,0,0,0,32768,0,0,0,0,0,0,32,0,0,0,0,1032,6724,0,0,0,0,512,37120,6,49152,0,0,0,0,0,0,0,0,0,0,0,0,256,16512,3,2048,1024,26,0,3,0,0,3072,2560,0,2048,0,0,32768,0,0,1024,28160,15,8192,4096,109,0,0,4,0,16,0,0,32768,16385,1,0,0,0,0,0,0,0,1024,0,0,4,3950,0,64,0,0,256,56192,3,0,48,40,0,4,0,0,0,0,0,0,0,0,6144,0,0,1024,12800,13,0,0,0,0,49153,840,0,8,7900,0,4160,53792,0,512,46848,7,4096,47104,61,32768,49152,493,0,0,0,0,0,0,0,0,0,0,2048,56320,30,16384,9216,210,0,16384,0,0,16,15800,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pPattern","%start_pExp3","%start_pExp2","%start_pExp1","%start_pExp","%start_pScopedExp","%start_pType","%start_pScopedType","%start_pTypePattern","Ident","Integer","UVarIdent","Pattern","Exp3","Exp2","Exp1","Exp","ScopedExp","Type","ScopedType","TypePattern","'('","')'","'+'","'-'","'->'","'.'","'..'","':'","'='","'Bool'","'Nat'","'['","']'","'do'","'else'","'false'","'for'","'if'","'in'","'iszero'","'let'","'then'","'true'","'\955'","L_Ident","L_integ","L_UVarIdent","%eof"]
        bit_start = st Prelude.* 51
        bit_end = (st Prelude.+ 1) Prelude.* 51
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..50]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (48) = happyShift action_10
action_0 (12) = happyGoto action_41
action_0 (15) = happyGoto action_42
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (24) = happyShift action_27
action_1 (39) = happyShift action_28
action_1 (46) = happyShift action_33
action_1 (48) = happyShift action_10
action_1 (49) = happyShift action_35
action_1 (12) = happyGoto action_21
action_1 (13) = happyGoto action_22
action_1 (16) = happyGoto action_40
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (24) = happyShift action_27
action_2 (39) = happyShift action_28
action_2 (43) = happyShift action_31
action_2 (46) = happyShift action_33
action_2 (48) = happyShift action_10
action_2 (49) = happyShift action_35
action_2 (12) = happyGoto action_21
action_2 (13) = happyGoto action_22
action_2 (16) = happyGoto action_23
action_2 (17) = happyGoto action_39
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (24) = happyShift action_27
action_3 (39) = happyShift action_28
action_3 (40) = happyShift action_29
action_3 (41) = happyShift action_30
action_3 (43) = happyShift action_31
action_3 (44) = happyShift action_32
action_3 (46) = happyShift action_33
action_3 (47) = happyShift action_34
action_3 (48) = happyShift action_10
action_3 (49) = happyShift action_35
action_3 (12) = happyGoto action_21
action_3 (13) = happyGoto action_22
action_3 (16) = happyGoto action_23
action_3 (17) = happyGoto action_24
action_3 (18) = happyGoto action_38
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (24) = happyShift action_27
action_4 (39) = happyShift action_28
action_4 (40) = happyShift action_29
action_4 (41) = happyShift action_30
action_4 (43) = happyShift action_31
action_4 (44) = happyShift action_32
action_4 (46) = happyShift action_33
action_4 (47) = happyShift action_34
action_4 (48) = happyShift action_10
action_4 (49) = happyShift action_35
action_4 (12) = happyGoto action_21
action_4 (13) = happyGoto action_22
action_4 (16) = happyGoto action_23
action_4 (17) = happyGoto action_24
action_4 (18) = happyGoto action_36
action_4 (19) = happyGoto action_37
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (24) = happyShift action_27
action_5 (39) = happyShift action_28
action_5 (40) = happyShift action_29
action_5 (41) = happyShift action_30
action_5 (43) = happyShift action_31
action_5 (44) = happyShift action_32
action_5 (46) = happyShift action_33
action_5 (47) = happyShift action_34
action_5 (48) = happyShift action_10
action_5 (49) = happyShift action_35
action_5 (12) = happyGoto action_21
action_5 (13) = happyGoto action_22
action_5 (16) = happyGoto action_23
action_5 (17) = happyGoto action_24
action_5 (18) = happyGoto action_25
action_5 (20) = happyGoto action_26
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (33) = happyShift action_17
action_6 (34) = happyShift action_18
action_6 (48) = happyShift action_10
action_6 (50) = happyShift action_19
action_6 (12) = happyGoto action_13
action_6 (14) = happyGoto action_14
action_6 (21) = happyGoto action_20
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (33) = happyShift action_17
action_7 (34) = happyShift action_18
action_7 (48) = happyShift action_10
action_7 (50) = happyShift action_19
action_7 (12) = happyGoto action_13
action_7 (14) = happyGoto action_14
action_7 (21) = happyGoto action_15
action_7 (22) = happyGoto action_16
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (48) = happyShift action_10
action_8 (12) = happyGoto action_11
action_8 (23) = happyGoto action_12
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (48) = happyShift action_10
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_9

action_11 _ = happyReduce_37

action_12 (51) = happyAccept
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_35

action_14 _ = happyReduce_31

action_15 (28) = happyShift action_53
action_15 _ = happyReduce_36

action_16 (51) = happyAccept
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_33

action_18 _ = happyReduce_32

action_19 _ = happyReduce_11

action_20 (28) = happyShift action_53
action_20 (51) = happyAccept
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_13

action_22 _ = happyReduce_16

action_23 _ = happyReduce_21

action_24 (26) = happyShift action_43
action_24 (27) = happyShift action_44
action_24 _ = happyReduce_27

action_25 (24) = happyShift action_27
action_25 (39) = happyShift action_28
action_25 (43) = happyShift action_31
action_25 (46) = happyShift action_33
action_25 (48) = happyShift action_10
action_25 (49) = happyShift action_35
action_25 (12) = happyGoto action_21
action_25 (13) = happyGoto action_22
action_25 (16) = happyGoto action_23
action_25 (17) = happyGoto action_45
action_25 _ = happyReduce_30

action_26 (51) = happyAccept
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (24) = happyShift action_27
action_27 (39) = happyShift action_28
action_27 (40) = happyShift action_29
action_27 (41) = happyShift action_30
action_27 (43) = happyShift action_31
action_27 (44) = happyShift action_32
action_27 (46) = happyShift action_33
action_27 (47) = happyShift action_34
action_27 (48) = happyShift action_10
action_27 (49) = happyShift action_35
action_27 (12) = happyGoto action_21
action_27 (13) = happyGoto action_22
action_27 (16) = happyGoto action_23
action_27 (17) = happyGoto action_24
action_27 (18) = happyGoto action_36
action_27 (19) = happyGoto action_52
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_15

action_29 (48) = happyShift action_10
action_29 (12) = happyGoto action_41
action_29 (15) = happyGoto action_51
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (24) = happyShift action_27
action_30 (39) = happyShift action_28
action_30 (40) = happyShift action_29
action_30 (41) = happyShift action_30
action_30 (43) = happyShift action_31
action_30 (44) = happyShift action_32
action_30 (46) = happyShift action_33
action_30 (47) = happyShift action_34
action_30 (48) = happyShift action_10
action_30 (49) = happyShift action_35
action_30 (12) = happyGoto action_21
action_30 (13) = happyGoto action_22
action_30 (16) = happyGoto action_23
action_30 (17) = happyGoto action_24
action_30 (18) = happyGoto action_50
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (24) = happyShift action_49
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (48) = happyShift action_10
action_32 (12) = happyGoto action_41
action_32 (15) = happyGoto action_48
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_14

action_34 (48) = happyShift action_10
action_34 (12) = happyGoto action_41
action_34 (15) = happyGoto action_47
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_10

action_36 (24) = happyShift action_27
action_36 (31) = happyShift action_46
action_36 (39) = happyShift action_28
action_36 (43) = happyShift action_31
action_36 (46) = happyShift action_33
action_36 (48) = happyShift action_10
action_36 (49) = happyShift action_35
action_36 (12) = happyGoto action_21
action_36 (13) = happyGoto action_22
action_36 (16) = happyGoto action_23
action_36 (17) = happyGoto action_45
action_36 _ = happyReduce_29

action_37 (51) = happyAccept
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (24) = happyShift action_27
action_38 (39) = happyShift action_28
action_38 (43) = happyShift action_31
action_38 (46) = happyShift action_33
action_38 (48) = happyShift action_10
action_38 (49) = happyShift action_35
action_38 (51) = happyAccept
action_38 (12) = happyGoto action_21
action_38 (13) = happyGoto action_22
action_38 (16) = happyGoto action_23
action_38 (17) = happyGoto action_45
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (26) = happyShift action_43
action_39 (27) = happyShift action_44
action_39 (51) = happyAccept
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (51) = happyAccept
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_12

action_42 (51) = happyAccept
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (24) = happyShift action_27
action_43 (39) = happyShift action_28
action_43 (46) = happyShift action_33
action_43 (48) = happyShift action_10
action_43 (49) = happyShift action_35
action_43 (12) = happyGoto action_21
action_43 (13) = happyGoto action_22
action_43 (16) = happyGoto action_63
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (24) = happyShift action_27
action_44 (39) = happyShift action_28
action_44 (46) = happyShift action_33
action_44 (48) = happyShift action_10
action_44 (49) = happyShift action_35
action_44 (12) = happyGoto action_21
action_44 (13) = happyGoto action_22
action_44 (16) = happyGoto action_62
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (26) = happyShift action_43
action_45 (27) = happyShift action_44
action_45 _ = happyReduce_25

action_46 (33) = happyShift action_17
action_46 (34) = happyShift action_18
action_46 (48) = happyShift action_10
action_46 (50) = happyShift action_19
action_46 (12) = happyGoto action_13
action_46 (14) = happyGoto action_14
action_46 (21) = happyGoto action_61
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (31) = happyShift action_60
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (32) = happyShift action_59
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (24) = happyShift action_27
action_49 (39) = happyShift action_28
action_49 (40) = happyShift action_29
action_49 (41) = happyShift action_30
action_49 (43) = happyShift action_31
action_49 (44) = happyShift action_32
action_49 (46) = happyShift action_33
action_49 (47) = happyShift action_34
action_49 (48) = happyShift action_10
action_49 (49) = happyShift action_35
action_49 (12) = happyGoto action_21
action_49 (13) = happyGoto action_22
action_49 (16) = happyGoto action_23
action_49 (17) = happyGoto action_24
action_49 (18) = happyGoto action_36
action_49 (19) = happyGoto action_58
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (24) = happyShift action_27
action_50 (39) = happyShift action_28
action_50 (43) = happyShift action_31
action_50 (45) = happyShift action_57
action_50 (46) = happyShift action_33
action_50 (48) = happyShift action_10
action_50 (49) = happyShift action_35
action_50 (12) = happyGoto action_21
action_50 (13) = happyGoto action_22
action_50 (16) = happyGoto action_23
action_50 (17) = happyGoto action_45
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (42) = happyShift action_56
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (25) = happyShift action_55
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (33) = happyShift action_17
action_53 (34) = happyShift action_18
action_53 (48) = happyShift action_10
action_53 (50) = happyShift action_19
action_53 (12) = happyGoto action_13
action_53 (14) = happyGoto action_14
action_53 (21) = happyGoto action_54
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (28) = happyShift action_53
action_54 _ = happyReduce_34

action_55 _ = happyReduce_17

action_56 (35) = happyShift action_68
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (24) = happyShift action_27
action_57 (39) = happyShift action_28
action_57 (40) = happyShift action_29
action_57 (41) = happyShift action_30
action_57 (43) = happyShift action_31
action_57 (44) = happyShift action_32
action_57 (46) = happyShift action_33
action_57 (47) = happyShift action_34
action_57 (48) = happyShift action_10
action_57 (49) = happyShift action_35
action_57 (12) = happyGoto action_21
action_57 (13) = happyGoto action_22
action_57 (16) = happyGoto action_23
action_57 (17) = happyGoto action_24
action_57 (18) = happyGoto action_67
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (25) = happyShift action_66
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (24) = happyShift action_27
action_59 (39) = happyShift action_28
action_59 (40) = happyShift action_29
action_59 (41) = happyShift action_30
action_59 (43) = happyShift action_31
action_59 (44) = happyShift action_32
action_59 (46) = happyShift action_33
action_59 (47) = happyShift action_34
action_59 (48) = happyShift action_10
action_59 (49) = happyShift action_35
action_59 (12) = happyGoto action_21
action_59 (13) = happyGoto action_22
action_59 (16) = happyGoto action_23
action_59 (17) = happyGoto action_24
action_59 (18) = happyGoto action_65
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (33) = happyShift action_17
action_60 (34) = happyShift action_18
action_60 (48) = happyShift action_10
action_60 (50) = happyShift action_19
action_60 (12) = happyGoto action_13
action_60 (14) = happyGoto action_14
action_60 (21) = happyGoto action_64
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (28) = happyShift action_53
action_61 _ = happyReduce_28

action_62 _ = happyReduce_19

action_63 _ = happyReduce_18

action_64 (28) = happyShift action_53
action_64 (29) = happyShift action_72
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (24) = happyShift action_27
action_65 (39) = happyShift action_28
action_65 (42) = happyShift action_71
action_65 (43) = happyShift action_31
action_65 (46) = happyShift action_33
action_65 (48) = happyShift action_10
action_65 (49) = happyShift action_35
action_65 (12) = happyGoto action_21
action_65 (13) = happyGoto action_22
action_65 (16) = happyGoto action_23
action_65 (17) = happyGoto action_45
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_20

action_67 (24) = happyShift action_27
action_67 (38) = happyShift action_70
action_67 (39) = happyShift action_28
action_67 (43) = happyShift action_31
action_67 (46) = happyShift action_33
action_67 (48) = happyShift action_10
action_67 (49) = happyShift action_35
action_67 (12) = happyGoto action_21
action_67 (13) = happyGoto action_22
action_67 (16) = happyGoto action_23
action_67 (17) = happyGoto action_45
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (24) = happyShift action_27
action_68 (39) = happyShift action_28
action_68 (40) = happyShift action_29
action_68 (41) = happyShift action_30
action_68 (43) = happyShift action_31
action_68 (44) = happyShift action_32
action_68 (46) = happyShift action_33
action_68 (47) = happyShift action_34
action_68 (48) = happyShift action_10
action_68 (49) = happyShift action_35
action_68 (12) = happyGoto action_21
action_68 (13) = happyGoto action_22
action_68 (16) = happyGoto action_23
action_68 (17) = happyGoto action_24
action_68 (18) = happyGoto action_69
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (24) = happyShift action_27
action_69 (30) = happyShift action_76
action_69 (39) = happyShift action_28
action_69 (43) = happyShift action_31
action_69 (46) = happyShift action_33
action_69 (48) = happyShift action_10
action_69 (49) = happyShift action_35
action_69 (12) = happyGoto action_21
action_69 (13) = happyGoto action_22
action_69 (16) = happyGoto action_23
action_69 (17) = happyGoto action_45
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (24) = happyShift action_27
action_70 (39) = happyShift action_28
action_70 (40) = happyShift action_29
action_70 (41) = happyShift action_30
action_70 (43) = happyShift action_31
action_70 (44) = happyShift action_32
action_70 (46) = happyShift action_33
action_70 (47) = happyShift action_34
action_70 (48) = happyShift action_10
action_70 (49) = happyShift action_35
action_70 (12) = happyGoto action_21
action_70 (13) = happyGoto action_22
action_70 (16) = happyGoto action_23
action_70 (17) = happyGoto action_24
action_70 (18) = happyGoto action_75
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (24) = happyShift action_27
action_71 (39) = happyShift action_28
action_71 (40) = happyShift action_29
action_71 (41) = happyShift action_30
action_71 (43) = happyShift action_31
action_71 (44) = happyShift action_32
action_71 (46) = happyShift action_33
action_71 (47) = happyShift action_34
action_71 (48) = happyShift action_10
action_71 (49) = happyShift action_35
action_71 (12) = happyGoto action_21
action_71 (13) = happyGoto action_22
action_71 (16) = happyGoto action_23
action_71 (17) = happyGoto action_24
action_71 (18) = happyGoto action_25
action_71 (20) = happyGoto action_74
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (24) = happyShift action_27
action_72 (39) = happyShift action_28
action_72 (40) = happyShift action_29
action_72 (41) = happyShift action_30
action_72 (43) = happyShift action_31
action_72 (44) = happyShift action_32
action_72 (46) = happyShift action_33
action_72 (47) = happyShift action_34
action_72 (48) = happyShift action_10
action_72 (49) = happyShift action_35
action_72 (12) = happyGoto action_21
action_72 (13) = happyGoto action_22
action_72 (16) = happyGoto action_23
action_72 (17) = happyGoto action_24
action_72 (18) = happyGoto action_25
action_72 (20) = happyGoto action_73
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_24

action_74 _ = happyReduce_23

action_75 (24) = happyShift action_27
action_75 (39) = happyShift action_28
action_75 (43) = happyShift action_31
action_75 (46) = happyShift action_33
action_75 (48) = happyShift action_10
action_75 (49) = happyShift action_35
action_75 (12) = happyGoto action_21
action_75 (13) = happyGoto action_22
action_75 (16) = happyGoto action_23
action_75 (17) = happyGoto action_45
action_75 _ = happyReduce_22

action_76 (24) = happyShift action_27
action_76 (39) = happyShift action_28
action_76 (40) = happyShift action_29
action_76 (41) = happyShift action_30
action_76 (43) = happyShift action_31
action_76 (44) = happyShift action_32
action_76 (46) = happyShift action_33
action_76 (47) = happyShift action_34
action_76 (48) = happyShift action_10
action_76 (49) = happyShift action_35
action_76 (12) = happyGoto action_21
action_76 (13) = happyGoto action_22
action_76 (16) = happyGoto action_23
action_76 (17) = happyGoto action_24
action_76 (18) = happyGoto action_77
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (24) = happyShift action_27
action_77 (36) = happyShift action_78
action_77 (39) = happyShift action_28
action_77 (43) = happyShift action_31
action_77 (46) = happyShift action_33
action_77 (48) = happyShift action_10
action_77 (49) = happyShift action_35
action_77 (12) = happyGoto action_21
action_77 (13) = happyGoto action_22
action_77 (16) = happyGoto action_23
action_77 (17) = happyGoto action_45
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (37) = happyShift action_79
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (24) = happyShift action_27
action_79 (39) = happyShift action_28
action_79 (40) = happyShift action_29
action_79 (41) = happyShift action_30
action_79 (43) = happyShift action_31
action_79 (44) = happyShift action_32
action_79 (46) = happyShift action_33
action_79 (47) = happyShift action_34
action_79 (48) = happyShift action_10
action_79 (49) = happyShift action_35
action_79 (12) = happyGoto action_21
action_79 (13) = happyGoto action_22
action_79 (16) = happyGoto action_23
action_79 (17) = happyGoto action_24
action_79 (18) = happyGoto action_25
action_79 (20) = happyGoto action_80
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_26

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
happyReduction_11 (HappyTerminal (PT _ (T_UVarIdent happy_var_1)))
	 =  HappyAbsSyn14
		 (HM.Parser.Abs.UVarIdent happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  15 happyReduction_12
happyReduction_12 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn15
		 (HM.Parser.Abs.PatternVar happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  16 happyReduction_13
happyReduction_13 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn16
		 (HM.Parser.Abs.EVar happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  16 happyReduction_14
happyReduction_14 _
	 =  HappyAbsSyn16
		 (HM.Parser.Abs.ETrue
	)

happyReduce_15 = happySpecReduce_1  16 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn16
		 (HM.Parser.Abs.EFalse
	)

happyReduce_16 = happySpecReduce_1  16 happyReduction_16
happyReduction_16 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn16
		 (HM.Parser.Abs.ENat happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  16 happyReduction_17
happyReduction_17 _
	(HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  17 happyReduction_18
happyReduction_18 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (HM.Parser.Abs.EAdd happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  17 happyReduction_19
happyReduction_19 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (HM.Parser.Abs.ESub happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happyReduce 4 17 happyReduction_20
happyReduction_20 (_ `HappyStk`
	(HappyAbsSyn16  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (HM.Parser.Abs.EIsZero happy_var_3
	) `HappyStk` happyRest

happyReduce_21 = happySpecReduce_1  17 happyReduction_21
happyReduction_21 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happyReduce 6 18 happyReduction_22
happyReduction_22 ((HappyAbsSyn16  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (HM.Parser.Abs.EIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_23 = happyReduce 6 18 happyReduction_23
happyReduction_23 ((HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (HM.Parser.Abs.ELet happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_24 = happyReduce 6 18 happyReduction_24
happyReduction_24 ((HappyAbsSyn20  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (HM.Parser.Abs.EAbs happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_2  18 happyReduction_25
happyReduction_25 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (HM.Parser.Abs.EApp happy_var_1 happy_var_2
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happyReduce 10 18 happyReduction_26
happyReduction_26 ((HappyAbsSyn20  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (HM.Parser.Abs.EFor happy_var_2 happy_var_5 happy_var_7 happy_var_10
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_1  18 happyReduction_27
happyReduction_27 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  19 happyReduction_28
happyReduction_28 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (HM.Parser.Abs.ETyped happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  19 happyReduction_29
happyReduction_29 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  20 happyReduction_30
happyReduction_30 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn20
		 (HM.Parser.Abs.ScopedExp happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  21 happyReduction_31
happyReduction_31 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn21
		 (HM.Parser.Abs.TUVar happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  21 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn21
		 (HM.Parser.Abs.TNat
	)

happyReduce_33 = happySpecReduce_1  21 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn21
		 (HM.Parser.Abs.TBool
	)

happyReduce_34 = happySpecReduce_3  21 happyReduction_34
happyReduction_34 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn21
		 (HM.Parser.Abs.TArrow happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  21 happyReduction_35
happyReduction_35 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn21
		 (HM.Parser.Abs.TVar happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  22 happyReduction_36
happyReduction_36 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn22
		 (HM.Parser.Abs.ScopedType happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  23 happyReduction_37
happyReduction_37 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn23
		 (HM.Parser.Abs.TPatternVar happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 51 51 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 24;
	PT _ (TS _ 2) -> cont 25;
	PT _ (TS _ 3) -> cont 26;
	PT _ (TS _ 4) -> cont 27;
	PT _ (TS _ 5) -> cont 28;
	PT _ (TS _ 6) -> cont 29;
	PT _ (TS _ 7) -> cont 30;
	PT _ (TS _ 8) -> cont 31;
	PT _ (TS _ 9) -> cont 32;
	PT _ (TS _ 10) -> cont 33;
	PT _ (TS _ 11) -> cont 34;
	PT _ (TS _ 12) -> cont 35;
	PT _ (TS _ 13) -> cont 36;
	PT _ (TS _ 14) -> cont 37;
	PT _ (TS _ 15) -> cont 38;
	PT _ (TS _ 16) -> cont 39;
	PT _ (TS _ 17) -> cont 40;
	PT _ (TS _ 18) -> cont 41;
	PT _ (TS _ 19) -> cont 42;
	PT _ (TS _ 20) -> cont 43;
	PT _ (TS _ 21) -> cont 44;
	PT _ (TS _ 22) -> cont 45;
	PT _ (TS _ 23) -> cont 46;
	PT _ (TS _ 24) -> cont 47;
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
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn15 z -> happyReturn z; _other -> notHappyAtAll })

pExp3 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn16 z -> happyReturn z; _other -> notHappyAtAll })

pExp2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn16 z -> happyReturn z; _other -> notHappyAtAll })

pExp1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn16 z -> happyReturn z; _other -> notHappyAtAll })

pExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn16 z -> happyReturn z; _other -> notHappyAtAll })

pScopedExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn20 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_6 tks) (\x -> case x of {HappyAbsSyn21 z -> happyReturn z; _other -> notHappyAtAll })

pScopedType tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_7 tks) (\x -> case x of {HappyAbsSyn22 z -> happyReturn z; _other -> notHappyAtAll })

pTypePattern tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_8 tks) (\x -> case x of {HappyAbsSyn23 z -> happyReturn z; _other -> notHappyAtAll })

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
