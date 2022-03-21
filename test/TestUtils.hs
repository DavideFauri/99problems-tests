{-# LANGUAGE RecordWildCards #-}

module TestUtils (dummyTests, handleUnimplemented) where

import Data.List (isInfixOf)
import Problems as P (placeholder)
import Test.Tasty
import Test.Tasty.ExpectedFailure (expectFail, wrapTest)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck (testProperty)
import Test.Tasty.Runners

--------------------------------------

-- TODO: HANDLING TIMEOUTS (?)

-- HANDLING UNIMPLEMENTED FUNCTIONS

unimplementedFunctionIsFail :: Result -> Result
unimplementedFunctionIsFail r@Result {..}
  | "SolutionNotImplemented" `isInfixOf` resultDescription =
    r
      { resultOutcome = Failure TestFailed,
        resultDescription = "",
        resultShortDescription = "FAIL (solution not implemented)"
      }
  | otherwise = r

-- HANDLING UNIMPLEMENTED TESTS

unimplementedTestIsOk :: Result -> Result
unimplementedTestIsOk r@Result {..}
  | "TestNotImplemented" `isInfixOf` resultDescription =
    r
      { resultOutcome = Success,
        resultDescription = "",
        resultShortDescription = "SKIP (test not implemented)"
      }
  | otherwise = r

-- failing on unimplemented solutions should prevail over not failing on unimplemented tests
handleUnimplemented :: TestTree -> TestTree
handleUnimplemented = wrapTest (fmap $ unimplementedFunctionIsFail . unimplementedTestIsOk)

--------------------------------------

-- TESTING THE TEST INFRASTRUCTURE

dummyTests :: TestTree
dummyTests =
  handleUnimplemented $
    testGroup
      "Placeholder Tests"
      [ testProperty "Property tests are working" (dummyProp :: Int -> Bool), -- example Quickcheck property test
        testCase "Unit tests are working" dummyCase, -- example unit test
        testCase "Can import problem solutions" dummyImport, -- verify that can import solutions from Problems module
        testCase "Undefined functions are regarded as failures" dummyFuncTest, -- handling the tricky case of an undefined function
        expectFail $ testCase "This test should fail, but that's OK" dummyFunc
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
