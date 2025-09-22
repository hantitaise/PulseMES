#!/bin/bash

BACKUP_DIR="./postgres_backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/backup_${TIMESTAMP}.sql"

# Create backup directory
mkdir -p "${BACKUP_DIR}"

# Perform PostgreSQL backup
docker exec -t pulse_mes_db pg_dump -c -U postgres main_db > "${BACKUP_FILE}"

echo "Backup completed: ${BACKUP_FILE}"
