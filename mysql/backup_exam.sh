#!/bin/bash
TIMESTAMP=$(date +"%F")
BACKUP_DIR="/usr/local/bin/mysql_backup"
MYSQL_USER="root"
MYSQL_PASSWORD="majid"
MYSQL_DATABASE="exam"
LOGFILE="/var/log/backup_exam.log"

exec > >(tee -a $LOGFILE) 2>&1

echo "Backup started at $(date)"

mkdir -p ${BACKUP_DIR}/${TIMESTAMP}
mysqldump -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} > ${BACKUP_DIR}/${TIMESTAMP}/exam.sql

echo "Backup completed at $(date)"