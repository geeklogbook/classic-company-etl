USE base_negocio_landing;

ALTER TABLE `empleado` CHANGE `IDEmpleado` `IdEmpleado` INT(11) NULL DEFAULT NULL;
ALTER TABLE `empleado` ADD `Salario` DECIMAL(10,2) NOT NULL DEFAULT '0' AFTER `Salario2`;
UPDATE `empleado` SET `Salario` = IFNULL(`Salario2`, 0);
UPDATE `empleado` SET `Salario` = `Salario2` WHERE `Salario2` IS NOT NULL;
ALTER TABLE `empleado` DROP `Salario2`;

UPDATE `empleado` SET Apellido = 'Sin Dato' WHERE TRIM(Apellido) = "" OR ISNULL(Apellido);
UPDATE `empleado` SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = "" OR ISNULL(Nombre);
UPDATE `empleado` SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE `empleado` SET Sector = 'Sin Dato' WHERE TRIM(Sector) = "" OR ISNULL(Sector);
UPDATE `empleado` SET Cargo = 'Sin Dato' WHERE TRIM(Cargo) = "" OR ISNULL(Cargo);

UPDATE empleado SET Nombre = UC_Words(TRIM(Nombre)), Apellido = UC_Words(TRIM(Apellido));

UPDATE empleado SET Sucursal = 'Mendoza1' WHERE Sucursal = 'Mendoza 1';
UPDATE empleado SET Sucursal = 'Mendoza2' WHERE Sucursal = 'Mendoza 2';

ALTER TABLE `empleado` ADD `IdSucursal` INT NULL DEFAULT '0' AFTER `Sucursal`;

UPDATE empleado e 
JOIN base_negocio_today.sucursal s ON (e.Sucursal = s.Sucursal)
SET e.IdSucursal = s.IdSucursal;

ALTER TABLE `empleado` DROP `Sucursal`;

ALTER TABLE `empleado` ADD `CodigoEmpleado` INT NULL DEFAULT '0' AFTER `IdEmpleado`;

UPDATE empleado SET CodigoEmpleado = IdEmpleado;
UPDATE empleado SET IdEmpleado = (IdSucursal * 1000000) + CodigoEmpleado;

ALTER TABLE `empleado` ADD `IdCargo` INT NULL AFTER `Cargo`, 
                       ADD `IdSector` INT NULL AFTER `Sector`;

UPDATE empleado e JOIN cargo c ON (e.Cargo = c.Cargo) SET e.IdCargo = c.IdCargo;

UPDATE empleado e JOIN sector s ON (e.Sector = s.Sector) SET e.IdSector = s.IdSector;

ALTER TABLE `empleado` DROP `CodigoEmpleado`;
ALTER TABLE `empleado` DROP `sector`;
ALTER TABLE `empleado` DROP `Cargo`;

SELECT * FROM empleado