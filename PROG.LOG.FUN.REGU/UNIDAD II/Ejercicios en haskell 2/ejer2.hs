-- función que filtra los elementos de 
-- una lista que devuelven true al aplicarle una función booleana
filtraLista :: (a -> Bool) -> [a] -> [a]
filtraLista funcion lista = [i | i <- lista, funcion i]

--  función booleana para comprobar si un número es par
esPar :: Integral a => a -> Bool
esPar n = n `mod` 2 == 0

main :: IO ()
main = do
    putStrLn "Lista filtrada con numeros pares:"
    -- Imprimir el resultado de función
    -- filtraLista para la función booleana 'esPar' y la lista dada
    print $ filtraLista esPar [1, 2, 3, 4, 5, 6]
