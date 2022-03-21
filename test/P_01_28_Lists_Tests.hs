{-# LANGUAGE TypeApplications #-}

module P_01_28_Lists_Tests (listsTests) where

import qualified Problems as P
import Test.Tasty
import Test.Tasty.ExpectedFailure (expectFail)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck
import TestUtils
import Types

listsTests :: TestTree
listsTests =
  handleUnimplemented $
    testGroup
      "Lists"
      [ testGroup "Problem 01" problem01Tests,
        testGroup "Problem 02" problem02Tests,
        testGroup "Problem 03" problem03Tests,
        testGroup "Problem 04" problem04Tests,
        testGroup "Problem 05" problem05Tests,
        testGroup "Problem 06" problem06Tests,
        testGroup "Problem 07" problem07Tests,
        testGroup "Problem 08" problem08Tests,
        testGroup "Problem 09" problem09Tests,
        testGroup "Problem 10" problem10Tests,
        testGroup "Problem 11" problem11Tests,
        testGroup "Problem 12" problem12Tests,
        testGroup "Problem 13" problem13Tests,
        testGroup "Problem 14" problem14Tests,
        testGroup "Problem 15" problem15Tests,
        testGroup "Problem 16" problem16Tests,
        testGroup "Problem 17" problem17Tests,
        testGroup "Problem 18" problem18Tests,
        testGroup "Problem 19" problem19Tests,
        testGroup "Problem 20" problem20Tests,
        testGroup "Problem 21" problem21Tests,
        testGroup "Problem 22" problem22Tests,
        testGroup "Problem 23" problem23Tests,
        testGroup "Problem 24" problem24Tests,
        testGroup "Problem 25" problem25Tests,
        testGroup "Problem 26" problem26Tests,
        testGroup "Problem 27a" problem27aTests,
        testGroup "Problem 27b" problem27bTests,
        testGroup "Problem 28a" problem28aTests,
        testGroup "Problem 28b" problem28bTests
      ]

problem01Tests :: [TestTree]
problem01Tests =
  [ testProperty "Finds the last element of a list of numbers" $ prop_findsLast @Int,
    testProperty "Finds the last element of a list of chars" $ prop_findsLast @Char,
    expectFail . testCase "Throws error when the list is empty" $ P.myLast []
  ]
  where
    prop_findsLast :: Eq a => a -> [a] -> Bool
    prop_findsLast x list = P.myLast (list ++ [x]) == x

problem02Tests :: [TestTree]
problem02Tests =
  [ testCase "Finds the last but one element of a list of numbers" $
      P.myButLast [1, 2, 3, 4]
        @?= 3,
    testCase "Finds the last but one element of a list of chars" $
      P.myButLast ['a' .. 'z']
        @?= 'y'
  ]

problem03Tests :: [TestTree]
problem03Tests =
  [ testCase "Finds the 2nd element of a list of numbers" $
      P.elementAt [1, 2, 3] 2
        @?= 2,
    testCase "Finds the 5th element of a string" $
      P.elementAt "haskell" 5
        @?= 'e'
  ]

problem04Tests :: [TestTree]
problem04Tests =
  [ testCase "Finds the number of elements of a list" $
      P.myLength [123, 456, 789]
        @?= 3,
    testCase "Finds the number of characters of a string" $
      P.myLength "Hello, world!"
        @?= 13
  ]

problem05Tests :: [TestTree]
problem05Tests =
  [ testCase "Reverses a list of numbers" $
      P.reverse [1, 2, 3, 4]
        @?= [4, 3, 2, 1],
    testCase "Reverses a string" $
      P.reverse "A man, a plan, a canal, panama!"
        @?= "!amanap ,lanac a ,nalp a ,nam A"
  ]

problem06Tests :: [TestTree]
problem06Tests =
  [ testCase "Checks that a list fails" $
      P.isPalindrome [1, 2, 3]
        @?= False,
    testCase "Checks that a string succeeds" $
      P.isPalindrome "madamimadam"
        @?= True,
    testCase "Checks that a list succeeds" $
      P.isPalindrome [1, 2, 4, 8, 16, 8, 4, 2, 1]
        @?= True
  ]

problem07Tests :: [TestTree]
problem07Tests =
  [ testCase "Flattens a list singleton" $
      P.flatten (Elem 5)
        @?= [5],
    testCase "Flattens a nested list" $
      P.flatten
        (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])
        @?= [1, 2, 3, 4, 5],
    testCase "Flattens an empty list" $
      P.flatten (List [])
        @?= ([] :: [Int]) -- type annotation because ghc complains
  ]

problem08Tests :: [TestTree]
problem08Tests =
  [ testCase "Eliminates consecutive duplicates in a string" $
      P.compress "aaaabccaadeeee"
        @?= "abcade"
  ]

problem09Tests :: [TestTree]
problem09Tests =
  [ testCase "Packs consecutive chars into strings" $
      P.pack
        ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
        @?= ["aaaa", "b", "cc", "aa", "d", "eeee"]
  ]

problem10Tests :: [TestTree]
problem10Tests =
  [ testCase "Compresses a string into run-length encoding" $
      P.encode "aaaabccaadeeee"
        @?= [(4, 'a'), (1, 'b'), (2, 'c'), (2, 'a'), (1, 'd'), (4, 'e')]
  ]

problem11Tests :: [TestTree]
problem11Tests =
  [ testCase "Compresses a string into run-length encoding, singletons aside" $
      P.encodeModified "aaaabccaadeeee"
        @?= [ Multiple 4 'a',
              Single 'b',
              Multiple 2 'c',
              Multiple 2 'a',
              Single 'd',
              Multiple 4 'e'
            ]
  ]

problem12Tests :: [TestTree]
problem12Tests =
  [ testCase "Decodes a run-length encoded list, with singletons" $
      P.decodeModified
        [ Multiple 4 'a',
          Single 'b',
          Multiple 2 'c',
          Multiple 2 'a',
          Single 'd',
          Multiple 4 'e'
        ]
        @?= "aaaabccaadeeee"
  ]

--   context "When chaining encoding and decoding"
--     $ prop "Is equivalent to identity"
--     $ \x -> P.decodeModified . P.encodeModified $ x == x

problem13Tests :: [TestTree]
problem13Tests =
  [ testCase "Implements direct run-length encoding without creating sublists" $
      P.encodeDirect "aaaabccaadeeee"
        @?= [ Multiple 4 'a',
              Single 'b',
              Multiple 2 'c',
              Multiple 2 'a',
              Single 'd',
              Multiple 4 'e'
            ]
  ]

--   context "When chaining direct encoding and decoding"
--     $ prop "Is equivalent to identity"
--     $ \x -> P.decodeModified . P.encodeDirect $ x == x

problem14Tests :: [TestTree]
problem14Tests =
  [ testCase "Duplicates the elements of a list of numbers" $
      P.dupli [1, 2, 3]
        @?= [1, 1, 2, 2, 3, 3]
  ]

problem15Tests :: [TestTree]
problem15Tests =
  [ testCase "Replicates the elements of a string 3 times" $
      P.repli 3 "abc"
        @?= "aaabbbccc"
  ]

problem16Tests :: [TestTree]
problem16Tests =
  [ testCase "Drops every 3rd element from a string" $
      P.dropEvery 3 "abcdefghik"
        @?= "abdeghk"
  ]

problem17Tests :: [TestTree]
problem17Tests =
  [ testCase "Splits a list into two parts" $
      P.split 3 "abcdefghik"
        @?= ("abc", "defghik")
  ]

problem18Tests :: [TestTree]
problem18Tests =
  [ testCase "Extracts a slice from a list" $
      P.slice 3 7 ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k']
        @?= "cdefg"
  ]

problem19Tests :: [TestTree]
problem19Tests =
  [ testCase "Rotates a list 3 places to the left" $
      P.rotate 3 ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
        @?= "defghabc",
    testCase "Rotates a list -2 places to the left" $
      P.rotate (-2) ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
        @?= "ghabcdef"
  ]

problem20Tests :: [TestTree]
problem20Tests =
  [ testCase "Removes the 2nd element from a string" $
      P.removeAt 2 "abcd"
        @?= ('b', "acd")
  ]

problem21Tests :: [TestTree]
problem21Tests =
  [ testCase "DESCRIBE ME" $
      P.insertAt 2 'X' "abcd"
        @?= "aXbcd"
  ]

problem22Tests :: [TestTree]
problem22Tests =
  [ testCase "DESCRIBE ME" $
      P.range 4 9
        @?= [4, 5, 6, 7, 8, 9]
  ]

problem23Tests :: [TestTree]
problem23Tests =
  [testCase "TODO" $ P.randomSelect `seq` error "TestNotImplemented"]

--   describe "problem23_randomSelect" $ do
--     prop "Extracts N elements" $ \n xs -> length (P.randomSelect xs n) == n
--     prop "Extracts elements from the given list"
--       $ \n xs -> all (`elem` xs) (P.randomSelect xs n)

problem24Tests :: [TestTree]
problem24Tests =
  [testCase "TODO" $ P.diffSelect `seq` error "TestNotImplemented"]

--   describe "problem24_diffSelect" $ do
--     prop "Draws N different numbers"
--       $ \n m -> length (nub (P.diffSelect n m)) == n
--     prop "Draws numbers from the {1..M} set"
--       $ \n m -> all (\x -> x >= 1 && x <= m) (P.diffSelect n m)

problem25Tests :: [TestTree]
problem25Tests =
  [testCase "TODO" $ P.randomPermutation `seq` error "TestNotImplemented"]

--   describe "problem25_randomPermutation" $ do
--     context "When randomly permutating a string" $ do
--       prop "Uses only elements from the string"
--         $ \s -> all (`elem` s) (P.randomPermutation s)
--       prop "Uses all elements from the string"
--         $ \s -> length (P.randomPermutation s) == length s

problem26Tests :: [TestTree]
problem26Tests =
  [ testCase "Produces the right initial elements of N choose K" $
      take 3 (P.combinations 3 "abcdef")
        @?= ["abc", "abd", "abe"]
  ]

problem27aTests :: [TestTree]
problem27aTests =
  [ testCase "Produces the right first disjoint subset" $
      head
        ( P.group3
            [ "aldo",
              "beat",
              "carla",
              "david",
              "evi",
              "flip",
              "gary",
              "hugo",
              "ida"
            ]
        )
        @?= ( ["aldo", "beat"],
              ["carla", "david", "evi"],
              ["flip", "gary", "hugo", "ida"]
            ),
    testCase "Finds the correct number of disjoint subsets" $
      (length :: [a] -> Int) -- type annotation because GHC complains
        ( P.group3
            [ "aldo",
              "beat",
              "carla",
              "david",
              "evi",
              "flip",
              "gary",
              "hugo",
              "ida"
            ]
        )
        @?= 1260
  ]

problem27bTests :: [TestTree]
problem27bTests =
  [ testCase "Produces the right first disjoint subset [2,2,5]" $
      head
        ( P.groupSizes
            [2, 2, 5]
            [ "aldo",
              "beat",
              "carla",
              "david",
              "evi",
              "flip",
              "gary",
              "hugo",
              "ida"
            ]
        )
        @?= [ ["aldo", "beat"],
              ["carla", "david"],
              ["evi", "flip", "gary", "hugo", "ida"]
            ],
    testCase "Find the correct number of disjoint subsets [2,2,5]" $
      (length :: [a] -> Int) -- type annotation because GHC complains
        ( P.groupSizes
            [2, 2, 5]
            [ "aldo",
              "beat",
              "carla",
              "david",
              "evi",
              "flip",
              "gary",
              "hugo",
              "ida"
            ]
        )
        @?= 756
  ]

problem28aTests :: [TestTree]
problem28aTests =
  [ testCase "Sorts a list based on length" $
      P.lsort ["abc", "de", "fgh", "de", "ijkl", "mn", "o"]
        @?= ["o", "de", "de", "mn", "abc", "fgh", "ijkl"]
  ]

problem28bTests :: [TestTree]
problem28bTests =
  [ testCase "Sorts a list based on length frequency" $
      P.lfsort ["abc", "de", "fgh", "de", "ijkl", "mn", "o"]
        @?= ["ijkl", "o", "abc", "fgh", "de", "de", "mn"]
  ]
