DROP DATABASE IF EXISTS base_negocio_today;
CREATE DATABASE IF NOT EXISTS base_negocio_today;
USE base_negocio_today;

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
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE `sucursal` (
  `IdSucursal` int DEFAULT NULL,
  `Sucursal` varchar(40) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Domicilio` varchar(150) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Localidad` varchar(80) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Provincia` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Latitud` decimal(13,10) NOT NULL DEFAULT '0.0000000000',
  `Longitud` decimal(13,10) NOT NULL DEFAULT '0.0000000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- DROP TABLE IF EXISTS proveedor;
-- CREATE TABLE IF NOT EXISTS proveedor (
-- 	IDProveedor		INTEGER,
-- 	Nombre			  VARCHAR(80),
-- 	Domicilio		  VARCHAR(150),
-- 	Ciudad			  VARCHAR(80),
-- 	Provincia		  VARCHAR(50),
-- 	Pais			    VARCHAR(20),
-- 	Departamento	VARCHAR(80)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- DROP TABLE IF EXISTS producto;
-- CREATE TABLE IF NOT EXISTS producto (
-- 	IDProducto					INTEGER,
-- 	Concepto					VARCHAR(100),
-- 	Tipo						VARCHAR(50),
-- 	Precio2						VARCHAR(30)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE `empleado` (
  `IdEmpleado` int DEFAULT NULL,
  `Apellido` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Nombre` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `IdSucursal` int DEFAULT '0',
  `IdSector` int DEFAULT NULL,
  `IdCargo` int DEFAULT NULL,
  `Salario` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci

-- NO CHANGES
CREATE TABLE IF NOT EXISTS gasto (
  	`IdGasto` 		INTEGER,
  	`IdSucursal` 	INTEGER,
  	`IdTipoGasto` INTEGER,
    `Fecha`			  DATE,
  	`Monto` 		  DECIMAL(10,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

 CREATE TABLE IF NOT EXISTS compra (
  `IdCompra`			INTEGER,
  `Fecha` 				DATE,
  `IdProducto`		INTEGER,
  `Cantidad`			INTEGER,
  `Precio`				DECIMAL(10,2),
  `IdProveedor`		INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;


CREATE TABLE IF NOT EXISTS canal_venta (
  `IdCanal`				INTEGER,
  `Canal` 				VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE tipo_gasto (
  `IdTipoGasto` int NOT NULL AUTO_INCREMENT,
  `Tipo_Gasto` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`IdTipoGasto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS `cargo` (
  `IdCargo` integer NOT NULL AUTO_INCREMENT,
  `Cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`IdCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS `sector` (
  `IdSector` integer NOT NULL AUTO_INCREMENT,
  `Sector` varchar(50) NOT NULL,
  PRIMARY KEY (`IdSector`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
