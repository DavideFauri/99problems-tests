module Test where

import P_01_28_Lists_Tests (listsTests)
import P_31_41_Arithmetics_Tests (arithmeticsTests)
import P_46_50_Logic_Tests (logicTests)
import P_54_73_Trees_Tests (treesTests)
import P_80_89_Graphs_Tests (graphsTests)
import P_90_99_Misc_Tests (miscTests)
import Test.Tasty

main :: IO ()
main = defaultMain the99Tests

the99Tests :: TestTree
the99Tests =
  testGroup
    "99 Haskell Problems"
    [ listsTests,
      arithmeticsTests,
      logicTests,
      treesTests,
      graphsTests,
      miscTests
    ]
