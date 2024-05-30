module BowlingGameTest where

import Test.HUnit
import BowlingGame

testAllZeros :: Test
testAllZeros = TestCase $ assertEqual "All zeros" 0 (score $ replicate 20 0)

testAllOnes :: Test
testAllOnes = TestCase $ assertEqual "All ones" 20 (score $ replicate 20 1)

testOneSpare :: Test
testOneSpare = TestCase $ assertEqual "One spare" 16 (score $ [5,5,3] ++ replicate 17 0)

testOneStrike :: Test
testOneStrike = TestCase $ assertEqual "One strike" 24 (score $ 10:3:4:replicate 16 0)

tests :: Test
tests = TestList [testAllZeros, testAllOnes, testOneSpare, testOneStrike]

main :: IO ()
main = runTestTT tests
