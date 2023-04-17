#!/bin/bash

#parameters
DB_USER="noob"
DB_HOST="localhost"
DB_NAME="my_db"

#path to catalog with backup
BACKUP_DIR="/opt/mysql_backup"

#create the catalog if not exist
mkdir -p $BACKUP_DIR

#generate name of file
BACKUP_FILE="${DB_NAME}-$(date '+%Y-%m-%d_%H:%M:%S').sql.gz"

#dump database
mysqldump -u $DB_USER -p"$DB_PASSWORD" -h $DB_HOST $DB_NAME | gzip > "$BACKUP_DIR/$BACKUP_FILE"

echo "Backup of database '$DB_NAME' success $(date '+%Y-%m-%d %H:%M:%S')"

