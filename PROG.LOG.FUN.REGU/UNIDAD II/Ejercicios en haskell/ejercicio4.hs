import Data.Char (toUpper)
import Data.List (zip)
-- función que devuelve la calificación correspondiente a una nota
calificacion :: Float -> String
calificacion puntaje
    | puntaje >= 95 && puntaje <= 100 = "Excelente"
    | puntaje >= 85 && puntaje <= 94 = "Notable"
    | puntaje >= 75 && puntaje <= 84 = "Bueno"
    | puntaje >= 70 && puntaje <= 74 = "Suficiente"
    | otherwise = "Desempeno insuficiente"

--  función que recibe un diccionario de materias
-- y notas y devuelve otro con las materias en mayúsculas y las calificaciones
aplicarACalificacion :: [(String, Float)] -> [(String, String)]
aplicarACalificacion puntajes = zip materias calificaciones
  where
    materias = map (map toUpper . fst) puntajes -- Convertir las asignaturas a mayúsculas
    calificaciones = map (calificacion . snd) puntajes

main :: IO ()
main = do
    putStrLn "Materias y calificaciones correspondientes:"
    -- Imprimir el resultado de la función aplicarACalificacion
    -- para el diccionario de materias y notas dado
    print $ aplicarACalificacion [("Matematicas", 96), ("Fisica", 82), 
        ("Quimica", 74), ("Economia", 88), ("Historia", 65), ("Programacion", 95)]
