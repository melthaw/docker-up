#!/bin/sh -e

if [ $# -lt 3 ]; then
    echo "Usage: "
    echo "     ./restore.sh <docker_name> <database_name> <export_to_path>"
    echo "Options: "
    echo "     docker_name: the mysql docker container name or id "
    echo "     database_name: the mysql database to export "
    echo "     export_to_path: the path to save the exported mysql files"
    exit 1;
fi

if [ ! -e $3 ]; then
    echo "The path '$3' not existed"
    exit 1;
fi

DOCKER=$1
DB_NAME=$2
EXPORT_TO_PATH=$3/$(date +%Y_%m_%d_%H_%M)

mkdir -p $EXPORT_TO_PATH

docker exec -i $DOCKER mysqldump -uroot -p $DB_NAME > $EXPORT_TO_PATH/${DB_NAME}.sql
