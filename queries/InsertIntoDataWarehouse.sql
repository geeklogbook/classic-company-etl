-- Poblar Dimensión Cliente
INSERT INTO dim_cliente (IdCliente, Provincia, Nombre_y_Apellido, Edad, Localidad, Fecha_Alta, Usuario_Alta, Marca_Baja)
SELECT 
    IdCliente,
    Provincia,
    Nombre_y_Apellido,
    Edad,
    Localidad,
    Fecha_Alta,
    Usuario_Alta,
    Marca_Baja
FROM cliente;

-- Poblar Dimensión Sucursal
INSERT INTO dim_sucursal (IdSucursal, Sucursal, Localidad, Provincia, Latitud, Longitud)
SELECT 
    IdSucursal,
    Sucursal,
    Localidad,
    Provincia,
    Latitud,
    Longitud
FROM sucursal;

-- Poblar Dimensión Producto
INSERT INTO dim_producto (IdProducto, Producto, Categoria, Precio)
SELECT 
    IdProducto,
    Producto,
    Categoria,
    Precio
FROM producto;

-- Poblar Dimensión Fecha
INSERT INTO dim_fecha (FechaKey, Fecha, Año, Mes, Día, Trimestre, Semana)
SELECT DISTINCT 
    DATE_FORMAT(Fecha, '%Y%m%d') AS FechaKey,
    Fecha,
    YEAR(Fecha) AS Año,
    MONTH(Fecha) AS Mes,
    DAY(Fecha) AS Día,
    QUARTER(Fecha) AS Trimestre,
    WEEK(Fecha) AS Semana
FROM venta
UNION
SELECT DISTINCT 
    DATE_FORMAT(Fecha_Entrega, '%Y%m%d') AS FechaKey,
    Fecha_Entrega,
    YEAR(Fecha_Entrega) AS Año,
    MONTH(Fecha_Entrega) AS Mes,
    DAY(Fecha_Entrega) AS Día,
    QUARTER(Fecha_Entrega) AS Trimestre,
    WEEK(Fecha_Entrega) AS Semana
FROM venta;

-- Poblar Dimensión Canal
INSERT INTO dim_canal (IdCanal, Canal)
SELECT 
    IdCanal,
    Canal
FROM canal_venta;

-- Poblar Dimensión Empleado
INSERT INTO dim_empleado (IdEmpleado, Apellido, Nombre, IdSucursal, Salario)
SELECT 
    IdEmpleado,
    Apellido,
    Nombre,
    IdSucursal,
    Salario
FROM empleado;


INSERT INTO hechos_venta (IdVenta, FechaKey, FechaEntregaKey, IdCanal, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad)
SELECT 
    IdVenta,
    DATE_FORMAT(Fecha, '%Y%m%d') AS FechaKey,
    DATE_FORMAT(Fecha_Entrega, '%Y%m%d') AS FechaEntregaKey,
    IdCanal,
    IdCliente,
    IdSucursal,
    IdEmpleado,
    IdProducto,
    Precio,
    Cantidad
FROM venta;