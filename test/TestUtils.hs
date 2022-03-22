{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE TypeApplications #-}

module TestUtils (dummyTests, handleUnimplemented) where

import Data.List (isInfixOf)
import Problems as P (placeholder)
import Test.Tasty
import Test.Tasty.ExpectedFailure (expectFail, wrapTest)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck (testProperty)
import Test.Tasty.Runners

-- import Text.Regex

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

dropRerunSuggestions :: TestTree -> TestTree
dropRerunSuggestions = wrapTest (fmap replaceResultText)
  where
    replaceResultText :: Result -> Result
    replaceResultText r@Result {..} =
      r --{resultDescription = subRegex (mkRegex "\nUse -p '.+' to rerun this test only.") resultDescription ""}

--------------------------------------

-- TESTING THE TEST INFRASTRUCTURE

dummyTests :: TestTree
dummyTests =
    testGroup
      "Placeholder Tests"
    [ testGroup
        "Base functionality"
        [ testCase "Unit tests are working" dummyCase,
          testProperty "Property tests are working" (dummyProp @Int),
          expectFail $ testCase "Expected failures are working" dummyFail,
          testCase "Can import problem solutions" dummyImport,
          handleUnimplemented $ testCase "Unimplemented tests are skipped" dummyTest
        ],
      expectFail . handleUnimplemented $
        testGroup
          "Handling unimplemented solutions"
          [ testCase "Missing implementations are regarded as failures" dummyFuncTest,
            expectFail $ testCase "Missing implementations are failures even if the test is expected to fail" dummyFuncTest
          ]
      ]

dummyProp :: a -> Bool
dummyProp = const True

dummyCase :: Assertion
dummyCase = assertBool "" True

dummyImport :: Assertion
dummyImport = P.placeholder @?= "placeholder"

dummyFunc :: a
dummyFunc = error "SolutionNotImplemented"

dummyFuncTest :: Assertion
dummyFuncTest = dummyFunc @?= True

dummyTest :: Assertion
dummyTest = error "TestNotImplemented"

dummyFail :: Assertion
dummyFail = assertFailure ""
