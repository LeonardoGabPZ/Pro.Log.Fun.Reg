-- Definicion de tipo de dato
-- para representar un piso
data Piso = Piso
  { año :: Int,
    metros :: Int,
    habitaciones :: Int,
    garaje :: Bool,
    zona :: Char,
    precio :: Float
  }
  deriving (Show)

-- Lista de pisos
pisos :: [Piso]
pisos =
  [ Piso 2000 100 3 True 'A' 0,
    Piso 2012 60 2 True 'B' 0,
    Piso 1980 120 4 False 'A' 0,
    Piso 2005 75 3 True 'B' 0,
    Piso 2015 90 2 False 'A' 0
  ]

-- Función que añade el precio a un piso
agregarPrecioPiso :: Piso -> Piso
agregarPrecioPiso piso =
  let precioBase =
        ( fromIntegral (metros piso) * 1000
            + fromIntegral (habitaciones piso) * 5000
            + if garaje piso then 15000 else 0
        )
          * (1 - fromIntegral (2020 - año piso) / 100)
      precioConZona = if zona piso == 'B' then precioBase * 1.5 else precioBase
   in piso {precio = precioConZona}

-- Función que busca pisos dentro de un presupuesto
buscaPiso :: [Piso] -> Float -> [Piso]
buscaPiso pisos presupuesto = filter (\p -> precio p <= presupuesto) (map agregarPrecioPiso pisos)

main :: IO ()
main = do
  putStrLn "Pisos dentro del presupuesto de 100000:"
  -- Imprimir el resultado de la función buscaPiso
  -- para la lista de pisos y el presupuesto dado
  print $ buscaPiso pisos 100000
