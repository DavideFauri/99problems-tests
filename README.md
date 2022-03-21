# 99ProblemTests

> A test suite for the famous [99 Haskell Problems](https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems)

[![Build Status][travis-image]][travis-url]

## Quick Start

0. Install [Stack](https://www.haskellstack.org/)

1. Fork this repository

2. Check that placeholder tests are working by running `stack build; stack exec 99ProblemTests`

3. Enable the first batch of tests in `test/Main.hs`

4. Edit the exercises in `problems/` until all tests pass

5. Repeat steps 3-4 until you've solved everything!

## Introduction

This repository contains tests for the 99 Haskell Problems.
They have been grouped by topic, as they appear on the [problems webpage](http://https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems).

The master branch contains only the tests; the solutions are on a separate branch.

<!-- ========== -->

<!-- Links and other stuff -->
[travis-image]: https://api.travis-ci.org/DavideFauri/99problems-tests.svg?branch=master
[travis-url]: https://travis-ci.org/DavideFauri/99problems-tests
