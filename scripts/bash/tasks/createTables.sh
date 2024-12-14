#!/bin/bash

# Nombre del contenedor MySQL en Docker
CONTAINER_NAME=$(docker ps -q -f ancestor=mysql)

# Ruta del archivo SQL
SQL_FILE="/home/ubuntu/data-engineer-playground/queries/TablesCreation.sql"

# Ejecutar el SQL dentro del contenedor
docker exec -i $CONTAINER_NAME mysql -u root -pexample < $SQL_FILE