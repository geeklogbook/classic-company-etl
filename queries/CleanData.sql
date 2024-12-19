USE base_negocio_landing;
-- 1. **Column Renaming**
ALTER TABLE `empleado` CHANGE `IDEmpleado` `IdEmpleado` INT(11) NULL DEFAULT NULL;
ALTER TABLE `proveedor` CHANGE `IDProveedor` `IdProveedor` INT(11) NULL DEFAULT NULL;
ALTER TABLE `sucursal` CHANGE `ID` `IdSucursal` INT(11) NULL DEFAULT NULL;
ALTER TABLE `producto` CHANGE `IDProducto` `IdProducto` INT(11) NULL DEFAULT NULL;
ALTER TABLE `producto` CHANGE `Concepto` `Producto` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL;

-- 2. **Data Type Modifications**
ALTER TABLE `empleado` ADD `Salario` DECIMAL(10,2) NOT NULL DEFAULT '0' AFTER `Salario2`;
UPDATE `empleado` SET `Salario` = IFNULL(`Salario2`, 0);
UPDATE `empleado` SET `Salario` = `Salario2` WHERE `Salario2` IS NOT NULL;
ALTER TABLE `empleado` DROP `Salario2`;

ALTER TABLE `producto` ADD `Precio` DECIMAL(15,3) NOT NULL DEFAULT '0' AFTER `Precio2`;
UPDATE `producto` SET Precio = REPLACE(Precio2,',','.');
ALTER TABLE `producto` DROP `Precio2`;

ALTER TABLE `sucursal` ADD `Latitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Longitud2`,
                         ADD `Longitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Latitud`;
UPDATE `sucursal` SET Latitud = REPLACE(Latitud2,',','.');
UPDATE `sucursal` SET Longitud = REPLACE(Longitud2,',','.');
ALTER TABLE `sucursal` DROP `Latitud2`;
ALTER TABLE `sucursal` DROP `Longitud2`;

UPDATE `venta` SET `Precio` = 0 WHERE `Precio` = '';
ALTER TABLE `venta` CHANGE `Precio` `Precio` DECIMAL(15,3) NOT NULL DEFAULT '0';


-- 4. **Imputation of Missing Values**

UPDATE `empleado` SET Apellido = 'Sin Dato' WHERE TRIM(Apellido) = "" OR ISNULL(Apellido);
UPDATE `empleado` SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = "" OR ISNULL(Nombre);
UPDATE `empleado` SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE `empleado` SET Sector = 'Sin Dato' WHERE TRIM(Sector) = "" OR ISNULL(Sector);
UPDATE `empleado` SET Cargo = 'Sin Dato' WHERE TRIM(Cargo) = "" OR ISNULL(Cargo);

UPDATE `producto` SET Producto = 'Sin Dato' WHERE TRIM(Producto) = "" OR ISNULL(Producto);
UPDATE `producto` SET Tipo = 'Sin Dato' WHERE TRIM(Tipo) = "" OR ISNULL(Tipo);

UPDATE `proveedor` SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = "" OR ISNULL(Nombre);
UPDATE `proveedor` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `proveedor` SET Ciudad = 'Sin Dato' WHERE TRIM(Ciudad) = "" OR ISNULL(Ciudad);
UPDATE `proveedor` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);
UPDATE `proveedor` SET Pais = 'Sin Dato' WHERE TRIM(Pais) = "" OR ISNULL(Pais);
UPDATE `proveedor` SET Departamento = 'Sin Dato' WHERE TRIM(Departamento) = "" OR ISNULL(Departamento);

UPDATE `sucursal` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `sucursal` SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE `sucursal` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);
UPDATE `sucursal` SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);

-- 5. **Normalization to Capitalized Letters**

UPDATE sucursal SET Domicilio = UC_Words(TRIM(Domicilio)), Sucursal = UC_Words(TRIM(Sucursal));

UPDATE proveedor SET Nombre = UC_Words(TRIM(Nombre)), Domicilio = UC_Words(TRIM(Domicilio));

UPDATE proveedor SET Ciudad = UC_Words(TRIM(Ciudad)), Provincia = UC_Words(TRIM(Provincia));

UPDATE producto SET Producto = UC_Words(TRIM(Producto));

UPDATE empleado SET Nombre = UC_Words(TRIM(Nombre)), Apellido = UC_Words(TRIM(Apellido));

-- 6. **Sales Table Data Cleaning and Normalization**
UPDATE venta v JOIN producto p ON (v.IdProducto = p.IdProducto)
SET v.Precio = p.Precio
WHERE v.Precio = 0;

-- 7. **Auxiliary Table for Records with Issues (Zero Quantity)**
DROP TABLE IF EXISTS `aux_venta`;
CREATE TABLE IF NOT EXISTS `aux_venta` (
  `IdVenta` INTEGER,
  `Fecha` DATE NOT NULL,
  `Fecha_Entrega` DATE NOT NULL,
  `IdCliente` INTEGER, 
  `IdSucursal` INTEGER,
  `IdEmpleado` INTEGER,
  `IdProducto` INTEGER,
  `Precio` FLOAT,
  `Cantidad` INTEGER,
  `Motivo` INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

UPDATE venta SET Cantidad = REPLACE(Cantidad, '\r', '');

INSERT INTO aux_venta (IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Motivo)
SELECT IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, 0, 1
FROM venta WHERE Cantidad = '' OR Cantidad IS NULL;

UPDATE venta SET Cantidad = '1' WHERE Cantidad = '' OR Cantidad IS NULL;
ALTER TABLE `venta` CHANGE `Cantidad` `Cantidad` INTEGER NOT NULL DEFAULT '0';

-- 8. **Employee Table Key Generation (Surrogate Key Creation)**
UPDATE empleado SET Sucursal = 'Mendoza1' WHERE Sucursal = 'Mendoza 1';
UPDATE empleado SET Sucursal = 'Mendoza2' WHERE Sucursal = 'Mendoza 2';

ALTER TABLE `empleado` ADD `IdSucursal` INT NULL DEFAULT '0' AFTER `Sucursal`;

UPDATE empleado e JOIN sucursal s
	ON (e.Sucursal = s.Sucursal)
SET e.IdSucursal = s.IdSucursal;

ALTER TABLE `empleado` DROP `Sucursal`;

ALTER TABLE `empleado` ADD `CodigoEmpleado` INT NULL DEFAULT '0' AFTER `IdEmpleado`;

UPDATE empleado SET CodigoEmpleado = IdEmpleado;
UPDATE empleado SET IdEmpleado = (IdSucursal * 1000000) + CodigoEmpleado;

-- 9. **Foreign Key Modification in Employee Table**
UPDATE venta SET IdEmpleado = (IdSucursal * 1000000) + IdEmpleado;

-- 10. **Normalization: Creating Auxiliary Tables for Positions and Sectors**
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `IdCargo` integer NOT NULL AUTO_INCREMENT,
  `Cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`IdCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `IdSector` integer NOT NULL AUTO_INCREMENT,
  `Sector` varchar(50) NOT NULL,
  PRIMARY KEY (`IdSector`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- 11. **Populating and Normalizing Positions and Sectors**
INSERT INTO cargo (Cargo)
SELECT DISTINCT Cargo FROM empleado WHERE Cargo NOT IN (SELECT Cargo FROM cargo);

INSERT INTO sector (Sector)
SELECT DISTINCT Sector FROM empleado WHERE Sector NOT IN (SELECT Sector FROM sector);

ALTER TABLE `empleado` ADD `IdCargo` INT NULL AFTER `Cargo`, 
                         ADD `IdSector` INT NULL AFTER `Sector`;

UPDATE empleado e JOIN cargo c ON (e.Cargo = c.Cargo) SET e.IdCargo = c.IdCargo;

UPDATE empleado e JOIN sector s ON (e.Sector = s.Sector) SET e.IdSector = s.IdSector;