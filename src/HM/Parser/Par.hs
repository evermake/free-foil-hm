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
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86 :: () => Prelude.Int -> ({-HappyReduction (Err) = -}
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
 happyReduce_37,
 happyReduce_38,
 happyReduce_39 :: () => ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,287) ([0,0,0,2,4096,4096,208,0,2,6722,0,64,56000,3,2048,22528,123,0,1,3947,0,49152,32912,2,0,4632,80,0,0,512,0,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,128,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,6144,0,0,0,0,0,0,0,0,0,256,27392,15,0,0,0,0,0,4096,0,128,46464,7,4096,0,0,0,0,2048,0,0,0,0,0,0,32,0,0,0,0,4128,42016,1,0,0,0,32768,32768,1680,0,192,0,0,0,0,0,0,0,0,0,0,0,0,256,256,13,8192,8192,416,0,48,0,0,0,579,10,0,2,0,0,512,0,0,64,56000,3,2048,2048,109,0,0,16,0,64,0,0,0,4632,80,0,16,0,0,512,0,0,0,2316,40,0,8576,1281,0,0,0,0,0,0,0,0,256,0,0,4,15788,0,256,0,0,4096,45056,246,0,2,7894,0,1024,0,0,0,0,0,0,0,0,0,0,0,0,1024,50176,52,0,0,0,0,16,53780,0,512,54784,30,0,0,0,0,0,0,0,16640,8448,13,8192,24576,493,0,4,15788,0,0,0,0,0,0,0,0,2,7894,0,64,18500,3,0,256,0,0,1,3947,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pPattern","%start_pExp3","%start_pExp2","%start_pExp1","%start_pExp","%start_pScopedExp","%start_pType","%start_pScopedType","%start_pTypePattern","Ident","Integer","UVarIdent","Pattern","Exp3","Exp2","Exp1","Exp","ScopedExp","Type","ScopedType","TypePattern","'('","')'","'+'","'-'","'->'","'.'","'..'","':'","'='","'Bool'","'Nat'","'['","']'","'do'","'else'","'fake'","'false'","'for'","'forall'","'if'","'in'","'iszero'","'let'","'then'","'true'","'\955'","L_Ident","L_integ","L_UVarIdent","%eof"]
        bit_start = st Prelude.* 53
        bit_end = (st Prelude.+ 1) Prelude.* 53
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..52]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (50) = happyShift action_10
action_0 (12) = happyGoto action_43
action_0 (15) = happyGoto action_44
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (24) = happyShift action_29
action_1 (40) = happyShift action_30
action_1 (48) = happyShift action_35
action_1 (50) = happyShift action_10
action_1 (51) = happyShift action_37
action_1 (12) = happyGoto action_23
action_1 (13) = happyGoto action_24
action_1 (16) = happyGoto action_42
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (24) = happyShift action_29
action_2 (40) = happyShift action_30
action_2 (45) = happyShift action_33
action_2 (48) = happyShift action_35
action_2 (50) = happyShift action_10
action_2 (51) = happyShift action_37
action_2 (12) = happyGoto action_23
action_2 (13) = happyGoto action_24
action_2 (16) = happyGoto action_25
action_2 (17) = happyGoto action_41
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (24) = happyShift action_29
action_3 (40) = happyShift action_30
action_3 (41) = happyShift action_31
action_3 (43) = happyShift action_32
action_3 (45) = happyShift action_33
action_3 (46) = happyShift action_34
action_3 (48) = happyShift action_35
action_3 (49) = happyShift action_36
action_3 (50) = happyShift action_10
action_3 (51) = happyShift action_37
action_3 (12) = happyGoto action_23
action_3 (13) = happyGoto action_24
action_3 (16) = happyGoto action_25
action_3 (17) = happyGoto action_26
action_3 (18) = happyGoto action_40
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (24) = happyShift action_29
action_4 (40) = happyShift action_30
action_4 (41) = happyShift action_31
action_4 (43) = happyShift action_32
action_4 (45) = happyShift action_33
action_4 (46) = happyShift action_34
action_4 (48) = happyShift action_35
action_4 (49) = happyShift action_36
action_4 (50) = happyShift action_10
action_4 (51) = happyShift action_37
action_4 (12) = happyGoto action_23
action_4 (13) = happyGoto action_24
action_4 (16) = happyGoto action_25
action_4 (17) = happyGoto action_26
action_4 (18) = happyGoto action_38
action_4 (19) = happyGoto action_39
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (24) = happyShift action_29
action_5 (40) = happyShift action_30
action_5 (41) = happyShift action_31
action_5 (43) = happyShift action_32
action_5 (45) = happyShift action_33
action_5 (46) = happyShift action_34
action_5 (48) = happyShift action_35
action_5 (49) = happyShift action_36
action_5 (50) = happyShift action_10
action_5 (51) = happyShift action_37
action_5 (12) = happyGoto action_23
action_5 (13) = happyGoto action_24
action_5 (16) = happyGoto action_25
action_5 (17) = happyGoto action_26
action_5 (18) = happyGoto action_27
action_5 (20) = happyGoto action_28
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (33) = happyShift action_17
action_6 (34) = happyShift action_18
action_6 (39) = happyShift action_19
action_6 (42) = happyShift action_20
action_6 (50) = happyShift action_10
action_6 (52) = happyShift action_21
action_6 (12) = happyGoto action_13
action_6 (14) = happyGoto action_14
action_6 (21) = happyGoto action_22
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (33) = happyShift action_17
action_7 (34) = happyShift action_18
action_7 (39) = happyShift action_19
action_7 (42) = happyShift action_20
action_7 (50) = happyShift action_10
action_7 (52) = happyShift action_21
action_7 (12) = happyGoto action_13
action_7 (14) = happyGoto action_14
action_7 (21) = happyGoto action_15
action_7 (22) = happyGoto action_16
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (50) = happyShift action_10
action_8 (12) = happyGoto action_11
action_8 (23) = happyGoto action_12
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (50) = happyShift action_10
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_9

action_11 _ = happyReduce_39

action_12 (53) = happyAccept
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_35

action_14 _ = happyReduce_31

action_15 (28) = happyShift action_55
action_15 _ = happyReduce_38

action_16 (53) = happyAccept
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_33

action_18 _ = happyReduce_32

action_19 (50) = happyShift action_10
action_19 (12) = happyGoto action_11
action_19 (23) = happyGoto action_57
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (52) = happyShift action_21
action_20 (14) = happyGoto action_56
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_11

action_22 (28) = happyShift action_55
action_22 (53) = happyAccept
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_13

action_24 _ = happyReduce_16

action_25 _ = happyReduce_21

action_26 (26) = happyShift action_45
action_26 (27) = happyShift action_46
action_26 _ = happyReduce_27

action_27 (24) = happyShift action_29
action_27 (40) = happyShift action_30
action_27 (45) = happyShift action_33
action_27 (48) = happyShift action_35
action_27 (50) = happyShift action_10
action_27 (51) = happyShift action_37
action_27 (12) = happyGoto action_23
action_27 (13) = happyGoto action_24
action_27 (16) = happyGoto action_25
action_27 (17) = happyGoto action_47
action_27 _ = happyReduce_30

action_28 (53) = happyAccept
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (24) = happyShift action_29
action_29 (40) = happyShift action_30
action_29 (41) = happyShift action_31
action_29 (43) = happyShift action_32
action_29 (45) = happyShift action_33
action_29 (46) = happyShift action_34
action_29 (48) = happyShift action_35
action_29 (49) = happyShift action_36
action_29 (50) = happyShift action_10
action_29 (51) = happyShift action_37
action_29 (12) = happyGoto action_23
action_29 (13) = happyGoto action_24
action_29 (16) = happyGoto action_25
action_29 (17) = happyGoto action_26
action_29 (18) = happyGoto action_38
action_29 (19) = happyGoto action_54
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_15

action_31 (50) = happyShift action_10
action_31 (12) = happyGoto action_43
action_31 (15) = happyGoto action_53
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (24) = happyShift action_29
action_32 (40) = happyShift action_30
action_32 (41) = happyShift action_31
action_32 (43) = happyShift action_32
action_32 (45) = happyShift action_33
action_32 (46) = happyShift action_34
action_32 (48) = happyShift action_35
action_32 (49) = happyShift action_36
action_32 (50) = happyShift action_10
action_32 (51) = happyShift action_37
action_32 (12) = happyGoto action_23
action_32 (13) = happyGoto action_24
action_32 (16) = happyGoto action_25
action_32 (17) = happyGoto action_26
action_32 (18) = happyGoto action_52
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (24) = happyShift action_51
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (50) = happyShift action_10
action_34 (12) = happyGoto action_43
action_34 (15) = happyGoto action_50
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_14

action_36 (50) = happyShift action_10
action_36 (12) = happyGoto action_43
action_36 (15) = happyGoto action_49
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_10

action_38 (24) = happyShift action_29
action_38 (31) = happyShift action_48
action_38 (40) = happyShift action_30
action_38 (45) = happyShift action_33
action_38 (48) = happyShift action_35
action_38 (50) = happyShift action_10
action_38 (51) = happyShift action_37
action_38 (12) = happyGoto action_23
action_38 (13) = happyGoto action_24
action_38 (16) = happyGoto action_25
action_38 (17) = happyGoto action_47
action_38 _ = happyReduce_29

action_39 (53) = happyAccept
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (24) = happyShift action_29
action_40 (40) = happyShift action_30
action_40 (45) = happyShift action_33
action_40 (48) = happyShift action_35
action_40 (50) = happyShift action_10
action_40 (51) = happyShift action_37
action_40 (53) = happyAccept
action_40 (12) = happyGoto action_23
action_40 (13) = happyGoto action_24
action_40 (16) = happyGoto action_25
action_40 (17) = happyGoto action_47
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (26) = happyShift action_45
action_41 (27) = happyShift action_46
action_41 (53) = happyAccept
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (53) = happyAccept
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_12

action_44 (53) = happyAccept
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (24) = happyShift action_29
action_45 (40) = happyShift action_30
action_45 (48) = happyShift action_35
action_45 (50) = happyShift action_10
action_45 (51) = happyShift action_37
action_45 (12) = happyGoto action_23
action_45 (13) = happyGoto action_24
action_45 (16) = happyGoto action_69
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (24) = happyShift action_29
action_46 (40) = happyShift action_30
action_46 (48) = happyShift action_35
action_46 (50) = happyShift action_10
action_46 (51) = happyShift action_37
action_46 (12) = happyGoto action_23
action_46 (13) = happyGoto action_24
action_46 (16) = happyGoto action_68
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (26) = happyShift action_45
action_47 (27) = happyShift action_46
action_47 _ = happyReduce_25

action_48 (33) = happyShift action_17
action_48 (34) = happyShift action_18
action_48 (39) = happyShift action_19
action_48 (42) = happyShift action_20
action_48 (50) = happyShift action_10
action_48 (52) = happyShift action_21
action_48 (12) = happyGoto action_13
action_48 (14) = happyGoto action_14
action_48 (21) = happyGoto action_67
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (29) = happyShift action_66
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (32) = happyShift action_65
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (24) = happyShift action_29
action_51 (40) = happyShift action_30
action_51 (41) = happyShift action_31
action_51 (43) = happyShift action_32
action_51 (45) = happyShift action_33
action_51 (46) = happyShift action_34
action_51 (48) = happyShift action_35
action_51 (49) = happyShift action_36
action_51 (50) = happyShift action_10
action_51 (51) = happyShift action_37
action_51 (12) = happyGoto action_23
action_51 (13) = happyGoto action_24
action_51 (16) = happyGoto action_25
action_51 (17) = happyGoto action_26
action_51 (18) = happyGoto action_38
action_51 (19) = happyGoto action_64
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (24) = happyShift action_29
action_52 (40) = happyShift action_30
action_52 (45) = happyShift action_33
action_52 (47) = happyShift action_63
action_52 (48) = happyShift action_35
action_52 (50) = happyShift action_10
action_52 (51) = happyShift action_37
action_52 (12) = happyGoto action_23
action_52 (13) = happyGoto action_24
action_52 (16) = happyGoto action_25
action_52 (17) = happyGoto action_47
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (44) = happyShift action_62
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (25) = happyShift action_61
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (33) = happyShift action_17
action_55 (34) = happyShift action_18
action_55 (39) = happyShift action_19
action_55 (42) = happyShift action_20
action_55 (50) = happyShift action_10
action_55 (52) = happyShift action_21
action_55 (12) = happyGoto action_13
action_55 (14) = happyGoto action_14
action_55 (21) = happyGoto action_60
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (29) = happyShift action_59
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (29) = happyShift action_58
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (33) = happyShift action_17
action_58 (34) = happyShift action_18
action_58 (39) = happyShift action_19
action_58 (42) = happyShift action_20
action_58 (50) = happyShift action_10
action_58 (52) = happyShift action_21
action_58 (12) = happyGoto action_13
action_58 (14) = happyGoto action_14
action_58 (21) = happyGoto action_15
action_58 (22) = happyGoto action_76
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (33) = happyShift action_17
action_59 (34) = happyShift action_18
action_59 (39) = happyShift action_19
action_59 (42) = happyShift action_20
action_59 (50) = happyShift action_10
action_59 (52) = happyShift action_21
action_59 (12) = happyGoto action_13
action_59 (14) = happyGoto action_14
action_59 (21) = happyGoto action_75
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (28) = happyShift action_55
action_60 _ = happyReduce_34

action_61 _ = happyReduce_17

action_62 (35) = happyShift action_74
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (24) = happyShift action_29
action_63 (40) = happyShift action_30
action_63 (41) = happyShift action_31
action_63 (43) = happyShift action_32
action_63 (45) = happyShift action_33
action_63 (46) = happyShift action_34
action_63 (48) = happyShift action_35
action_63 (49) = happyShift action_36
action_63 (50) = happyShift action_10
action_63 (51) = happyShift action_37
action_63 (12) = happyGoto action_23
action_63 (13) = happyGoto action_24
action_63 (16) = happyGoto action_25
action_63 (17) = happyGoto action_26
action_63 (18) = happyGoto action_73
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (25) = happyShift action_72
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (24) = happyShift action_29
action_65 (40) = happyShift action_30
action_65 (41) = happyShift action_31
action_65 (43) = happyShift action_32
action_65 (45) = happyShift action_33
action_65 (46) = happyShift action_34
action_65 (48) = happyShift action_35
action_65 (49) = happyShift action_36
action_65 (50) = happyShift action_10
action_65 (51) = happyShift action_37
action_65 (12) = happyGoto action_23
action_65 (13) = happyGoto action_24
action_65 (16) = happyGoto action_25
action_65 (17) = happyGoto action_26
action_65 (18) = happyGoto action_71
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (24) = happyShift action_29
action_66 (40) = happyShift action_30
action_66 (41) = happyShift action_31
action_66 (43) = happyShift action_32
action_66 (45) = happyShift action_33
action_66 (46) = happyShift action_34
action_66 (48) = happyShift action_35
action_66 (49) = happyShift action_36
action_66 (50) = happyShift action_10
action_66 (51) = happyShift action_37
action_66 (12) = happyGoto action_23
action_66 (13) = happyGoto action_24
action_66 (16) = happyGoto action_25
action_66 (17) = happyGoto action_26
action_66 (18) = happyGoto action_27
action_66 (20) = happyGoto action_70
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (28) = happyShift action_55
action_67 _ = happyReduce_28

action_68 _ = happyReduce_19

action_69 _ = happyReduce_18

action_70 _ = happyReduce_24

action_71 (24) = happyShift action_29
action_71 (40) = happyShift action_30
action_71 (44) = happyShift action_79
action_71 (45) = happyShift action_33
action_71 (48) = happyShift action_35
action_71 (50) = happyShift action_10
action_71 (51) = happyShift action_37
action_71 (12) = happyGoto action_23
action_71 (13) = happyGoto action_24
action_71 (16) = happyGoto action_25
action_71 (17) = happyGoto action_47
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_20

action_73 (24) = happyShift action_29
action_73 (38) = happyShift action_78
action_73 (40) = happyShift action_30
action_73 (45) = happyShift action_33
action_73 (48) = happyShift action_35
action_73 (50) = happyShift action_10
action_73 (51) = happyShift action_37
action_73 (12) = happyGoto action_23
action_73 (13) = happyGoto action_24
action_73 (16) = happyGoto action_25
action_73 (17) = happyGoto action_47
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (24) = happyShift action_29
action_74 (40) = happyShift action_30
action_74 (41) = happyShift action_31
action_74 (43) = happyShift action_32
action_74 (45) = happyShift action_33
action_74 (46) = happyShift action_34
action_74 (48) = happyShift action_35
action_74 (49) = happyShift action_36
action_74 (50) = happyShift action_10
action_74 (51) = happyShift action_37
action_74 (12) = happyGoto action_23
action_74 (13) = happyGoto action_24
action_74 (16) = happyGoto action_25
action_74 (17) = happyGoto action_26
action_74 (18) = happyGoto action_77
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (28) = happyShift action_55
action_75 _ = happyReduce_37

action_76 _ = happyReduce_36

action_77 (24) = happyShift action_29
action_77 (30) = happyShift action_82
action_77 (40) = happyShift action_30
action_77 (45) = happyShift action_33
action_77 (48) = happyShift action_35
action_77 (50) = happyShift action_10
action_77 (51) = happyShift action_37
action_77 (12) = happyGoto action_23
action_77 (13) = happyGoto action_24
action_77 (16) = happyGoto action_25
action_77 (17) = happyGoto action_47
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (24) = happyShift action_29
action_78 (40) = happyShift action_30
action_78 (41) = happyShift action_31
action_78 (43) = happyShift action_32
action_78 (45) = happyShift action_33
action_78 (46) = happyShift action_34
action_78 (48) = happyShift action_35
action_78 (49) = happyShift action_36
action_78 (50) = happyShift action_10
action_78 (51) = happyShift action_37
action_78 (12) = happyGoto action_23
action_78 (13) = happyGoto action_24
action_78 (16) = happyGoto action_25
action_78 (17) = happyGoto action_26
action_78 (18) = happyGoto action_81
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (24) = happyShift action_29
action_79 (40) = happyShift action_30
action_79 (41) = happyShift action_31
action_79 (43) = happyShift action_32
action_79 (45) = happyShift action_33
action_79 (46) = happyShift action_34
action_79 (48) = happyShift action_35
action_79 (49) = happyShift action_36
action_79 (50) = happyShift action_10
action_79 (51) = happyShift action_37
action_79 (12) = happyGoto action_23
action_79 (13) = happyGoto action_24
action_79 (16) = happyGoto action_25
action_79 (17) = happyGoto action_26
action_79 (18) = happyGoto action_27
action_79 (20) = happyGoto action_80
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_23

action_81 (24) = happyShift action_29
action_81 (40) = happyShift action_30
action_81 (45) = happyShift action_33
action_81 (48) = happyShift action_35
action_81 (50) = happyShift action_10
action_81 (51) = happyShift action_37
action_81 (12) = happyGoto action_23
action_81 (13) = happyGoto action_24
action_81 (16) = happyGoto action_25
action_81 (17) = happyGoto action_47
action_81 _ = happyReduce_22

action_82 (24) = happyShift action_29
action_82 (40) = happyShift action_30
action_82 (41) = happyShift action_31
action_82 (43) = happyShift action_32
action_82 (45) = happyShift action_33
action_82 (46) = happyShift action_34
action_82 (48) = happyShift action_35
action_82 (49) = happyShift action_36
action_82 (50) = happyShift action_10
action_82 (51) = happyShift action_37
action_82 (12) = happyGoto action_23
action_82 (13) = happyGoto action_24
action_82 (16) = happyGoto action_25
action_82 (17) = happyGoto action_26
action_82 (18) = happyGoto action_83
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (24) = happyShift action_29
action_83 (36) = happyShift action_84
action_83 (40) = happyShift action_30
action_83 (45) = happyShift action_33
action_83 (48) = happyShift action_35
action_83 (50) = happyShift action_10
action_83 (51) = happyShift action_37
action_83 (12) = happyGoto action_23
action_83 (13) = happyGoto action_24
action_83 (16) = happyGoto action_25
action_83 (17) = happyGoto action_47
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (37) = happyShift action_85
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (24) = happyShift action_29
action_85 (40) = happyShift action_30
action_85 (41) = happyShift action_31
action_85 (43) = happyShift action_32
action_85 (45) = happyShift action_33
action_85 (46) = happyShift action_34
action_85 (48) = happyShift action_35
action_85 (49) = happyShift action_36
action_85 (50) = happyShift action_10
action_85 (51) = happyShift action_37
action_85 (12) = happyGoto action_23
action_85 (13) = happyGoto action_24
action_85 (16) = happyGoto action_25
action_85 (17) = happyGoto action_26
action_85 (18) = happyGoto action_27
action_85 (20) = happyGoto action_86
action_85 _ = happyFail (happyExpListPerState 85)

action_86 _ = happyReduce_26

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

happyReduce_24 = happyReduce 4 18 happyReduction_24
happyReduction_24 ((HappyAbsSyn20  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (HM.Parser.Abs.EAbs happy_var_2 happy_var_4
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

happyReduce_36 = happyReduce 4 21 happyReduction_36
happyReduction_36 ((HappyAbsSyn22  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (HM.Parser.Abs.TFake happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_37 = happyReduce 4 21 happyReduction_37
happyReduction_37 ((HappyAbsSyn21  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn14  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 (HM.Parser.Abs.TForAll happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_1  22 happyReduction_38
happyReduction_38 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn22
		 (HM.Parser.Abs.ScopedType happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  23 happyReduction_39
happyReduction_39 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn23
		 (HM.Parser.Abs.TPatternVar happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 53 53 notHappyAtAll (HappyState action) sts stk []

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
	PT _ (TS _ 25) -> cont 48;
	PT _ (TS _ 26) -> cont 49;
	PT _ (TV happy_dollar_dollar) -> cont 50;
	PT _ (TI happy_dollar_dollar) -> cont 51;
	PT _ (T_UVarIdent happy_dollar_dollar) -> cont 52;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 53 tk tks = happyError' (tks, explist)
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
