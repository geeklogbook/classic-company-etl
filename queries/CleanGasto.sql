INSERT INTO base_negocio_today.gasto (
    `IdGasto`,
    `IdSucursal`,
    `IdTipoGasto`,
    `Fecha`,
    `Monto`
)
SELECT
    `IdGasto`,
    `IdSucursal`,
    `IdTipoGasto`,
    `Fecha`,
    `Monto`
FROM base_negocio_landing.gasto;

DROP TABLE base_negocio_landing.gasto;