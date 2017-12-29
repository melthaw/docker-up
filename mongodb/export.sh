#!/bin/sh -e

if [ $# -lt 3 ]; then
    echo "Usage: "
    echo "     ./export.sh <docker_name> <database_name> <export_to_path>"
    echo "Options: "
    echo "     docker_name: the mongodb docker container name or id "
    echo "     database_name: the mongodb database to restore "
    echo "     export_to_path: the path to save the mongodb dump files "
    exit 1;
fi

if [ ! -e $3 ]; then
    echo "The path '$3' not existed"
    exit 1;
fi

DOCKER=$1

RELATIVE_DUMP_PATH=$(date +%Y_%m_%d_%H_%M)

DOCKER_DUMP_PATH=/tmp/${RELATIVE_DUMP_PATH}

docker exec $DOCKER mkdir -p ${DOCKER_DUMP_PATH}
docker exec $DOCKER mongodump -h 127.0.0.1 -d $2 -o ${DOCKER_DUMP_PATH}

HOST_DUMP_PATH=$3
HOST_DUMP_PATH=${HOST_DUMP_PATH}/${RELATIVE_DUMP_PATH}
mkdir -p ${HOST_DUMP_PATH}

docker cp $DOCKER:${DOCKER_DUMP_PATH}/ ${HOST_DUMP_PATH}/

docker exec $DOCKER rm -fr ${DOCKER_DUMP_PATH}
