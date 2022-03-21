module P_01_28_Lists where

import Types (Grouped, NestedList) -- Grouped is needed for problem 07, NestedList for problem 11

-- problem 01: Find the last element of a list.
myLast :: [a] -> a
myLast = error "SolutionNotImplemented"

-- problem 02: Find the last but one element of a list.
myButLast :: [a] -> a
myButLast = error "SolutionNotImplemented"

-- problem 03: Find the K'th element of a list. The first element in the list is number 1.
elementAt :: [a] -> Int -> a
elementAt = error "SolutionNotImplemented"

-- problem 04: Find the number of elements of a list.
myLength :: [a] -> Int
myLength = error "SolutionNotImplemented"

-- problem 05: Reverse a list.
reverse :: [a] -> [a]
reverse = error "SolutionNotImplemented"

-- problem 06: Find out whether a list is a palindrome.
isPalindrome :: [a] -> Bool
isPalindrome = error "SolutionNotImplemented"

-- problem 07: Flatten a nested list structure. Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).
-- you have to use the NestedList datatype
flatten :: NestedList a -> [a]
flatten = error "SolutionNotImplemented"

-- problem 08: Eliminate consecutive duplicates of list elements. If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.
compress :: [a] -> [a]
compress = error "SolutionNotImplemented"

-- problem 09: Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.
pack :: [a] -> [[a]]
pack = error "SolutionNotImplemented"

-- problem 10: Run-length encoding of a list. Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.
encode :: [a] -> [(Int, a)]
encode = error "SolutionNotImplemented"

-- problem 11: Modified run-length encoding. Modify the result of problem 10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.
-- you have to use the Grouped datatype
encodeModified :: [a] -> [Grouped a]
encodeModified = error "SolutionNotImplemented"

-- problem 12: Decode a run-length encoded list. Given a run-length code list generated as specified in problem 11. Construct its uncompressed version.
-- you have to use the Grouped datatype
decodeModified :: [Grouped a] -> [a]
decodeModified = error "SolutionNotImplemented"

-- problem 13: Run-length encoding of a list (direct solution). Implement the so-called run-length encoding data compression method directly. I.e. don't explicitly create the sublists containing the duplicates, as in problem 9, but only count them. As in problem P11, simplify the result list by replacing the singleton lists (1 X) by X.
-- you have to use the Grouped datatype
encodeDirect :: [a] -> [Grouped a]
encodeDirect = error "SolutionNotImplemented"

-- problem 14: Duplicate the elements of a list.
dupli :: [a] -> [a]
dupli = error "SolutionNotImplemented"

-- problem 15: Replicate the elements of a list a given number of times.
repli :: Int -> [a] -> [a]
repli = error "SolutionNotImplemented"

-- problem 16: Drop every N'th element from a list.
dropEvery :: Int -> [a] -> [a]
dropEvery = error "SolutionNotImplemented"

-- problem 17: Split a list into two parts; the length of the first part is given. Do not use any predefined predicates.
split :: Int -> [a] -> ([a], [a])
split = error "SolutionNotImplemented"

-- problem 18: Extract a slice from a list. Given two indices, i and k, the slice is the list containing the elements between the i'th and k'th element of the original list (both limits included). Start counting the elements with 1.
slice :: Int -> Int -> [a] -> [a]
slice = error "SolutionNotImplemented"

-- problem 19: Rotate a list N places to the left. Hint: Use the predefined functions length and (++).
rotate :: Int -> [a] -> [a]
rotate = error "SolutionNotImplemented"

-- problem 20: Remove the K'th element from a list.
removeAt :: Int -> [a] -> (a, [a])
removeAt = error "SolutionNotImplemented"

-- problem 21: Insert an element at a given position into a list.
insertAt :: Int -> a -> [a] -> [a]
insertAt = error "SolutionNotImplemented"

-- problem 22: Create a list containing all integers within a given range.
range :: Int -> Int -> [Int]
range = error "SolutionNotImplemented"

-- problem 23: Extract a given number of randomly selected elements from a list.
randomSelect :: Int -> [a] -> [a]
randomSelect = error "SolutionNotImplemented"

-- problem 24: Lotto: Draw N different random numbers from the set 1..M.
diffSelect :: Int -> Int -> [Int]
diffSelect = error "SolutionNotImplemented"

-- problem 25: Generate a random permutation of the elements of a list.
randomPermutation :: [a] -> [a]
randomPermutation = error "SolutionNotImplemented"

-- problem 26: Generate the combinations of K distinct objects chosen from the N elements of a list
combinations :: Int -> [a] -> [[a]]
combinations = error "SolutionNotImplemented"

-- problem 27: Group the elements of a set into disjoint subsets. a) In how many ways can a group of 9 people work in 3 disjoint subgroups of 2, 3 and 4 persons? Write a function that generates all the possibilities and returns them in a list.
group3 :: [a] -> [([a], [a], [a])]
group3 = error "SolutionNotImplemented"

-- problem 27: Group the elements of a set into disjoint subsets. b) Generalize the above predicate in a way that we can specify a list of group sizes and the predicate will return a list of groups. Note that we do not want permutations of the group members; i.e. ((ALDO BEAT) ...) is the same solution as ((BEAT ALDO) ...). However, we make a difference between ((ALDO BEAT) (CARLA DAVID) ...) and ((CARLA DAVID) (ALDO BEAT) ...).
groupSizes :: [Int] -> [a] -> [[[a]]]
groupSizes = error "SolutionNotImplemented"

-- problem 28a: Sorting a list of lists according to length of sublists. a) We suppose that a list contains elements that are lists themselves. The objective is to sort the elements of this list according to their length. E.g. short lists first, longer lists later, or vice versa.
lsort :: [[a]] -> [[a]]
lsort = error "SolutionNotImplemented"

-- problem 28b: Sorting a list of lists according to length of sublists. b) Again, we suppose that a list contains elements that are lists themselves. But this time the objective is to sort the elements of this list according to their length frequency; i.e., in the default, where sorting is done ascendingly, lists with rare lengths are placed first, others with a more frequent length come later.
lfsort :: [[a]] -> [[a]]
lfsort = error "SolutionNotImplemented"
