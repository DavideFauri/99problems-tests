{- ORMOLU_DISABLE -}
import qualified Problems as P

import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.SmallCheck

import P_01_28_Lists_Tests (listsTests)
import P_31_41_Arithmetics_Tests (arithmeticsTests)
import P_46_50_Logic_Tests (logicTests)
import P_54_73_Trees_Tests (treesTests)
import P_80_89_Graphs_Tests (graphsTests)
import P_90_99_Misc_Tests (miscTests)

{- ORMOLU_ENABLE -}

main :: IO ()
main = defaultMain $ testGroup "99 Haskell Problems" tests

tests :: [TestTree]
tests =
  [ -- testGroup "Lists" listsTests,
    -- testGroup "Arithmetics" arithmeticsTests,
    -- testGroup "Logic" logicTests,
    -- testGroup "Trees" treesTests,
    -- testGroup "Graphs" graphsTests,
    -- testGroup "Misc" miscTests,
    testGroup "Placeholder" dummyTests
  ]

dummyTests :: [TestTree]
dummyTests =
  [ testProperty "Property tests are working!" prop_dummy, -- smallcheck test
    testCase "Unit tests are working!" case_dummy -- unit test
  ]

prop_dummy :: Int -> Bool
prop_dummy = const True

case_dummy :: Assertion
case_dummy = P.placeholder @?= "placeholder"
