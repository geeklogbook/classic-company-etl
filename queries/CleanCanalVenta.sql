INSERT INTO base_negocio_today.canal_venta (
    `IdCanal`,
    `Canal`
)
SELECT
    `IdCanal`,
    `Canal`
FROM base_negocio_landing.canal_venta;

DROP TABLE base_negocio_landing.canal_venta;