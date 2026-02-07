#!/bin/bash
set -e

export PGPASSWORD="$POSTGRES_PASSWORD"

echo "Checking for dump files to restore..."

# Find the latest backend dump file
LATEST_DUMP=$(ls -t /restore/backend-*.dump 2>/dev/null | head -n 1)

if [ -n "$LATEST_DUMP" ]; then
    echo "Restoring from $LATEST_DUMP..."
    # pg_restore expects the DB to exist. The init process creates it before running these scripts.
    # We use -h localhost to ensure we connect via TCP/IP if needed, or socket.
    pg_restore -U "$POSTGRES_USER" -d "$POSTGRES_DB" --clean --if-exists "$LATEST_DUMP" || echo "Restore finished with errors or warnings"
else
    echo "No dump file found in /restore/"
fi
