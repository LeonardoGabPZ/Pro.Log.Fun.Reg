-- Construccion de la funcion que aplica a todos los elementos
aplicaFuncionParaTodaLaLista :: (a -> b) -> [a] -> [b]
aplicaFuncionParaTodaLaLista funcion lista = map funcion lista

-- funcion para elevar un numero al cuadrado
square :: Num a => a -> a
square n = n * n

main :: IO ()
main = do
    -- mostra el resultado de aplicar la funcion a toda la lista: 
    putStrLn "funcion square aplicada a la lista [3, 4, 9, 8]:"
    print $ aplicaFuncionParaTodaLaLista square [3, 4, 9, 8]


