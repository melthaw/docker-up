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
DUMP_PATH=$3
BACKUP_PATH=$(date +%Y_%m_%d_%H_%M)

docker exec $DOCKER mkdir -p /tmp/backup/
docker cp $DUMP_PATH/ $DOCKER:/tmp/backup/${BACKUP_PATH}/
docker exec $DOCKER mongorestore -d $2 --drop /tmp/backup/$BACKUP_PATH
