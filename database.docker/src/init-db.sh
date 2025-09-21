#!/usr/bin/env bash
set -e

# Crée un rôle applicatif avec son mot de passe
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE ROLE app_user WITH LOGIN PASSWORD 'AppUserPass!';
    GRANT ALL PRIVILEGES ON DATABASE "$POSTGRES_DB" TO app_user;
EOSQL

# Active l’extension TimescaleDB dans la base principale
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE EXTENSION IF NOT EXISTS timescaledb;
EOSQL
