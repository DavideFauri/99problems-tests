module P_46_50_Logic_Tests (logicTests) where

import qualified Problems as P
import Test.Tasty
import Test.Tasty.HUnit

-- import Test.Tasty.QuickCheck

logicTests :: TestTree
logicTests =
  testGroup
    "Logic"
    [ testGroup "Problem 46" problem46Tests,
      testGroup "Problem 47" problem47Tests,
      testGroup "Problem 48" problem48Tests,
      testGroup "Problem 49" problem49Tests,
      testGroup "Problem 50" problem50Tests
    ]

problem46Tests :: [TestTree]
problem46Tests =
  [ testCase "Truth table of a given logical expression in two variables" $
      P.table (\a b -> P.and' a (P.or' a b))
        @?= [(True, True, True), (True, False, True), (False, True, False), (False, False, False)]
  ]

problem47Tests :: [TestTree]
problem47Tests =
  [ testCase "Truth table of a given logical expression using operators in two variables" $
      P.table2 (\a b -> a `P.and'` (a `P.or'` not b))
        @?= [(True, True, True), (True, False, True), (False, True, False), (False, False, False)]
  ]

problem48Tests :: [TestTree]
problem48Tests =
  [ testCase "Truth table of a given logical expression using operators in N variables" $
      P.tablen 3 (\[a, b, c] -> a `P.and'` (b `P.or'` c) `P.equ'` a `P.and'` b `P.or'` a `P.and'` c)
        @?= [ ([True, True, True], True),
              ([True, True, False], True),
              ([True, False, True], True),
              ([True, False, False], True),
              ([False, True, True], True),
              ([False, True, False], True),
              ([False, False, True], True),
              ([False, False, False], True)
            ]
  ]

problem49Tests :: [TestTree]
problem49Tests =
  [ testCase "Produces a gray encoding of length 3" $
      P.gray 3
        @?= ["000", "001", "011", "010", "110", "111", "101", "100"]
  ]

problem50Tests :: [TestTree]
problem50Tests =
  [ testCase "Huffmann encodes a list of (char, frequency)" $
      P.huffman [('a', 45), ('b', 13), ('c', 12), ('d', 16), ('e', 9), ('f', 5)]
        @?= [('a', "0"), ('b', "101"), ('c', "100"), ('d', "111"), ('e', "1101"), ('f', "1100")]
  ]
