module TestUtils (dummyTests, muteUndefined) where

import Control.Exception (SomeException, handleJust)
import Data.List (isPrefixOf)
import Problems as P (placeholder)

import Test.Tasty
import Test.Tasty.ExpectedFailure (wrapTest)
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck (testProperty)
import Test.Tasty.Runners

-- HANDLING UNIMPLEMENTED FUNCTIONS
-- TODO: HANDLING TIMEOUTS

muteUndefined :: TestTree -> TestTree
muteUndefined = wrapTest (handleJust selectUndefined handleUndefined)
  where
    selectUndefined :: SomeException -> Maybe ()
    selectUndefined e
      | "Prelude.undefined" `isPrefixOf` (show e) = Just ()
      | otherwise = Nothing
    handleUndefined () = pure Result {
                     resultOutcome = Failure TestFailed
                   , resultDescription = ""
                   , resultShortDescription = "FAIL (undefined)"
                   , resultTime = 0}



-- TESTING THE TEST INFRASTRUCTURE

dummyTests :: TestTree
dummyTests =
  muteUndefined $ testGroup
    "Placeholder Tests"
    [ testProperty "Property tests are working" (dummyProp :: Int -> Bool), -- example Quickcheck property test
      testCase "Unit tests are working" dummyCase, -- example unit test
      testCase "Can import problem solutions" dummyImport, -- verify that can import solutions from Problems module
      testCase "Undefined functions are regarded as failures" dummyFuncTest, -- handling the tricky case of an undefined function
      testCase "This test should fail" dummyFail
      -- testCase "This test should be hidden" dummyFail --TODO using tasty-fail-fast to only prompt one error at a time
    ]

dummyProp :: a -> Bool
dummyProp = const True

dummyCase :: Assertion
dummyCase = assertBool "" True

dummyImport :: Assertion
dummyImport = P.placeholder @?= "placeholder"

dummyFunc :: a
dummyFunc = undefined

dummyFuncTest :: Assertion
dummyFuncTest = dummyFunc @?= True

dummyFail :: Assertion
dummyFail = assertFailure ""
