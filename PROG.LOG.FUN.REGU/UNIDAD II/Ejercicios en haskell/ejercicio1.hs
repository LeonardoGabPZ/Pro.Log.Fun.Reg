-- Construccion  de la funcion para aplicar descuento, esta recibe dos parametros
aplicarDescuento :: Float -> Float -> Float
aplicarDescuento precio descuento = precio - precio * descuento / 100

--esta funcion recibe dos parametros y calcula el porcentaje de iva
aplicaIVA :: Float -> Float -> Float
aplicaIVA precio porcentajeIndicado = precio + precio * porcentajeIndicado / 100

--calculo de precios a una canasta utilizando los precios iniciales
precioDeCanasta :: [(Float, Float)] -> (Float -> Float -> Float) -> Float
precioDeCanasta canasta function =
     sum [function precio descuento | (precio, descuento) <- canasta]

--metodo principal en donde corre el programa
main :: IO ()
main = do
    -- Lista de tuplas con precios y descuentos para aplicar
    let descuentos = [(1000, 20), (500, 10), (100, 1)]
    
    -- Lista de tuplas con precios y porcentajes de IVA para aplicar
    let iva = [(1000, 20), (500, 10), (100, 1)]
    
    putStrLn "El precio de tu compra luego del descuento es: "
    -- mostrar el resultado del calculo de descuento
    print $ precioDeCanasta descuentos aplicarDescuento
    
    putStrLn "El precio de de tu compra luego de el IVA es de: "
    -- mostrar el resultado del calculo del impuesto
    print $ precioDeCanasta iva aplicaIVA
