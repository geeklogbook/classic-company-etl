USE base_negocio_landing;

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
SELECT 
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
FROM base_negocio_landing.venta WHERE Cantidad != '' OR Cantidad IS NULL;


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
SELECT 
  IdVenta, 
  Fecha, 
  Fecha_Entrega, 
  IdCliente, 
  IdSucursal, 
  IdEmpleado, 
  IdProducto, 
  Precio, 
  0, 
  1
FROM base_negocio_landing.venta WHERE Cantidad = '' OR Cantidad IS NULL;

DROP TABLE base_negocio_landing.venta;