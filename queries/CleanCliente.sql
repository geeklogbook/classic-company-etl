INSERT INTO base_negocio_today.cliente (
  IdCliente,
  Provincia,
  Nombre_y_Apellido,
  Domicilio,
  Telefono,
  Edad,
  Localidad,
  Latitud,
  Longitud,
  Fecha_Alta,
  Usuario_Alta,
  Fecha_Ultima_Modificacion,
  Usuario_Ultima_Modificacion,
  Marca_Baja
)
SELECT
  ID AS IdCliente,
  IFNULL(NULLIF(Provincia, ''), 'Sin Dato') AS Provincia,
  IFNULL(NULLIF(Nombre_y_Apellido, ''), 'Sin Dato') AS Nombre_y_Apellido,
  UC_Words(IFNULL(NULLIF(Domicilio, ''), 'Sin Dato')) AS Domicilio,
  Telefono,
  Edad,
  UC_Words(IFNULL(NULLIF(Localidad, ''), 'Sin Dato')) AS Localidad,
  CAST(IFNULL(NULLIF(REPLACE(Y, ',', '.'), ''), '0.0000000000') AS DECIMAL(13,10)) AS Latitud,
  CAST(IFNULL(NULLIF(REPLACE(X, ',', '.'), ''), '0.0000000000') AS DECIMAL(13,10)) AS Longitud,
  Fecha_Alta,
  Usuario_Alta,
  Fecha_Ultima_Modificacion,
  Usuario_Ultima_Modificacion,
  Marca_Baja
FROM base_negocio_landing.cliente;

DROP TABLE base_negocio_landing.cliente;