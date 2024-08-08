{-# OPTIONS_GHC -w #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
{-# LANGUAGE PatternSynonyms #-}

module HM.Parser.ParHM
  ( happyError
  , myLexer
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
	| HappyAbsSyn8 (Integer)
	| HappyAbsSyn9 (HM.Parser.AbsHM.TypedExp)
	| HappyAbsSyn10 (HM.Parser.AbsHM.Exp)
	| HappyAbsSyn13 (HM.Parser.AbsHM.Type)

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
 action_38 :: () => Prelude.Int -> ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyReduce_5,
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
 happyReduce_18 :: () => ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,82) ([8192,1760,512,106,40992,6,28162,0,12,0,64,0,0,0,0,0,0,0,0,0,0,32768,1,0,0,57376,6,0,8192,1760,512,0,0,0,24,0,0,0,0,512,0,192,8192,1696,512,106,57376,6,4096,16384,0,0,0,57376,6,4,0,0,0,0,0,0,0,0,16,512,110,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pTypedExp","%start_pExp2","%start_pExp1","%start_pExp","%start_pType","Integer","TypedExp","Exp2","Exp1","Exp","Type","'('","')'","'+'","'-'","'::'","'Bool'","'Nat'","'else'","'false'","'if'","'iszero'","'then'","'true'","L_integ","%eof"]
        bit_start = st Prelude.* 28
        bit_end = (st Prelude.+ 1) Prelude.* 28
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..27]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (14) = happyShift action_14
action_0 (22) = happyShift action_15
action_0 (23) = happyShift action_16
action_0 (24) = happyShift action_17
action_0 (26) = happyShift action_18
action_0 (27) = happyShift action_6
action_0 (8) = happyGoto action_10
action_0 (9) = happyGoto action_21
action_0 (10) = happyGoto action_11
action_0 (11) = happyGoto action_12
action_0 (12) = happyGoto action_22
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (14) = happyShift action_14
action_1 (22) = happyShift action_15
action_1 (24) = happyShift action_17
action_1 (26) = happyShift action_18
action_1 (27) = happyShift action_6
action_1 (8) = happyGoto action_10
action_1 (10) = happyGoto action_20
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (14) = happyShift action_14
action_2 (22) = happyShift action_15
action_2 (24) = happyShift action_17
action_2 (26) = happyShift action_18
action_2 (27) = happyShift action_6
action_2 (8) = happyGoto action_10
action_2 (10) = happyGoto action_11
action_2 (11) = happyGoto action_19
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (14) = happyShift action_14
action_3 (22) = happyShift action_15
action_3 (23) = happyShift action_16
action_3 (24) = happyShift action_17
action_3 (26) = happyShift action_18
action_3 (27) = happyShift action_6
action_3 (8) = happyGoto action_10
action_3 (10) = happyGoto action_11
action_3 (11) = happyGoto action_12
action_3 (12) = happyGoto action_13
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (19) = happyShift action_8
action_4 (20) = happyShift action_9
action_4 (13) = happyGoto action_7
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (27) = happyShift action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_5

action_7 (28) = happyAccept
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_18

action_9 _ = happyReduce_17

action_10 _ = happyReduce_9

action_11 _ = happyReduce_14

action_12 (16) = happyShift action_24
action_12 (17) = happyShift action_25
action_12 _ = happyReduce_16

action_13 (28) = happyAccept
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (14) = happyShift action_14
action_14 (22) = happyShift action_15
action_14 (23) = happyShift action_16
action_14 (24) = happyShift action_17
action_14 (26) = happyShift action_18
action_14 (27) = happyShift action_6
action_14 (8) = happyGoto action_10
action_14 (10) = happyGoto action_11
action_14 (11) = happyGoto action_12
action_14 (12) = happyGoto action_28
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_8

action_16 (14) = happyShift action_14
action_16 (22) = happyShift action_15
action_16 (23) = happyShift action_16
action_16 (24) = happyShift action_17
action_16 (26) = happyShift action_18
action_16 (27) = happyShift action_6
action_16 (8) = happyGoto action_10
action_16 (10) = happyGoto action_11
action_16 (11) = happyGoto action_12
action_16 (12) = happyGoto action_27
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (14) = happyShift action_26
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_7

action_19 (16) = happyShift action_24
action_19 (17) = happyShift action_25
action_19 (28) = happyAccept
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (28) = happyAccept
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (28) = happyAccept
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (18) = happyShift action_23
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (19) = happyShift action_8
action_23 (20) = happyShift action_9
action_23 (13) = happyGoto action_34
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (14) = happyShift action_14
action_24 (22) = happyShift action_15
action_24 (24) = happyShift action_17
action_24 (26) = happyShift action_18
action_24 (27) = happyShift action_6
action_24 (8) = happyGoto action_10
action_24 (10) = happyGoto action_33
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (14) = happyShift action_14
action_25 (22) = happyShift action_15
action_25 (24) = happyShift action_17
action_25 (26) = happyShift action_18
action_25 (27) = happyShift action_6
action_25 (8) = happyGoto action_10
action_25 (10) = happyGoto action_32
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (14) = happyShift action_14
action_26 (22) = happyShift action_15
action_26 (23) = happyShift action_16
action_26 (24) = happyShift action_17
action_26 (26) = happyShift action_18
action_26 (27) = happyShift action_6
action_26 (8) = happyGoto action_10
action_26 (10) = happyGoto action_11
action_26 (11) = happyGoto action_12
action_26 (12) = happyGoto action_31
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (25) = happyShift action_30
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (15) = happyShift action_29
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_11

action_30 (14) = happyShift action_14
action_30 (22) = happyShift action_15
action_30 (23) = happyShift action_16
action_30 (24) = happyShift action_17
action_30 (26) = happyShift action_18
action_30 (27) = happyShift action_6
action_30 (8) = happyGoto action_10
action_30 (10) = happyGoto action_11
action_30 (11) = happyGoto action_12
action_30 (12) = happyGoto action_36
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (15) = happyShift action_35
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_13

action_33 _ = happyReduce_12

action_34 _ = happyReduce_6

action_35 _ = happyReduce_10

action_36 (21) = happyShift action_37
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (14) = happyShift action_14
action_37 (22) = happyShift action_15
action_37 (23) = happyShift action_16
action_37 (24) = happyShift action_17
action_37 (26) = happyShift action_18
action_37 (27) = happyShift action_6
action_37 (8) = happyGoto action_10
action_37 (10) = happyGoto action_11
action_37 (11) = happyGoto action_12
action_37 (12) = happyGoto action_38
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_15

happyReduce_5 = happySpecReduce_1  8 happyReduction_5
happyReduction_5 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn8
		 ((read happy_var_1) :: Integer
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_3  9 happyReduction_6
happyReduction_6 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (HM.Parser.AbsHM.TypedExp happy_var_1 happy_var_3
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  10 happyReduction_7
happyReduction_7 _
	 =  HappyAbsSyn10
		 (HM.Parser.AbsHM.ETrue
	)

happyReduce_8 = happySpecReduce_1  10 happyReduction_8
happyReduction_8 _
	 =  HappyAbsSyn10
		 (HM.Parser.AbsHM.EFalse
	)

happyReduce_9 = happySpecReduce_1  10 happyReduction_9
happyReduction_9 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn10
		 (HM.Parser.AbsHM.ENat happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happyReduce 4 10 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (HM.Parser.AbsHM.EIsZero happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_3  10 happyReduction_11
happyReduction_11 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  11 happyReduction_12
happyReduction_12 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (HM.Parser.AbsHM.EAdd happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  11 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (HM.Parser.AbsHM.ESub happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  11 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happyReduce 6 12 happyReduction_15
happyReduction_15 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (HM.Parser.AbsHM.EIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  12 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  13 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn13
		 (HM.Parser.AbsHM.TNat
	)

happyReduce_18 = happySpecReduce_1  13 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn13
		 (HM.Parser.AbsHM.TBool
	)

happyNewToken action sts stk [] =
	action 28 28 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 14;
	PT _ (TS _ 2) -> cont 15;
	PT _ (TS _ 3) -> cont 16;
	PT _ (TS _ 4) -> cont 17;
	PT _ (TS _ 5) -> cont 18;
	PT _ (TS _ 6) -> cont 19;
	PT _ (TS _ 7) -> cont 20;
	PT _ (TS _ 8) -> cont 21;
	PT _ (TS _ 9) -> cont 22;
	PT _ (TS _ 10) -> cont 23;
	PT _ (TS _ 11) -> cont 24;
	PT _ (TS _ 12) -> cont 25;
	PT _ (TS _ 13) -> cont 26;
	PT _ (TI happy_dollar_dollar) -> cont 27;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 28 tk tks = happyError' (tks, explist)
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
pTypedExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn9 z -> happyReturn z; _other -> notHappyAtAll })

pExp2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn10 z -> happyReturn z; _other -> notHappyAtAll })

pExp1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn10 z -> happyReturn z; _other -> notHappyAtAll })

pExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn10 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn13 z -> happyReturn z; _other -> notHappyAtAll })

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
