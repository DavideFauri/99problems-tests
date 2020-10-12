module P_90_99_Misc_Tests (miscTests) where

import qualified Problems as P
import Test.Tasty
import Test.Tasty.HUnit
import TestUtils (dummyTests)

-- import Test.Tasty.QuickCheck

miscTests :: TestTree
miscTests =
  testGroup
    "Misc"
    [ dummyTests
    ]
