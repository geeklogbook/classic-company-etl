INSERT INTO base_negocio_today.cargo (Cargo)
SELECT DISTINCT Cargo FROM base_negocio_landing.empleado WHERE Cargo NOT IN (SELECT Cargo FROM cargo);

INSERT INTO base_negocio_today.sector (Sector)
SELECT DISTINCT Sector FROM base_negocio_landing.empleado WHERE Sector NOT IN (SELECT Sector FROM sector);