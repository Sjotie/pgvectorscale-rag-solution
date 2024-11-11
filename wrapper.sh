#!/bin/bash
set -e

unset PGHOST
unset PGPORT

# Use the correct path to docker-entrypoint.sh
exec /usr/local/bin/docker-entrypoint.sh "$@"
