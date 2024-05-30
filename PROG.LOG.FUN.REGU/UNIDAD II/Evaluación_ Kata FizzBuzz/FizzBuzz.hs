module Main where

import Data.Char (toLower)
import Text.Read (readMaybe)
import Test.HUnit
import Numeric (showIntAtBase)
import Data.List (inits, tails)

-- Función principal FizzBuzz
fizzBuzz :: Int -> String
fizzBuzz n
    | isPrime n = "FizzBuzz!"
    | otherwise = numberToWords n

-- Verifica si un número es primo
isPrime :: Int -> Bool
isPrime 1 = False
isPrime n = not (any (\x -> n `mod` x == 0) [2..(floor . sqrt . fromIntegral) n])

-- Convertir un número a palabras en español
numberToWords :: Int -> String
numberToWords n
    | n == 0    = "cero"
    | n < 0     = "menos " ++ convert (-n)
    | otherwise = convert n
  where
    units = ["", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve"]
    teens = ["diez", "once", "doce", "trece", "catorce", "quince", "dieciséis", "diecisiete", "dieciocho", "diecinueve"]
    tens = ["", "", "veinte", "treinta", "cuarenta", "cincuenta", "sesenta", "setenta", "ochenta", "noventa"]
    hundreds = ["", "ciento", "doscientos", "trescientos", "cuatrocientos", "quinientos", "seiscientos", "setecientos", "ochocientos", "novecientos"]
    thousands n
        | n < 1000 = convert n
        | otherwise = let (t, r) = n `divMod` 1000
                      in if t == 1 then "mil " ++ convert r else convert t ++ " mil " ++ if r /= 0 then convert r else ""

    convert n
        | n < 10    = units !! n
        | n < 20    = teens !! (n - 10)
        | n < 100   = let (t, u) = n `divMod` 10
                      in tens !! t ++ if u /= 0 then " y " ++ units !! u else ""
        | n < 1000  = let (h, r) = n `divMod` 100
                      in hundreds !! h ++ if r /= 0 then " " ++ convert r else if n == 100 then "cien" else ""
        | n < 1000000 = thousands n
        | otherwise = "número fuera de rango"

-- Función principal para leer un número y procesarlo
main :: IO ()
main = do
    putStrLn "Introduce un número entre 0 y 1000000: "
    input <- getLine
    case readMaybe input :: Maybe Int of
        Just n  -> if n >= 0 && n <= 1000000
                   then putStrLn $ fizzBuzz n
                   else putStrLn "Por favor, introduce un número entre 0 y 1000000."
        Nothing -> putStrLn "Entrada no válida. Por favor, introduce un número entero."
