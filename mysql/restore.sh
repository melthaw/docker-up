#!/bin/sh -e

if [ $# -lt 3 ]; then
    echo "Usage: "
    echo "     ./restore.sh <docker_name> <database_name> <mysql_dump_file_path>"
    echo "Options: "
    echo "     docker_name: the mysql docker container name or id "
    echo "     database_name: the mysql database to restore "
    echo "     mysql_dump_file_path: the path where the mysql dump file is located "
    exit 1;
fi

DUMP_FILE=$3/$2.sql

if [ ! -e $DUMP_FILE ]; then
    echo "The mysql dump file '$DUMP_FILE' not existed"
    exit 1;
fi

DOCKER=$1
DB_NAME=$2

DOCKER_RESTORE_PATH=/tmp/backup/$(date +%Y_%m_%d_%H_%M)

docker exec $DOCKER mkdir -p $DOCKER_RESTORE_PATH
docker cp $DUMP_FILE $DOCKER:$DOCKER_RESTORE_PATH

echo "Enter password: \c"
read PASSWORD

RUN_HEADER='#!/bin/sh -e'
RUN_BODY="mysqldump -uroot -p$PASSWORD -B $DB_NAME < $DOCKER_RESTORE_PATH/$DB_NAME.sql"

docker exec $DOCKER bash -c "echo \"$RUN_HEADER\" > /run.sh"
docker exec $DOCKER bash -c "echo \"$RUN_BODY\" >> /run.sh"
docker exec $DOCKER bash -c "chmod +x /run.sh"

docker exec $DOCKER /run.sh
docker exec $DOCKER rm -f /run.sh
