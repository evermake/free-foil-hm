{-# OPTIONS_GHC -w #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
{-# LANGUAGE PatternSynonyms #-}

module HM.Parser.ParHM
  ( happyError
  , myLexer
  , pExp2
  , pExp1
  , pExp
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
	| HappyAbsSyn6 (Integer)
	| HappyAbsSyn7 (HM.Parser.AbsHM.Exp)

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
 action_29 :: () => Prelude.Int -> ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13 :: () => ({-HappyReduction (Err) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,67) ([16896,16397,424,14088,0,4,0,0,0,49152,0,0,47168,1,0,1761,32,0,0,6,0,16896,16397,424,14088,0,16385,0,0,28800,8195,0,0,0,0,0,16,56352,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pExp2","%start_pExp1","%start_pExp","Integer","Exp2","Exp1","Exp","'('","')'","'+'","'-'","'else'","'false'","'if'","'iszero'","'then'","'true'","L_integ","%eof"]
        bit_start = st Prelude.* 21
        bit_end = (st Prelude.+ 1) Prelude.* 21
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..20]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (10) = happyShift action_9
action_0 (15) = happyShift action_10
action_0 (17) = happyShift action_12
action_0 (19) = happyShift action_13
action_0 (20) = happyShift action_4
action_0 (6) = happyGoto action_5
action_0 (7) = happyGoto action_15
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (10) = happyShift action_9
action_1 (15) = happyShift action_10
action_1 (17) = happyShift action_12
action_1 (19) = happyShift action_13
action_1 (20) = happyShift action_4
action_1 (6) = happyGoto action_5
action_1 (7) = happyGoto action_6
action_1 (8) = happyGoto action_14
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (10) = happyShift action_9
action_2 (15) = happyShift action_10
action_2 (16) = happyShift action_11
action_2 (17) = happyShift action_12
action_2 (19) = happyShift action_13
action_2 (20) = happyShift action_4
action_2 (6) = happyGoto action_5
action_2 (7) = happyGoto action_6
action_2 (8) = happyGoto action_7
action_2 (9) = happyGoto action_8
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (20) = happyShift action_4
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_3

action_5 _ = happyReduce_6

action_6 _ = happyReduce_11

action_7 (12) = happyShift action_16
action_7 (13) = happyShift action_17
action_7 _ = happyReduce_13

action_8 (21) = happyAccept
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (10) = happyShift action_9
action_9 (15) = happyShift action_10
action_9 (16) = happyShift action_11
action_9 (17) = happyShift action_12
action_9 (19) = happyShift action_13
action_9 (20) = happyShift action_4
action_9 (6) = happyGoto action_5
action_9 (7) = happyGoto action_6
action_9 (8) = happyGoto action_7
action_9 (9) = happyGoto action_20
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_5

action_11 (10) = happyShift action_9
action_11 (15) = happyShift action_10
action_11 (16) = happyShift action_11
action_11 (17) = happyShift action_12
action_11 (19) = happyShift action_13
action_11 (20) = happyShift action_4
action_11 (6) = happyGoto action_5
action_11 (7) = happyGoto action_6
action_11 (8) = happyGoto action_7
action_11 (9) = happyGoto action_19
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (10) = happyShift action_18
action_12 _ = happyFail (happyExpListPerState 12)

action_13 _ = happyReduce_4

action_14 (12) = happyShift action_16
action_14 (13) = happyShift action_17
action_14 (21) = happyAccept
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (21) = happyAccept
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (10) = happyShift action_9
action_16 (15) = happyShift action_10
action_16 (17) = happyShift action_12
action_16 (19) = happyShift action_13
action_16 (20) = happyShift action_4
action_16 (6) = happyGoto action_5
action_16 (7) = happyGoto action_25
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (10) = happyShift action_9
action_17 (15) = happyShift action_10
action_17 (17) = happyShift action_12
action_17 (19) = happyShift action_13
action_17 (20) = happyShift action_4
action_17 (6) = happyGoto action_5
action_17 (7) = happyGoto action_24
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (10) = happyShift action_9
action_18 (15) = happyShift action_10
action_18 (16) = happyShift action_11
action_18 (17) = happyShift action_12
action_18 (19) = happyShift action_13
action_18 (20) = happyShift action_4
action_18 (6) = happyGoto action_5
action_18 (7) = happyGoto action_6
action_18 (8) = happyGoto action_7
action_18 (9) = happyGoto action_23
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (18) = happyShift action_22
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (11) = happyShift action_21
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_8

action_22 (10) = happyShift action_9
action_22 (15) = happyShift action_10
action_22 (16) = happyShift action_11
action_22 (17) = happyShift action_12
action_22 (19) = happyShift action_13
action_22 (20) = happyShift action_4
action_22 (6) = happyGoto action_5
action_22 (7) = happyGoto action_6
action_22 (8) = happyGoto action_7
action_22 (9) = happyGoto action_27
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (11) = happyShift action_26
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_10

action_25 _ = happyReduce_9

action_26 _ = happyReduce_7

action_27 (14) = happyShift action_28
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (10) = happyShift action_9
action_28 (15) = happyShift action_10
action_28 (16) = happyShift action_11
action_28 (17) = happyShift action_12
action_28 (19) = happyShift action_13
action_28 (20) = happyShift action_4
action_28 (6) = happyGoto action_5
action_28 (7) = happyGoto action_6
action_28 (8) = happyGoto action_7
action_28 (9) = happyGoto action_29
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_12

happyReduce_3 = happySpecReduce_1  6 happyReduction_3
happyReduction_3 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn6
		 ((read happy_var_1) :: Integer
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  7 happyReduction_4
happyReduction_4 _
	 =  HappyAbsSyn7
		 (HM.Parser.AbsHM.ETrue
	)

happyReduce_5 = happySpecReduce_1  7 happyReduction_5
happyReduction_5 _
	 =  HappyAbsSyn7
		 (HM.Parser.AbsHM.EFalse
	)

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (HM.Parser.AbsHM.ENat happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happyReduce 4 7 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (HM.Parser.AbsHM.EIsZero happy_var_3
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  7 happyReduction_8
happyReduction_8 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  8 happyReduction_9
happyReduction_9 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (HM.Parser.AbsHM.EAdd happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  8 happyReduction_10
happyReduction_10 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (HM.Parser.AbsHM.ESub happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  8 happyReduction_11
happyReduction_11 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happyReduce 6 9 happyReduction_12
happyReduction_12 ((HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (HM.Parser.AbsHM.EIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 21 21 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 10;
	PT _ (TS _ 2) -> cont 11;
	PT _ (TS _ 3) -> cont 12;
	PT _ (TS _ 4) -> cont 13;
	PT _ (TS _ 5) -> cont 14;
	PT _ (TS _ 6) -> cont 15;
	PT _ (TS _ 7) -> cont 16;
	PT _ (TS _ 8) -> cont 17;
	PT _ (TS _ 9) -> cont 18;
	PT _ (TS _ 10) -> cont 19;
	PT _ (TI happy_dollar_dollar) -> cont 20;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 21 tk tks = happyError' (tks, explist)
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
pExp2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn7 z -> happyReturn z; _other -> notHappyAtAll })

pExp1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn7 z -> happyReturn z; _other -> notHappyAtAll })

pExp tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn7 z -> happyReturn z; _other -> notHappyAtAll })

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
