#!/bin/bash

MYSQL_CONTAINER_NAME="dataengineerplayground_db_1"  
MYSQL_USER="root"                                 
MYSQL_PASSWORD="example"                           
MYSQL_DB="base_negocio"                            

SQL_FILE_PATH="/home/ubuntu/data-engineer-playground/queries/LoadData.sql"

if [[ ! -f "$SQL_FILE_PATH" ]]; then
    echo "SQL file does not exist at the specified path: $SQL_FILE_PATH"
    exit 1
fi

docker cp "$SQL_FILE_PATH" "$MYSQL_CONTAINER_NAME:/tmp/LoadData.sql"

docker exec -it $MYSQL_CONTAINER_NAME ls /tmp/

docker exec -i "$MYSQL_CONTAINER_NAME" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DB" < /tmp/LoadData.sql