INSERT INTO base_negocio_today.tipo_gasto (
  `IdTipoGasto`,
  `Tipo_Gasto`
)
SELECT
  `IdTipoGasto`,
  `Descripcion`
FROM base_negocio_landing.tipo_gasto;

DROP TABLE base_negocio_landing.tipo_gasto;