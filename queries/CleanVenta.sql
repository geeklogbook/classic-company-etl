INSERT INTO base_negocio_today.venta (
  IdVenta, 
  Fecha, 
  Fecha_Entrega,
  IdCanal,
  IdCliente, 
  IdSucursal, 
  IdEmpleado, 
  IdProducto, 
  Precio, 
  Cantidad
  )
with clean_data as (
SELECT 
  IdVenta, 
  Fecha, 
  Fecha_Entrega,
  IdCanal,
  IdCliente, 
  IdSucursal, 
  IdEmpleado, 
  IdProducto, 
  #Precio, 
  #Cantidad,
  CASE  WHEN Precio  = '' THEN  "ERROR" ELSE Precio END AS Precio_Clean,
  CASE  WHEN Cantidad  = '' THEN  "ERROR" ELSE Cantidad END AS Cantidad_Clean
FROM base_negocio_landing.venta 
) 
SELECT * FROM clean_data
WHERE Cantidad_clean != "ERROR" AND Precio_clean != "ERROR"


INSERT INTO base_negocio_today.errores_venta (
  IdVenta, 
  Fecha, 
  Fecha_Entrega, 
  IdCliente, 
  IdSucursal, 
  IdEmpleado, 
  IdProducto, 
  Precio, 
  Cantidad, 
  Motivo
)
WITH clean_data AS (
  SELECT 
    IdVenta, 
    Fecha, 
    Fecha_Entrega,
    IdCliente, 
    IdSucursal, 
    IdEmpleado, 
    IdProducto, 
    CASE WHEN Precio = '' THEN 'ERROR' ELSE Precio END AS Precio,
    CASE WHEN Cantidad = '' THEN 'ERROR' ELSE Cantidad END AS Cantidad,
    CASE 
      WHEN Precio = '' AND Cantidad = '' THEN 'No Price and No Quantity'
      WHEN Precio = '' THEN 'No Price'
      WHEN Cantidad = '' THEN 'No Quantity'
    END AS Motivo
  FROM base_negocio_landing.venta
)
SELECT 
  IdVenta, 
  Fecha, 
  Fecha_Entrega, 
  IdCliente, 
  IdSucursal, 
  IdEmpleado, 
  IdProducto, 
  Precio, 
  Cantidad, 
  Motivo
FROM clean_data
WHERE Precio = 'ERROR' OR Cantidad = 'ERROR';


DROP TABLE base_negocio_landing.venta;

