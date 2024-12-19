ALTER TABLE `cliente` CHANGE `ID` `IdCliente` INT(11) NOT NULL;

ALTER TABLE `cliente` ADD `Latitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Y`, 
                      ADD `Longitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Latitud`;
UPDATE cliente SET Y = '0' WHERE Y = '';
UPDATE cliente SET X = '0' WHERE X = '';
UPDATE cliente SET Latitud = REPLACE(Y,',','.');
UPDATE cliente SET Longitud = REPLACE(X,',','.');
ALTER TABLE cliente DROP `Y`;
ALTER TABLE cliente DROP `X`;

ALTER TABLE `cliente` DROP `col10`;

UPDATE `cliente` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `cliente` SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);
UPDATE `cliente` SET Nombre_y_Apellido = 'Sin Dato' WHERE TRIM(Nombre_y_Apellido) = "" OR ISNULL(Nombre_y_Apellido);
UPDATE `cliente` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);

UPDATE cliente SET Domicilio = UC_Words(TRIM(Domicilio)), Nombre_y_Apellido = UC_Words(TRIM(Nombre_y_Apellido));

UPDATE cliente SET Localidad = UC_Words(TRIM(Localidad));