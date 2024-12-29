INSERT INTO base_negocio_today.producto (
    `IdProducto`,
    `Producto`,
    `Categoria`,
    `Precio`
)
SELECT
    IdProducto,
    IFNULL(NULLIF(UC_Words(TRIM(Concepto)), ''), 'Sin Dato') AS Producto,
    IFNULL(NULLIF(UC_Words(TRIM(Tipo)), ''), 'Sin Dato') AS Categoria,
    Precio2 AS Precio
FROM base_negocio_landing.producto;

DROP TABLE base_negocio_landing.producto;