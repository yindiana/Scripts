#!/bin/bash

# Ce script est utilise pour sauvegarder automatiquement les bases de donnees dans les conteneurs Docker.
# Il prend en charge actuellement mariadb et mysql.

DAYS=2
BACKUPDIR="/opt/backups_docker"
TIMESTAMP=$(date +"%Y%m%d%H%M")

# Verification et ceation du repertoire de sauvegarde
[ ! -d "$BACKUPDIR" ] && mkdir -p "$BACKUPDIR"

# Effectue la sauvegarde et supprime les anciennes
backup_container() {
    local CONTAINER_NAME=$1
    local BACKUP_CMD=$2
    local FILENAME="$BACKUPDIR/$CONTAINER_NAME-$TIMESTAMP.sql.gz"

    docker exec $CONTAINER_NAME $BACKUP_CMD | gzip > $FILENAME

    local OLD_BACKUPS=$(ls -1 $BACKUPDIR/$CONTAINER_NAME*.gz | wc -l)
    [ $OLD_BACKUPS -gt $DAYS ] && find $BACKUPDIR -name "$CONTAINER_NAME*.gz" -daystart -mtime +$DAYS -delete
}

# Sauvegarde des conteneurs mariadb et mysql
docker ps --format '{{.Names}}:{{.Image}}' | grep 'mysql\|mariadb' | cut -d":" -f1 | while read -r CONTAINER; do
    MYSQL_DATABASE=$(docker exec $CONTAINER env | grep MYSQL_DATABASE | cut -d"=" -f2-)
    MYSQL_PWD=$(docker exec $CONTAINER env | grep MYSQL_ROOT_PASSWORD | cut -d"=" -f2-)

    backup_container $CONTAINER "/usr/bin/mysqldump -u root -p$MYSQL_PWD $MYSQL_DATABASE"
done

echo "$TIMESTAMP : La sauvegarde des bases de donnees est terminee."
