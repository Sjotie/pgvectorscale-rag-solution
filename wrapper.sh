#!/bin/bash
set -e

# Railway-specific: unset these to allow proper initialization
unset PGHOST
unset PGPORT

# Call the entrypoint with all arguments
/docker-entrypoint.sh "$@"
