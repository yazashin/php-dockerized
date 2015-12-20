#!/bin/bash -eu

mysql=( mysql --protocol=socket -uroot -p"${MYSQL_ROOT_PASSWORD}" )

"${mysql[@]}" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS mikan;
    GRANT ALL ON mikan.* TO '${MYSQL_USER}'@'%' ;
EOSQL
