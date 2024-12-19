-- Active: 1733584034222@@127.0.0.1@3307
DROP DATABASE IF EXISTS base_negocio_today;
CREATE DATABASE IF NOT EXISTS base_negocio_today;
USE base_negocio_today;

-- /*Importacion de las tablas*/
-- DROP TABLE IF EXISTS gasto;
-- CREATE TABLE IF NOT EXISTS gasto (
--   	`IdGasto` 		INTEGER,
--   	`IdSucursal` 	INTEGER,
--   	`IdTipoGasto` 	INTEGER,
--     `Fecha`			DATE,
--   	`Monto` 		DECIMAL(10,2)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- DROP TABLE IF EXISTS compra;
-- CREATE TABLE IF NOT EXISTS compra (
--   `IdCompra`			INTEGER,
--   `Fecha` 				DATE,
--   `IdProducto`			INTEGER,
--   `Cantidad`			INTEGER,
--   `Precio`				DECIMAL(10,2),
--   `IdProveedor`			INTEGER
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- DROP TABLE IF EXISTS venta;
-- CREATE TABLE IF NOT EXISTS venta (
--   `IdVenta`				INTEGER,
--   `Fecha` 				DATE NOT NULL,
--   `Fecha_Entrega` 		DATE NOT NULL,
--   `IdCanal`				INTEGER, 
--   `IdCliente`			INTEGER, 
--   `IdSucursal`			INTEGER,
--   `IdEmpleado`			INTEGER,
--   `IdProducto`			INTEGER,
--   `Precio`				VARCHAR(30),
--   `Cantidad`			VARCHAR(30)
--   -- `Precio`			DECIMAL(10,2),
--   -- `Cantidad`			INTEGER
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- DROP TABLE IF EXISTS sucursal;
-- CREATE TABLE IF NOT EXISTS sucursal (
-- 	ID			INTEGER,
-- 	Sucursal	VARCHAR(40),
-- 	Domicilio	VARCHAR(150),
-- 	Localidad	VARCHAR(80),
-- 	Provincia	VARCHAR(50),
-- 	Latitud2	VARCHAR(30),
-- 	Longitud2	VARCHAR(30)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


DROP TABLE IF EXISTS cliente;
CREATE TABLE `cliente` (
  `IdCliente` int NOT NULL,
  `Provincia` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Nombre_y_Apellido` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Domicilio` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Telefono` varchar(30) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Edad` varchar(5) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Localidad` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Latitud` decimal(13,10) NOT NULL DEFAULT '0.0000000000',
  `Longitud` decimal(13,10) NOT NULL DEFAULT '0.0000000000',
  `Fecha_Alta` date NOT NULL,
  `Usuario_Alta` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Fecha_Ultima_Modificacion` date NOT NULL,
  `Usuario_Ultima_Modificacion` varchar(20) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Marca_Baja` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci

-- DROP TABLE IF EXISTS canal_venta;
-- CREATE TABLE IF NOT EXISTS canal_venta (
--   `IdCanal`				INTEGER,
--   `Canal` 				VARCHAR(50)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE `tipo_gasto` (
  `IdTipoGasto` int NOT NULL AUTO_INCREMENT,
  `Tipo_Gasto` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  `Monto_Aproximado` decimal(10,2) NOT NULL,
  PRIMARY KEY (`IdTipoGasto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci

-- DROP TABLE IF EXISTS proveedor;
-- CREATE TABLE IF NOT EXISTS proveedor (
-- 	IDProveedor		INTEGER,
-- 	Nombre			VARCHAR(80),
-- 	Domicilio		VARCHAR(150),
-- 	Ciudad			VARCHAR(80),
-- 	Provincia		VARCHAR(50),
-- 	Pais			VARCHAR(20),
-- 	Departamento	VARCHAR(80)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- DROP TABLE IF EXISTS producto;
-- CREATE TABLE IF NOT EXISTS producto (
-- 	IDProducto					INTEGER,
-- 	Concepto					VARCHAR(100),
-- 	Tipo						VARCHAR(50),
-- 	Precio2						VARCHAR(30)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- DROP TABLE IF EXISTS empleado;
-- CREATE TABLE IF NOT EXISTS empleado (
-- 	IDEmpleado					INTEGER,
-- 	Apellido					VARCHAR(100),
-- 	Nombre						VARCHAR(100),
-- 	Sucursal					VARCHAR(50),
-- 	Sector						VARCHAR(50),
-- 	Cargo						VARCHAR(50),
-- 	Salario2					VARCHAR(30)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;