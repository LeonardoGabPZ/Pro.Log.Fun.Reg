module FizzBuzz where

fizzBuzz :: Int -> [String]
fizzBuzz n = [if | i `mod` 3 == 0 && i `mod` 5 == 0 -> "FizzBuzz"
                 | i `mod` 3 == 0 -> "Fizz"
                 | i `mod` 5 == 0 -> "Buzz"
                 | otherwise -> show i | i <- [1..n]]

import Test.HUnit

testFizzBuzz :: Test
testFizzBuzz = TestCase $ assertEqual "FizzBuzz test" expectedOutput (fizzBuzz 20)
  where
    expectedOutput = ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz","16","17","Fizz","19","Buzz"]

tests :: Test
tests = TestList [testFizzBuzz]

main :: IO ()
main = runTestTT tests
