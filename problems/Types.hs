module Types where

-- problem 7
data NestedList a = Elem a | List [NestedList a] deriving (Eq, Show)

-- problem 11
data Grouped a = Single a | Multiple Integer a deriving (Eq, Show)
