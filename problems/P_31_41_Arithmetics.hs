{-# OPTIONS_GHC -Wno-missing-signatures #-}

module P_31_41_Arithmetics where

-- problem 31: Determine whether a given integer number is prime.
isPrime = undefined

-- problem 32: Determine the greatest common divisor of two integer numbers. Use Euclid's algorithm.
myGCD = undefined

-- problem 33: Determine whether two positive integer numbers are coprime. Two numbers are coprime if their greatest common divisor equals 1.
coprime = undefined

-- problem 34: Calculate Euler's totient function phi(m). Euler's so-called totient function phi(m) is defined as the number of positive integers r (1 <= r < m) that are coprime to m. Example: m = 10: r = 1,3,7,9; thus phi(m) = 4. Note the special case: phi(1) = 1.
totient = undefined

-- problem 35: Determine the prime factors of a given positive integer. Construct a flat list containing the prime factors in ascending order.
primeFactors = undefined

-- problem 36: Determine the prime factors of a given positive integer. Construct a list containing the prime factors and their multiplicity.
prime_factors_mult = undefined

-- problem 37: Calculate Euler's totient function phi(m) (improved). See problem 34 for the definition of Euler's totient function. If the list of the prime factors of a number m is known in the form of problem 36 then the function phi(m) can be efficiently calculated as follows: Let ((p1 m1) (p2 m2) (p3 m3) ...) be the list of prime factors (and their multiplicities) of a given number m. Then phi(m) can be calculated with the following formula:
-- phi(m) = (p1 - 1) * p1 ^ (m1 - 1) *
--          (p2 - 1) * p2 ^ (m2 - 1) *
--          (p3 - 1) * p3 ^ (m3 - 1) * ...
totient' = undefined

-- problem 38: Compare the two methods of calculating Euler's totient function. Use the solutions of problems 34 and 37 to compare the algorithms. Take the number of reductions as a measure for efficiency. Try to calculate phi(10090) as an example.
-- NO SOLUTION REQUIRED

-- problem 39: A list of prime numbers. Given a range of integers by its lower and upper limit, construct a list of all prime numbers in that range.
primesR = undefined

-- problem 40: Goldbach's conjecture. Goldbach's conjecture says that every positive even number greater than 2 is the sum of two prime numbers. Example: 28 = 5 + 23. It is one of the most famous facts in number theory that has not been proved to be correct in the general case. It has been numerically confirmed up to very large numbers. Write a predicate to find the two prime numbers that sum up to a given even integer.
goldbach = undefined

-- problem 41: Given a range of integers by its lower and upper limit, print a list of all even numbers and their Goldbach composition. In most cases, if an even number is written as the sum of two prime numbers, one of them is very small. Very rarely, the primes are both bigger than say 50. Try to find out how many such cases there are in the range 2..3000.
goldbachList = undefined
