module P_46_50_Logic_Tests (logicTests) where

import qualified Problems as P
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.SmallCheck

logicTests :: [TestTree]
logicTests =
  [ testCase "Placeholder test" case_dummy
  ]

case_dummy :: Assertion
case_dummy = P.placeholder @?= "placeholder"
