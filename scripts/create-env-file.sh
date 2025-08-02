#!/bin/bash

# This script creates a .env file for Docker Compose.
# It expects all necessary values to be present as environment variables.

set -e # Exit immediately if a command exits with a non-zero status.

# Check for required variables to prevent creating a partial .env file
: "${BE_POSTGRES_DB:?BE_POSTGRES_DB not set or empty}"
: "${BE_POSTGRES_USER:?BE_POSTGRES_USER not set or empty}"
: "${BE_POSTGRES_PASSWORD:?BE_POSTGRES_PASSWORD not set or empty}"
: "${KC_POSTGRES_DB:?KC_POSTGRES_DB not set or empty}"
: "${KC_POSTGRES_USER:?KC_POSTGRES_USER not set or empty}"
: "${KC_POSTGRES_PASSWORD:?KC_POSTGRES_PASSWORD not set or empty}"
: "${KC_ADMIN:?KC_ADMIN not set or empty}"
: "${KC_ADMIN_PASSWORD:?KC_ADMIN_PASSWORD not set or empty}"
: "${DOMAIN:?DOMAIN not set or empty}"
: "${BACKEND_KEYCLOAK_CLIENT_ID:?BACKEND_KEYCLOAK_CLIENT_ID not set or empty}"
: "${BACKEND_KEYCLOAK_CLIENT_SECRET:?BACKEND_KEYCLOAK_CLIENT_SECRET not set or empty}"
: "${FRONTEND_KEYCLOAK_CLIENT_ID:?FRONTEND_KEYCLOAK_CLIENT_ID not set or empty}"
: "${KEYCLOAK_REALM:?KEYCLOAK_REALM not set or empty}"

echo "Creating .env file..."

# Use a heredoc to write the environment variables to the .env file
cat << EOF > .env
BE_POSTGRES_DB=${BE_POSTGRES_DB}
BE_POSTGRES_USER=${BE_POSTGRES_USER}
BE_POSTGRES_PASSWORD=${BE_POSTGRES_PASSWORD}
KC_POSTGRES_DB=${KC_POSTGRES_DB}
KC_POSTGRES_USER=${KC_POSTGRES_USER}
KC_POSTGRES_PASSWORD=${KC_POSTGRES_PASSWORD}
KC_ADMIN=${KC_ADMIN}
KC_ADMIN_PASSWORD=${KC_ADMIN_PASSWORD}
DOMAIN=${DOMAIN}
BACKEND_KEYCLOAK_CLIENT_ID=${BACKEND_KEYCLOAK_CLIENT_ID}
BACKEND_KEYCLOAK_CLIENT_SECRET=${BACKEND_KEYCLOAK_CLIENT_SECRET}
FRONTEND_KEYCLOAK_CLIENT_ID=${FRONTEND_KEYCLOAK_CLIENT_ID}
KEYCLOAK_REALM=${KEYCLOAK_REALM}
EOF

echo ".env file created successfully."