-- coded by devMariana
module Funciones where

-- SUMA DE ELEMENTOS PARES EN UNA LISTA
sumarLista :: [Int] -> Int
sumarLista = foldl (+) 0

-- FACTORIAL
factorial :: Int -> Int
factorial n = foldl (*) 1 [1 .. n]

-- NUMEROS PARES
numerosPares :: Int -> [Int]
numerosPares n = [2, 4 .. n * 2]

-- LONGITUD DE UNA CADENA
longitudCadena :: String -> Int
longitudCadena = length

-- REVERSO DE UNA LISTA
reversoLista :: [a] -> [a]
reversoLista = reverse

-- DUPLICAR ELEMENTOS
duplicarElementos :: [Int] -> [Int]
duplicarElementos = concatMap (\x -> [x, x])

-- duplicar elementos v2
duplicarElementosVDos :: [Int] -> [Int]
duplicarElementosVDos = map (* 2)

-- FILTRAR ELEMENTOS PARES
filtrarPares :: Int -> Int -> [Int]
filtrarPares min max = filter even [min .. max]

-- FIBONACCI
fibonacci :: Int -> Int
fibonacci n
  | n < 0 = error "Nro. negativo"
  | otherwise = seFibonacci n 0 1

seFibonacci :: Int -> Int -> Int -> Int
seFibonacci 0 a _ = a
seFibonacci n a b = seFibonacci (n - 1) b (a + b)

-- DIVISORES DE UN NUMERO
divisores :: Int -> [Int]
divisores n = [x | x <- [1 .. n], n `mod` x == 0]

-- Palindromo
esPalindromo :: String -> Bool
esPalindromo s = s == reverse s

--