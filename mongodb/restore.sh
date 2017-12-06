#!/bin/sh

set -e

if [ $# -lt 3 ]; then
    echo "Usage: "
    echo "     ./restore.sh <docker_name> <database_name> <dump_path>"
    echo "Options: "
    echo "     docker_name: the mongodb docker container name or id "
    echo "     database_name: the mongodb database to restore "
    echo "     dump_path: the path including the mongodb dump files "
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
