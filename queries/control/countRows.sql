USE base_negocio;
SELECT 'canal_venta' AS tabla, (SELECT COUNT(*) FROM canal_venta) AS HasData
UNION
SELECT 'cliente' AS tabla, (SELECT COUNT(*) FROM cliente) AS HasData
UNION
SELECT 'compra' AS tabla, (SELECT COUNT(*) FROM compra) AS HasData
UNION
SELECT 'empleado' AS tabla, (SELECT COUNT(*) FROM empleado) AS HasData
UNION
SELECT 'gasto' AS tabla, (SELECT COUNT(*) FROM gasto) AS HasData
UNION
SELECT 'producto' AS tabla, (SELECT COUNT(*) FROM producto) AS HasData
UNION
SELECT 'proveedor' AS tabla, (SELECT COUNT(*) FROM proveedor) AS HasData
UNION
SELECT 'sucursal' AS tabla, (SELECT COUNT(*) FROM sucursal) AS HasData
UNION
SELECT 'tipo_gasto' AS tabla, (SELECT COUNT(*) FROM tipo_gasto) AS HasData
UNION
SELECT 'venta' AS tabla, (SELECT COUNT(*) FROM venta) AS HasData