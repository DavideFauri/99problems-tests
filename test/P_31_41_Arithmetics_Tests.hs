module P_31_41_Arithmetics_Tests (arithmeticsTests) where

import qualified Problems as P
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.SmallCheck

arithmeticsTests :: [TestTree]
arithmeticsTests =
  [ testCase "Placeholder test" case_dummy
  ]

case_dummy :: Assertion
case_dummy = P.placeholder @?= "placeholder"
