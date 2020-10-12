module P_80_89_Graphs_Tests (graphsTests) where

import qualified Problems as P
import Test.Tasty
import Test.Tasty.HUnit
import TestUtils (dummyTests)

-- import Test.Tasty.QuickCheck

graphsTests :: TestTree
graphsTests =
  testGroup
    "Graphs"
    [ dummyTests
    ]
