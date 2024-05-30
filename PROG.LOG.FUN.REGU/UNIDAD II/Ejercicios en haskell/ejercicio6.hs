import Data.List (filter, foldl')

-- Calcular la media de una lista de números
media :: [Double] -> Double
media xs = sum xs / fromIntegral (length xs)

-- Calcular la desviación estándar de una lista de números
desviacionEstandar :: [Double] -> Double
desviacionEstandar xs = sqrt (sumSquaredDiffs / fromIntegral (length xs))
  where
    valorDeLaMedia = media xs
    squaredDiffs = map (\x -> (x - valorDeLaMedia)^2) xs
    sumSquaredDiffs = sum squaredDiffs

-- función que determina si un 
-- valor es atípico en una muestra
atipico :: [Double] -> Double -> Bool
atipico muestra n =
    let
        mediaR = media muestra
        desviacion = desviacionEstandar muestra
        puntuacion = (n - mediaR) / desviacion
    in
        puntuacion < -3 || puntuacion > 3

-- Definir la función que filtra los datos atípicos en una muestra
datosAtipicos :: [Double] -> [Double]
datosAtipicos muestra = filter (atipico muestra) muestra

main :: IO ()
main = do
    putStrLn "Datos atipicos en la muestra [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1000]:"
    -- Imprimir el resultado de la función datosAtipicos para la muestra dada
    print $ datosAtipicos [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1000]

