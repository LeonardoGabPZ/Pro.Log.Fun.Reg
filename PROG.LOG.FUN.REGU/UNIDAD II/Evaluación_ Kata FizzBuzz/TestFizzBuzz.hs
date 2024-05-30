module TestFizzBuzz where

import Test.HUnit
import Main (fizzBuzz, isPrime, numberToWords)

-- Pruebas de la función fizzBuzz
testFizzBuzz :: Test
testFizzBuzz = TestList [
    "Prueba 1" ~: fizzBuzz 1 ~?= "uno",
    "Prueba 2" ~: fizzBuzz 2 ~?= "FizzBuzz!",
    "Prueba 178" ~: fizzBuzz 178 ~?= "ciento setenta y ocho",
    "Prueba 1000000" ~: fizzBuzz 1000000 ~?= "número fuera de rango"
    ]

-- Pruebas de la función isPrime
testIsPrime :: Test
testIsPrime = TestList [
    "Prueba 2" ~: isPrime 2 ~?= True,
    "Prueba 3" ~: isPrime 3 ~?= True,
    "Prueba 4" ~: isPrime 4 ~?= False,
    "Prueba 13" ~: isPrime 13 ~?= True
    ]

-- Pruebas de la función numberToWords
testNumberToWords :: Test
testNumberToWords = TestList [
    "Prueba 0" ~: numberToWords 0 ~?= "cero",
    "Prueba 15" ~: numberToWords 15 ~?= "quince",
    "Prueba 21" ~: numberToWords 21 ~?= "veintiuno",
    "Prueba 100" ~: numberToWords 100 ~?= "cien",
    "Prueba 999" ~: numberToWords 999 ~?= "novecientos noventa y nueve"
    ]

main :: IO Counts
main = do
    runTestTT testFizzBuzz
    runTestTT testIsPrime
    runTestTT testNumberToWords
