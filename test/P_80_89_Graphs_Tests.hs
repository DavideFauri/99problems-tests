module P_80_89_Graphs_Tests (graphsTests) where

import qualified Problems as P
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.SmallCheck

graphsTests :: [TestTree]
graphsTests =
  [ testCase "Placeholder test" case_dummy
  ]

case_dummy :: Assertion
case_dummy = P.placeholder @?= "placeholder"
