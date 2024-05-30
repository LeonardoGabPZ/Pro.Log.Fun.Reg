-- función que asigna calificaciones según las notas
asignarCalificaciones :: [Int] -> [String]
asignarCalificaciones notas = map asignarCalificacion notas
  where
    asignarCalificacion n
        | n >= 95 && n <= 100 = "Excelente"
        | n >= 85 && n <= 94  = "Notable"
        | n >= 75 && n <= 84  = "Bueno"
        | n >= 70 && n <= 74  = "Suficiente"
        | otherwise           = "Desempeno insuficiente"

main :: IO ()
main = do
    putStrLn "Lista de calificaciones correspondientes a las notas:"
    -- Imprimir el resultado de la función 
    --asignarCalificaciones para las calificaciones dadas
    print $ asignarCalificaciones [92, 78, 88, 65, 97]
