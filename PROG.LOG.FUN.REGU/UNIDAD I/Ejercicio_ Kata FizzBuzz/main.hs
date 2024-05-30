module Main where

import Data.List (intercalate)

-- Función principal
fizzBuzz :: Int -> String
fizzBuzz n
    | n `mod` 15 == 0 = "FizzBuzz!"
    | n `mod` 5  == 0 = "Fizz!"
    | n `mod` 3  == 0 = "Buzz!"
    | otherwise       = numberToWords n

-- Convertir un número a palabras en inglés
numberToWords :: Int -> String
numberToWords n
    | n == 0    = "Zero"
    | n < 0     = "Negative " ++ convert (-n)
    | otherwise = convert n
  where
    units = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"]
    teens = ["Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    convert n
        | n < 10    = units !! n
        | n < 20    = teens !! (n - 10)
        | n < 100   = let (t, u) = n `divMod` 10
                      in tens !! t ++ if u /= 0 then " " ++ units !! u else ""
        | n == 100  = "One Hundred"
        | otherwise = "Number out of range"

-- Función principal para probar los valores
main :: IO ()
main = do
    mapM_ (putStrLn . fizzBuzz) [0..100]
