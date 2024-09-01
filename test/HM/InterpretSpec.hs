module HM.InterpretSpec where

import           Test.Hspec
import Control.Monad (forM_)
import           HM.Interpret

isSuccess :: Result -> Bool
isSuccess Success{} = True
isSuccess _ = False

isTypeError :: Result -> Bool
isTypeError (Failure TypecheckingError _) = True
isTypeError _ = False

wellTypedPaths :: [FilePath]
wellTypedPaths = ["well-typed/1.lam", "well-typed/2.lam", "well-typed/7.lam", "well-typed/8.lam", "well-typed/9.lam"]

illTypedPaths :: [FilePath]
illTypedPaths = ["ill-typed/1.lam", "ill-typed/2.lam", "ill-typed/7.lam", "ill-typed/8.lam", "ill-typed/9.lam"]

spec :: Spec
spec = do

  describe "well-typed expressions" $ do
    forM_ wellTypedPaths $ \path -> it path $ do
      contents <- readFile ("test/files/" ++ path)
      interpret contents `shouldSatisfy` isSuccess

  describe "ill-typed expressions" $ do
    forM_ illTypedPaths $ \path -> it path $ do
      contents <- readFile ("test/files/" ++ path)
      interpret contents `shouldSatisfy` isTypeError
