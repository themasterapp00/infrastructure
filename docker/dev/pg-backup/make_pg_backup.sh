#!/bin/sh

export PGPASSWORD="$POSTGRES_PASSWORD"
DUMP_FILE="/backups/backend-$(date +%Y-%m-%d-%H-%M-%S).dump"
ERROR_LOG_FILE="/backups/backend-$(date +%Y-%m-%d-%H-%M-%S).error.log"

pg_dump -h backend-postgresql -U $POSTGRES_USER -Fc $POSTGRES_DB > "$DUMP_FILE" 2> "$ERROR_LOG_FILE"

# Check if the error log has content
if [ -s "$ERROR_LOG_FILE" ]; then
    echo "Backup failed. See $ERROR_LOG_FILE for details."
    # Optionally, remove the (likely empty) dump file
    # rm "$DUMP_FILE"
else
    echo "Backup done at $(date +%Y-%m-%d_%H:%M:%S) to $DUMP_FILE"
    # Remove the empty error log if backup was successful
    rm "$ERROR_LOG_FILE"
fi


export PGPASSWORD="$KC_DB_PASSWORD"
DUMP_FILE="/backups/keycloak-$(date +%Y-%m-%d-%H-%M-%S).dump"
ERROR_LOG_FILE="/backups/keycloak-$(date +%Y-%m-%d-%H-%M-%S).error.log"
pg_dump -h keycloak-postgresql -U KC_DB_USERNAME -Fc $KC_DB > "$DUMP_FILE" 2> "$ERROR_LOG_FILE"

# Check if the error log has content
if [ -s "$ERROR_LOG_FILE" ]; then
    echo "Backup failed. See $ERROR_LOG_FILE for details."
    # Optionally, remove the (likely empty) dump file
    # rm "$DUMP_FILE"
else
    echo "Backup done at $(date +%Y-%m-%d_%H:%M:%S) to $DUMP_FILE"
    # Remove the empty error log if backup was successful
    rm "$ERROR_LOG_FILE"
fi

