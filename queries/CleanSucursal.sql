INSERT INTO base_negocio_today.sucursal (
  IdSucursal,
  Provincia,
  Sucursal,
  Domicilio,
  Latitud,
  Longitud,
  Localidad
)
SELECT
  ID,
  IFNULL(NULLIF(TRIM(Provincia), ''), 'Sin Dato') AS Provincia,
  UC_Words(IFNULL(NULLIF(TRIM(Sucursal), ''), 'Sin Dato')) AS Sucursal,
  UC_Words(IFNULL(NULLIF(TRIM(Domicilio), ''), 'Sin Dato')) AS Domicilio,
  CAST(IFNULL(NULLIF(REPLACE(Latitud2, ',', '.'), ''), '0.0000000000') AS DECIMAL(13,10)) AS Latitud,
  CAST(IFNULL(NULLIF(REPLACE(Longitud2, ',', '.'), ''), '0.0000000000') AS DECIMAL(13,10)) AS Longitud,
  UC_Words(IFNULL(NULLIF(TRIM(Localidad), ''), 'Sin Dato')) AS Localidad
FROM base_negocio_landing.sucursal;

DROP TABLE base_negocio_landing.sucursal;