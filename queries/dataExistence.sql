-- SQLBook: Code
SELECT * FROM gasto;
-- SQLBook: Code
SELECT * FROM compra;
-- SQLBook: Code
SELECT * FROM venta;

DROP TABLE IF EXISTS sucursal
CREATE TABLE IF NOT EXISTS sucursal (
	ID			INTEGER,
	Sucursal	VARCHAR(40),
	Domicilio	VARCHAR(150),
	Localidad	VARCHAR(80),
	Provincia	VARCHAR(50),
	Latitud2	VARCHAR(30),
	Longitud2	VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci

LOAD DATA INFILE 'C:\\wamp64\\tmp\\Sucursales_ANSI.csv' 
INTO TABLE sucursal
CHARACTER SET latin1 -- Si no colocamos esta línea, no reconoce la codificación adecuada ANSI
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES
-- SELECT * FROM sucursal;
-- TRUNCATE TABLE sucursal;

LOAD DATA INFILE 'C:\\wamp64\\tmp\\Sucursales_UTF8.csv' 
INTO TABLE sucursal
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM sucursal;

DROP TABLE IF EXISTS cliente;
CREATE TABLE IF NOT EXISTS cliente (
	ID					INTEGER,
	Provincia			VARCHAR(50),
	Nombre_y_Apellido	VARCHAR(80),
	Domicilio			VARCHAR(150),
	Telefono			VARCHAR(30),
	Edad				VARCHAR(5),
	Localidad			VARCHAR(80),
	X					VARCHAR(30),
	Y					VARCHAR(30),
    Fecha_Alta			DATE NOT NULL,
    Usuario_Alta		VARCHAR(20),
    Fecha_Ultima_Modificacion		DATE NOT NULL,
    Usuario_Ultima_Modificacion		VARCHAR(20),
    Marca_Baja			TINYINT,
	col10				VARCHAR(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\wamp64\\tmp\\Clientes.csv'
INTO TABLE cliente
CHARACTER SET latin1
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM cliente;

DROP TABLE IF EXISTS `canal_venta`;
CREATE TABLE IF NOT EXISTS `canal_venta` (
  `IdCanal`				INTEGER,
  `Canal` 				VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\wamp64\\tmp\\CanalDeVenta.csv' 
INTO TABLE `canal_venta` 
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM canal_venta;

DROP TABLE IF EXISTS `tipo_gasto`;
CREATE TABLE IF NOT EXISTS `tipo_gasto` (
  `IdTipoGasto` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  `Monto_Aproximado` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`IdTipoGasto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\wamp64\\tmp\\TiposDeGasto.csv' 
INTO TABLE `tipo_gasto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM tipo_gasto;

DROP TABLE IF EXISTS proveedor;
CREATE TABLE IF NOT EXISTS proveedor (
	IDProveedor		INTEGER,
	Nombre			VARCHAR(80),
	Domicilio		VARCHAR(150),
	Ciudad			VARCHAR(80),
	Provincia		VARCHAR(50),
	Pais			VARCHAR(20),
	Departamento	VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\wamp64\\tmp\\Proveedores.csv' 
INTO TABLE proveedor
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM proveedor;

DROP TABLE IF EXISTS producto;
CREATE TABLE IF NOT EXISTS producto (
	IDProducto					INTEGER,
	Concepto					VARCHAR(100),
	Tipo						VARCHAR(50),
	Precio2						VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\wamp64\\tmp\\Productos.csv' 
INTO TABLE `producto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM proveedor;

DROP TABLE IF EXISTS empleado;
CREATE TABLE IF NOT EXISTS empleado (
	IDEmpleado					INTEGER,
	Apellido					VARCHAR(100),
	Nombre						VARCHAR(100),
	Sucursal					VARCHAR(50),
	Sector						VARCHAR(50),
	Cargo						VARCHAR(50),
	Salario2					VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\wamp64\\tmp\\Empleados.csv' 
INTO TABLE `empleado` 
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;
-- SELECT * FROM empleado;
