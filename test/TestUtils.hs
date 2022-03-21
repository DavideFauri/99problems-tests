{-# LANGUAGE RecordWildCards #-}

module TestUtils (dummyTests, softFailIfNotImplemented, acceptTestsNotImplemented) where

import Data.List (isPrefixOf)
import Problems as P (placeholder)
import Test.Tasty
import Test.Tasty.ExpectedFailure (expectFailBecause, wrapTest)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck (testProperty)
import Test.Tasty.Runners

--------------------------------------

-- HANDLING UNIMPLEMENTED FUNCTIONS
-- TODO: HANDLING TIMEOUTS (?)

softFailIfNotImplemented :: TestTree -> TestTree
softFailIfNotImplemented = wrapTest (fmap changeResult)
  where
    changeResult r@Result {..}
      | "Exception: NotImplemented" `isPrefixOf` resultDescription =
        r {resultDescription = "Solution not implemented yet"}
      | otherwise = r

-- HANDLING UNIMPLEMENTED TESTS
acceptTestsNotImplemented :: TestTree -> TestTree
acceptTestsNotImplemented = expectFailBecause "test not implemented" . softFailIfNotImplemented

--------------------------------------

-- TESTING THE TEST INFRASTRUCTURE

dummyTests :: TestTree
dummyTests =
  softFailIfNotImplemented $
    testGroup
      "Placeholder Tests"
      [ testProperty "Property tests are working" (dummyProp :: Int -> Bool), -- example Quickcheck property test
        testCase "Unit tests are working" dummyCase, -- example unit test
        testCase "Can import problem solutions" dummyImport, -- verify that can import solutions from Problems module
        testCase "Undefined functions are regarded as failures" dummyFuncTest, -- handling the tricky case of an undefined function
        acceptTestsNotImplemented $ testCase "This test should fail, but that's OK" dummyFunc
        -- testCase "This test should be hidden" dummyFail --TODO using tasty-fail-fast to only prompt one error at a time
      ]

dummyProp :: a -> Bool
dummyProp = const True

dummyCase :: Assertion
dummyCase = assertBool "" True

dummyImport :: Assertion
dummyImport = P.placeholder @?= "placeholder"

dummyFunc :: a
dummyFunc = error "NotImplemented"

dummyFuncTest :: Assertion
dummyFuncTest = dummyFunc @?= True

dummyFail :: Assertion
dummyFail = assertFailure ""
