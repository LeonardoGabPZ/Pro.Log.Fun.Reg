import Data.List (foldl')

-- función que recibe dos valores y calcula
-- la suma del primero más el cuadrado del segundo
sumaCuadrado :: Float -> Float -> Float
sumaCuadrado x y = x + y ^ 2

-- Definir la función que calcula el módulo de un vector
modulo :: [Float] -> Float
modulo v = sqrt $ foldl' sumaCuadrado 0 v

main :: IO ()
main = do
    putStrLn "Modulo del vector (3, 4):"
    -- Imprimir resultado de la norma para el vector (3, 4)
    print $ modulo [3, 4]

    putStrLn "Modulo del vector (1, 2, 3):"
    --  -- Imprimir resultado de la norma para el vector (1, 2, 3)
    print $ modulo [1, 2, 3]
