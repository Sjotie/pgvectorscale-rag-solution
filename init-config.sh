#!/bin/bash
set -e

# Path to config files
PG_CONF="/home/postgres/pgdata/data/postgresql.conf"
PG_HBA="/home/postgres/pgdata/data/pg_hba.conf"

# Add listen settings to postgresql.conf
echo "listen_addresses = '*'" >> "$PG_CONF"

# Add external connection settings to pg_hba.conf
echo "host all all 0.0.0.0/0 md5" >> "$PG_HBA"
