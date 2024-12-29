INSERT INTO base_negocio_today.compra (
    `IdCompra`,
    `Fecha`,
    `IdProducto`,
    `Cantidad`,
    `Precio`,
    `IdProveedor`
)
SELECT
    `IdCompra`,
    `Fecha`,
    `IdProducto`,
    `Cantidad`,
    `Precio`,
    `IdProveedor`
FROM base_negocio_landing.compra;

DROP TABLE base_negocio_landing.compra;