module P_54_73_Trees_Tests (treesTests) where

import qualified Problems as P
import Test.Tasty
import Test.Tasty.HUnit
import TestUtils (dummyTests)

-- import Test.Tasty.QuickCheck

treesTests :: TestTree
treesTests =
  testGroup
    "Trees"
    [ dummyTests
    ]
