module MetaTest where

import Test.Tasty
import TestUtils (dummyTests)

-- This module only checks the testing infrastructure

main :: IO ()
main = defaultMain dummyTests