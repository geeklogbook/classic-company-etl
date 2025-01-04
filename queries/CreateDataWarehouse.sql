-- Dimensión Cliente
CREATE TABLE dim_cliente (
    IdCliente INT PRIMARY KEY,
    Provincia VARCHAR(50),
    Nombre_y_Apellido VARCHAR(80),
    Edad VARCHAR(5),
    Localidad VARCHAR(80),
    Fecha_Alta DATE,
    Usuario_Alta VARCHAR(20),
    Marca_Baja TINYINT
);

-- Dimensión Sucursal
CREATE TABLE dim_sucursal (
    IdSucursal INT PRIMARY KEY,
    Sucursal VARCHAR(40),
    Localidad VARCHAR(80),
    Provincia VARCHAR(50),
    Latitud DECIMAL(13,10),
    Longitud DECIMAL(13,10)
);

-- Dimensión Producto
CREATE TABLE dim_producto (
    IdProducto INT PRIMARY KEY,
    Producto VARCHAR(100),
    Categoria VARCHAR(50),
    Precio DECIMAL(15,3)
);

-- Dimensión Fecha
CREATE TABLE dim_fecha (
    FechaKey INT PRIMARY KEY,
    Fecha DATE,
    Anio INT,
    Mes INT,
    Día INT,
    Trimestre INT,
    Semana INT
);

-- Dimensión Canal
CREATE TABLE dim_canal (
    IdCanal INT PRIMARY KEY,
    Canal VARCHAR(50)
);

-- Dimensión Empleado
CREATE TABLE dim_empleado (
    IdEmpleado INT PRIMARY KEY,
    Apellido VARCHAR(100),
    Nombre VARCHAR(100),
    IdSucursal INT,
    Salario DECIMAL(10,2)
);