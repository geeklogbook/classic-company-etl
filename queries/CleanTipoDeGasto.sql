INSERT INTO base_negocio_today.tipo_gasto (
  `IdTipoGasto`,
  `Tipo_Gasto`,
  `Monto_Aproximado`
)
SELECT
  `IdTipoGasto`,
  `Descripcion`,
  `Monto_Aproximado`
FROM base_negocio_landing.tipo_gasto;