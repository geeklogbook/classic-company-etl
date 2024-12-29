USE base_negocio_landing;

ALTER TABLE `proveedor` CHANGE `IDProveedor` `IdProveedor` INT(11) NULL DEFAULT NULL;
ALTER TABLE `producto` CHANGE `IDProducto` `IdProducto` INT(11) NULL DEFAULT NULL;
ALTER TABLE `producto` CHANGE `Concepto` `Producto` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL;

-- 2. **Data Type Modifications**
ALTER TABLE `producto` ADD `Precio` DECIMAL(15,3) NOT NULL DEFAULT '0' AFTER `Precio2`;
UPDATE `producto` SET Precio = REPLACE(Precio2,',','.');
ALTER TABLE `producto` DROP `Precio2`;

UPDATE `venta` SET `Precio` = 0 WHERE `Precio` = '';
ALTER TABLE `venta` CHANGE `Precio` `Precio` DECIMAL(15,3) NOT NULL DEFAULT '0';


-- 4. **Imputation of Missing Values**

UPDATE `producto` SET Producto = 'Sin Dato' WHERE TRIM(Producto) = "" OR ISNULL(Producto);
UPDATE `producto` SET Tipo = 'Sin Dato' WHERE TRIM(Tipo) = "" OR ISNULL(Tipo);

UPDATE `proveedor` SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = "" OR ISNULL(Nombre);
UPDATE `proveedor` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `proveedor` SET Ciudad = 'Sin Dato' WHERE TRIM(Ciudad) = "" OR ISNULL(Ciudad);
UPDATE `proveedor` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);
UPDATE `proveedor` SET Pais = 'Sin Dato' WHERE TRIM(Pais) = "" OR ISNULL(Pais);
UPDATE `proveedor` SET Departamento = 'Sin Dato' WHERE TRIM(Departamento) = "" OR ISNULL(Departamento);

-- 5. **Normalization to Capitalized Letters**

UPDATE proveedor SET Nombre = UC_Words(TRIM(Nombre)), Domicilio = UC_Words(TRIM(Domicilio));

UPDATE proveedor SET Ciudad = UC_Words(TRIM(Ciudad)), Provincia = UC_Words(TRIM(Provincia));

UPDATE producto SET Producto = UC_Words(TRIM(Producto));

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