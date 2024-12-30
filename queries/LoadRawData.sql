-- Active: 1733584034222@@127.0.0.1@3307@base_negocio_landing
USE base_negocio_landing;

-- If you can't load the data using local data local infile
SET GLOBAL local_infile=1;

-- CSV File
LOAD DATA LOCAL INFILE '/home/ubuntu/data-engineer-playground/data/sources/csv/Clientes.csv'
INTO TABLE cliente
CHARACTER SET utf8
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE  '/home/ubuntu/data-engineer-playground/data/sources/csv/Compra.csv' 
INTO TABLE compra 
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/ubuntu/data-engineer-playground/data/sources/csv/Gasto.csv'
INTO TABLE gasto 
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/ubuntu/data-engineer-playground/data/sources/csv/Sucursales.csv' 
INTO TABLE sucursal
CHARACTER SET utf8
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE  '/home/ubuntu/data-engineer-playground/data/sources/csv/Venta.csv' 
INTO TABLE venta
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/ubuntu/data-engineer-playground/data/sources/csv/TiposDeGasto.csv' 
INTO TABLE tipo_gasto
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/ubuntu/data-engineer-playground/data/sources/csv/Cargo.csv' 
INTO TABLE cargo
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/ubuntu/data-engineer-playground/data/sources/csv/Sector.csv' 
INTO TABLE sector
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/ubuntu/data-engineer-playground/data/sources/csv/Empleados.csv'
INTO TABLE empleado
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- Excel File converted to CSV
LOAD DATA LOCAL INFILE '/home/ubuntu/data-engineer-playground/data/outputs/converted/csv/Productos.csv' 
INTO TABLE producto 
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/ubuntu/data-engineer-playground/data/outputs/converted/csv/Proveedores.csv' 
INTO TABLE proveedor
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/ubuntu/data-engineer-playground/data/outputs/converted/csv/CanalDeVenta.csv'  
INTO TABLE canal_venta
CHARACTER SET utf8
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;