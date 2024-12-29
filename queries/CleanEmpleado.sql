INSERT INTO base_negocio_today.empleado (
    `IdEmpleado`,
    `Apellido`,
    `Nombre`,
    `IdSucursal`,
    `IdSector`,
    `IdCargo`,
    `Salario`
)
SELECT
    `IdEmpleado`,
    `Apellido`,
    `Nombre`,
    `IdSucursal`,
    `IdSector`,
    `IdCargo`,
    `Salario`
FROM base_negocio_landing.empleado;

DROP TABLE base_negocio_landing.empleado;