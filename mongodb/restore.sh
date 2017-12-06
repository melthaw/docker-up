#!/bin/sh

set -e

if [ $# -lt 3 ]; then
    echo "Usage: "
    echo "     ./restore.sh <docker_name> <path> <database_name>"
    echo "Options: "
    echo "     docker_name: the mongodb docker container name or id "
    echo "     path: the path including the mongodb dump files "
    echo "     database_name: the mongodb database to restore "
    exit 1;
fi

if [ ! -e $2 ]; then
    echo "The path '$2' not existed"
    exit 1;
fi

BACKUP_PATH=/tmp/backup/$(date +%Y_%m_%d_%H_%M)
docker exec $1 mkdir -p $BACKUP_PATH
docker cp $2/ $1:$BACKUP_PATH/
docker exec $1 mongorestore -d $3 --drop $BACKUP_PATH
