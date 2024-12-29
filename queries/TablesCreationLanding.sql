-- Active: 1733584034222@@127.0.0.1@3307@mysql
DROP DATABASE IF EXISTS base_negocio_landing;
CREATE DATABASE IF NOT EXISTS base_negocio_landing;
USE base_negocio_landing;

CREATE TABLE IF NOT EXISTS gasto (
  	`IdGasto` 		INTEGER,
  	`IdSucursal` 	INTEGER,
  	`IdTipoGasto` 	INTEGER,
    `Fecha`			DATE,
  	`Monto` 		DECIMAL(10,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS compra (
  `IdCompra`			INTEGER,
  `Fecha` 				DATE,
  `IdProducto`			INTEGER,
  `Cantidad`			INTEGER,
  `Precio`				DECIMAL(10,2),
  `IdProveedor`			INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS venta (
  `IdVenta`				INTEGER,
  `Fecha` 				DATE NOT NULL,
  `Fecha_Entrega` 		DATE NOT NULL,
  `IdCanal`				INTEGER, 
  `IdCliente`			INTEGER, 
  `IdSucursal`			INTEGER,
  `IdEmpleado`			INTEGER,
  `IdProducto`			INTEGER,
  `Precio`				VARCHAR(30),
  `Cantidad`			VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS sucursal (
	ID			INTEGER,
	Sucursal	VARCHAR(40),
	Domicilio	VARCHAR(150),
	Localidad	VARCHAR(80),
	Provincia	VARCHAR(50),
	Latitud2	VARCHAR(30),
	Longitud2	VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

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

CREATE TABLE IF NOT EXISTS canal_venta (
  `IdCanal`				INTEGER,
  `Canal` 				VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS tipo_gasto (
  `IdTipoGasto` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  `Monto_Aproximado` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`IdTipoGasto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS proveedor (
	IDProveedor		INTEGER,
	Nombre			VARCHAR(80),
	Domicilio		VARCHAR(150),
	Ciudad			VARCHAR(80),
	Provincia		VARCHAR(50),
	Pais			VARCHAR(20),
	Departamento	VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE IF NOT EXISTS producto (
	IDProducto					INTEGER,
	Concepto					VARCHAR(100),
	Tipo						VARCHAR(50),
	Precio2						VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE `empleado` (
  `IdEmpleado` int DEFAULT NULL,
  `Apellido` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Nombre` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `IdSucursal` int DEFAULT '0',
  `IdSector` int DEFAULT NULL,
  `IdCargo` int DEFAULT NULL,
  `Salario` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci

CREATE TABLE `cargo` (
  `IdCargo` int NOT NULL AUTO_INCREMENT,
  `Cargo` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`IdCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

CREATE TABLE `sector` (
  `IdSector` int NOT NULL AUTO_INCREMENT,
  `Sector` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`IdSector`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;