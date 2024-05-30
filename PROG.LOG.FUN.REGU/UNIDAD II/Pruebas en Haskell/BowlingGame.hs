module BowlingGame where

type Roll = Int
type Frame = [Roll]

score :: [Roll] -> Int
score rolls = score' rolls 0 1
  where
    score' :: [Roll] -> Int -> Int -> Int
    score' [] _ _ = 0
    score' _ 10 _ = 0
    score' (x:y:z:xs) frameIndex frame
      | x == 10 = 10 + y + z + score' (y:z:xs) (frameIndex + 1) (frame + 1)
      | x + y == 10 = 10 + z + score' (z:xs) (frameIndex + 2) (frame + 1)
      | otherwise = x + y + score' xs (frameIndex + 2) (frame + 1)
    score' (x:y:[]) _ _ = x + y
    score' _ _ _ = 0

import Test.HUnit

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
