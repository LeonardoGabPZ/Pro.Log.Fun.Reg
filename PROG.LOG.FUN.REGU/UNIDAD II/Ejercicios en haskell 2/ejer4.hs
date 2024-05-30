import Data.Char (toUpper)
import Data.List (zip)

-- función para retornar la calificación correspondiente
calificacion :: Float -> String
calificacion puntos
  | puntos >= 95 && puntos <= 100 = "Excelente"
  | puntos >= 85 && puntos <= 94 = "Notable"
  | puntos >= 75 && puntos <= 84 = "Bueno"
  | puntos >= 70 && puntos <= 74 = "Suficiente"
  | otherwise = "Desempeno insuficiente"

-- función que recibe un
-- diccionario de materias y notas y
-- devuelve otro con las asignaturas en mayúsculas y las calificaciones
aplicaCalificacion :: [(String, Float)] -> [(String, String)]
aplicaCalificacion puntos = zip materias calificaciones
  where
    materias = map (map toUpper . fst) puntos -- Convertir las asignaturas a mayúsculas
    calificaciones = map (calificacion . snd) puntos

main :: IO ()
main = do
  putStrLn "Asignaturas y calificaciones correspondientes:"
  -- Imprimir el resultado de la función
  -- aplicaCalificacion para el diccionario de asignaturas y notas dado
  print $
    aplicaCalificacion
      [ ("Matematicas", 96),
        ("Fisica", 82),
        ("Quimica", 74),
        ("Economia", 88),
        ("Historia", 65),
        ("Programacion", 95)
      ]
