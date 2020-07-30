module P_90_99_Misc_Tests (miscTests) where

import qualified Problems as P
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.SmallCheck

miscTests :: [TestTree]
miscTests =
  [ testCase "Placeholder test" case_dummy
  ]

case_dummy :: Assertion
case_dummy = P.placeholder @?= "placeholder"
