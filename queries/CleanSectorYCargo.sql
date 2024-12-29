INSERT INTO base_negocio_today.cargo (
    `IdCargo`,
    `Cargo`
)
SELECT 
    `IdCargo`,
    `Cargo`
 FROM base_negocio_landing.cargo;

INSERT INTO base_negocio_today.sector (
    `IdSector`,
    `Sector`
)
SELECT 
`IdSector`,
`Sector`
 FROM base_negocio_landing.sector;

DROP TABLE base_negocio_landing.cargo;
DROP TABLE base_negocio_landing.sector;