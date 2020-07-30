module P_54_73_Trees_Tests (treesTests) where

import qualified Problems as P
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.SmallCheck

treesTests :: [TestTree]
treesTests =
  [ testCase "Placeholder test" case_dummy
  ]

case_dummy :: Assertion
case_dummy = P.placeholder @?= "placeholder"
