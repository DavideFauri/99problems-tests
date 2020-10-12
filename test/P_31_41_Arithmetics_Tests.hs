module P_31_41_Arithmetics_Tests (arithmeticsTests) where

import qualified Problems as P
import Test.Tasty
import Test.Tasty.HUnit

-- import Test.Tasty
-- import Test.Tasty.HUnit

-- import Test.Tasty.QuickCheck

arithmeticsTests :: TestTree
arithmeticsTests =
  testGroup
    "Arithmetics"
    [ testGroup "Problem 31" problem31Tests,
      testGroup "Problem 32" problem32Tests,
      testGroup "Problem 33" problem33Tests,
      testGroup "Problem 34" problem34Tests,
      testGroup "Problem 35" problem35Tests,
      testGroup "Problem 36" problem36Tests,
      testGroup "Problem 37" problem37Tests,
      testGroup "Problem 38" problem38Tests,
      testGroup "Problem 39" problem39Tests,
      testGroup "Problem 40" problem40Tests,
      testGroup "Problem 41" problem41Tests
    ]

problem31Tests :: [TestTree]
problem31Tests =
  [ testCase "something" $
      P.isPrime 7
        @?= True
  ]

problem32Tests :: [TestTree]
problem32Tests =
  [ testCase "something" $
      [P.myGCD 36 63, P.myGCD (-3) (-6), P.myGCD (-3) 6]
        @?= [9, 3, 3]
  ]

problem33Tests :: [TestTree]
problem33Tests =
  [ testCase "something" $
      P.coprime 35 64
        @?= True
  ]

problem34Tests :: [TestTree]
problem34Tests =
  [ testCase "something" $
      P.totient 10
        @?= 4
  ]

problem35Tests :: [TestTree]
problem35Tests =
  [ testCase "something" $
      P.primeFactors 315
        @?= [3, 3, 5, 7]
  ]

problem36Tests :: [TestTree]
problem36Tests =
  [ testCase "something" $
      P.prime_factors_mult 315
        @?= [(3, 2), (5, 1), (7, 1)]
  ]

problem37Tests :: [TestTree]
problem37Tests =
  [ testCase "something" $
      P.totient' 10
        @?= 4
  ]

problem38Tests :: [TestTree]
problem38Tests =
  [ testCase "This one is free until I figure out how to profile functions! Enjoy!" $
      True
        @?= True
  ]

problem39Tests :: [TestTree]
problem39Tests =
  [ testCase "something" $
      P.primesR 10 20
        @?= [11, 13, 17, 19]
  ]

problem40Tests :: [TestTree]
problem40Tests =
  [ testCase "something" $
      P.goldbach 28
        @?= (5, 23)
  ]

problem41Tests :: [TestTree]
problem41Tests =
  [ testCase "something" $
      P.goldbachList 9 20
        @?= [(3, 7), (5, 7), (3, 11), (3, 13), (5, 13), (3, 17)],
    testCase "something" $
      filter (\(x, y) -> x > 50 && y > 50) (P.goldbachList 4 2000)
        @?= [(73, 919), (61, 1321), (67, 1789), (61, 1867)]
  ]
