#!/bin/sh
# wait-for-postgres.py

set -e

host="$1"
shift
cmd="$@"

# Python script to wait for Postgres
until python3 -c "
import sys
import psycopg2

try:
    psycopg2.connect(host='$host', dbname='$POSTGRES_DB', user='postgres', password='$POSTGRES_PASSWORD')
    sys.exit(0)
except psycopg2.OperationalError:
    sys.exit(-1)
"; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd
