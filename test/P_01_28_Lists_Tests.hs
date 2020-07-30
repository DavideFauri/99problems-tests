module P_01_28_Lists_Tests (listsTests) where

import qualified Problems as P
import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.SmallCheck
import Types

listsTests :: [TestTree]
listsTests =
  [ testGroup "Problem 01" problem01Tests
  ]

problem01Tests :: [TestTree]
problem01Tests =
  [ testCase "Finds the last element of a list of numbers" $ P.myLast [1, 2, 3, 4] @?= 4,
    testCase "Finds the last element of a list of chars" $ P.myLast ['x', 'y', 'z'] @?= 'z'
  ]
