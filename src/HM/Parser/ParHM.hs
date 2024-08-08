{-# OPTIONS_GHC -w #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
{-# LANGUAGE PatternSynonyms #-}

module HM.Parser.ParHM
  ( happyError
  , myLexer
  , pCommand
  , pTypedExp
  , pExp2
  , pExp1
  , pExp
  , pType
  ) where

import Prelude

import qualified HM.Parser.AbsHM
import HM.Parser.LexHM
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn9 (Integer)
	| HappyAbsSyn10 (HM.Parser.AbsHM.Command)
	| HappyAbsSyn11 (HM.Parser.AbsHM.TypedExp)
	| HappyAbsSyn12 (HM.Parser.AbsHM.Exp)
	| HappyAbsSyn15 (HM.Parser.AbsHM.Type)

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
 action_44 :: () => Prelude.Int -> ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyReduce_6,
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
 happyReduce_21 :: () => ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,101) ([0,320,32768,28160,32768,27136,32768,27136,32768,28160,0,48,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,0,6,0,0,32768,28160,0,0,32768,28160,32768,0,0,0,0,6,0,0,0,0,0,8,0,0,32768,28160,32768,28160,0,0,0,0,0,48,32768,27136,32768,27136,32768,28160,0,4096,0,1,0,0,32768,28160,0,1,0,0,0,0,0,0,0,0,0,128,32768,28160,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pCommand","%start_pTypedExp","%start_pExp2","%start_pExp1","%start_pExp","%start_pType","Integer","Command","TypedExp","Exp2","Exp1","Exp","Type","'('","')'","'+'","'-'","'::'","'Bool'","'Nat'","'check'","'else'","'eval'","'false'","'if'","'iszero'","'then'","'true'","L_integ","%eof"]
        bit_start = st Prelude.* 32
        bit_end = (st Prelude.+ 1) Prelude.* 32
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..31]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (23) = happyShift action_25
action_0 (25) = happyShift action_26
action_0 (10) = happyGoto action_24
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (16) = happyShift action_15
action_1 (26) = happyShift action_16
action_1 (27) = happyShift action_17
action_1 (28) = happyShift action_18
action_1 (30) = happyShift action_19
action_1 (31) = happyShift action_7
action_1 (9) = happyGoto action_11
action_1 (11) = happyGoto action_22
action_1 (12) = happyGoto action_12
action_1 (13) = happyGoto action_13
action_1 (14) = happyGoto action_23
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (16) = happyShift action_15
action_2 (26) = happyShift action_16
action_2 (28) = happyShift action_18
action_2 (30) = happyShift action_19
action_2 (31) = happyShift action_7
action_2 (9) = happyGoto action_11
action_2 (12) = happyGoto action_21
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (16) = happyShift action_15
action_3 (26) = happyShift action_16
action_3 (28) = happyShift action_18
action_3 (30) = happyShift action_19
action_3 (31) = happyShift action_7
action_3 (9) = happyGoto action_11
action_3 (12) = happyGoto action_12
action_3 (13) = happyGoto action_20
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (16) = happyShift action_15
action_4 (26) = happyShift action_16
action_4 (27) = happyShift action_17
action_4 (28) = happyShift action_18
action_4 (30) = happyShift action_19
action_4 (31) = happyShift action_7
action_4 (9) = happyGoto action_11
action_4 (12) = happyGoto action_12
action_4 (13) = happyGoto action_13
action_4 (14) = happyGoto action_14
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (21) = happyShift action_9
action_5 (22) = happyShift action_10
action_5 (15) = happyGoto action_8
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (31) = happyShift action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_6

action_8 (32) = happyAccept
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_21

action_10 _ = happyReduce_20

action_11 _ = happyReduce_12

action_12 _ = happyReduce_17

action_13 (18) = happyShift action_30
action_13 (19) = happyShift action_31
action_13 _ = happyReduce_19

action_14 (32) = happyAccept
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (16) = happyShift action_15
action_15 (26) = happyShift action_16
action_15 (27) = happyShift action_17
action_15 (28) = happyShift action_18
action_15 (30) = happyShift action_19
action_15 (31) = happyShift action_7
action_15 (9) = happyGoto action_11
action_15 (12) = happyGoto action_12
action_15 (13) = happyGoto action_13
action_15 (14) = happyGoto action_34
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_11

action_17 (16) = happyShift action_15
action_17 (26) = happyShift action_16
action_17 (27) = happyShift action_17
action_17 (28) = happyShift action_18
action_17 (30) = happyShift action_19
action_17 (31) = happyShift action_7
action_17 (9) = happyGoto action_11
action_17 (12) = happyGoto action_12
action_17 (13) = happyGoto action_13
action_17 (14) = happyGoto action_33
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (16) = happyShift action_32
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_10

action_20 (18) = happyShift action_30
action_20 (19) = happyShift action_31
action_20 (32) = happyAccept
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (32) = happyAccept
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (32) = happyAccept
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (20) = happyShift action_29
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (32) = happyAccept
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (16) = happyShift action_15
action_25 (26) = happyShift action_16
action_25 (27) = happyShift action_17
action_25 (28) = happyShift action_18
action_25 (30) = happyShift action_19
action_25 (31) = happyShift action_7
action_25 (9) = happyGoto action_11
action_25 (11) = happyGoto action_28
action_25 (12) = happyGoto action_12
action_25 (13) = happyGoto action_13
action_25 (14) = happyGoto action_23
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (16) = happyShift action_15
action_26 (26) = happyShift action_16
action_26 (27) = happyShift action_17
action_26 (28) = happyShift action_18
action_26 (30) = happyShift action_19
action_26 (31) = happyShift action_7
action_26 (9) = happyGoto action_11
action_26 (12) = happyGoto action_12
action_26 (13) = happyGoto action_13
action_26 (14) = happyGoto action_27
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_8

action_28 _ = happyReduce_7

action_29 (21) = happyShift action_9
action_29 (22) = happyShift action_10
action_29 (15) = happyGoto action_40
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (16) = happyShift action_15
action_30 (26) = happyShift action_16
action_30 (28) = happyShift action_18
action_30 (30) = happyShift action_19
action_30 (31) = happyShift action_7
action_30 (9) = happyGoto action_11
action_30 (12) = happyGoto action_39
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (16) = happyShift action_15
action_31 (26) = happyShift action_16
action_31 (28) = happyShift action_18
action_31 (30) = happyShift action_19
action_31 (31) = happyShift action_7
action_31 (9) = happyGoto action_11
action_31 (12) = happyGoto action_38
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (16) = happyShift action_15
action_32 (26) = happyShift action_16
action_32 (27) = happyShift action_17
action_32 (28) = happyShift action_18
action_32 (30) = happyShift action_19
action_32 (31) = happyShift action_7
action_32 (9) = happyGoto action_11
action_32 (12) = happyGoto action_12
action_32 (13) = happyGoto action_13
action_32 (14) = happyGoto action_37
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (29) = happyShift action_36
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (17) = happyShift action_35
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_14

action_36 (16) = happyShift action_15
action_36 (26) = happyShift action_16
action_36 (27) = happyShift action_17
action_36 (28) = happyShift action_18
action_36 (30) = happyShift action_19
action_36 (31) = happyShift action_7
action_36 (9) = happyGoto action_11
action_36 (12) = happyGoto action_12
action_36 (13) = happyGoto action_13
action_36 (14) = happyGoto action_42
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (17) = happyShift action_41
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_16

action_39 _ = happyReduce_15

action_40 _ = happyReduce_9

action_41 _ = happyReduce_13

action_42 (24) = happyShift action_43
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (16) = happyShift action_15
action_43 (26) = happyShift action_16
action_43 (27) = happyShift action_17
action_43 (28) = happyShift action_18
action_43 (30) = happyShift action_19
action_43 (31) = happyShift action_7
action_43 (9) = happyGoto action_11
action_43 (12) = happyGoto action_12
action_43 (13) = happyGoto action_13
action_43 (14) = happyGoto action_44
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_18

happyReduce_6 = happySpecReduce_1  9 happyReduction_6
happyReduction_6 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn9
		 ((read happy_var_1) :: Integer
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  10 happyReduction_7
happyReduction_7 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (HM.Parser.AbsHM.CommandCheck happy_var_2
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  10 happyReduction_8
happyReduction_8 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (HM.Parser.AbsHM.CommandEval happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  11 happyReduction_9
happyReduction_9 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (HM.Parser.AbsHM.TypedExp happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  12 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn12
		 (HM.Parser.AbsHM.ETrue
	)

happyReduce_11 = happySpecReduce_1  12 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn12
		 (HM.Parser.AbsHM.EFalse
	)

happyReduce_12 = happySpecReduce_1  12 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn12
		 (HM.Parser.AbsHM.ENat happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happyReduce 4 12 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (HM.Parser.AbsHM.EIsZero happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_3  12 happyReduction_14
happyReduction_14 _
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (happy_var_2
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  13 happyReduction_15
happyReduction_15 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (HM.Parser.AbsHM.EAdd happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  13 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (HM.Parser.AbsHM.ESub happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  13 happyReduction_17
happyReduction_17 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happyReduce 6 14 happyReduction_18
happyReduction_18 ((HappyAbsSyn12  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (HM.Parser.AbsHM.EIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_1  14 happyReduction_19
happyReduction_19 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  15 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn15
		 (HM.Parser.AbsHM.TNat
	)

happyReduce_21 = happySpecReduce_1  15 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn15
		 (HM.Parser.AbsHM.TBool
	)

happyNewToken action sts stk [] =
	action 32 32 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 16;
	PT _ (TS _ 2) -> cont 17;
	PT _ (TS _ 3) -> cont 18;
	PT _ (TS _ 4) -> cont 19;
	PT _ (TS _ 5) -> cont 20;
	PT _ (TS _ 6) -> cont 21;
	PT _ (TS _ 7) -> cont 22;
	PT _ (TS _ 8) -> cont 23;
	PT _ (TS _ 9) -> cont 24;
	PT _ (TS _ 10) -> cont 25;
	PT _ (TS _ 11) -> cont 26;
	PT _ (TS _ 12) -> cont 27;
	PT _ (TS _ 13) -> cont 28;
	PT _ (TS _ 14) -> cont 29;
	PT _ (TS _ 15) -> cont 30;
	PT _ (TI happy_dollar_dollar) -> cont 31;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 32 tk tks = happyError' (tks, explist)
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
pCommand tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn10 z -> happyReturn z; _other -> notHappyAtAll })

pTypedExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn11 z -> happyReturn z; _other -> notHappyAtAll })

pExp2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn12 z -> happyReturn z; _other -> notHappyAtAll })

pExp1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn12 z -> happyReturn z; _other -> notHappyAtAll })

pExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn12 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn15 z -> happyReturn z; _other -> notHappyAtAll })

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
