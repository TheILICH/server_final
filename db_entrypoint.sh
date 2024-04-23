#!/bin/bash
set -e

# Switch to the postgres user
su postgres << 'EOF'
# Start PostgreSQL in the background
pg_ctl -D "$PGDATA" -o "-c listen_addresses=''" -w start

# Execute the SQL script (replace 'db_dump.sql' with your script)
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < /docker-entrypoint-initdb.d/db_dump.sql

# Stop the PostgreSQL instance started earlier
pg_ctl -D "$PGDATA" -m fast -w stop
EOF

# Continue with the original entrypoint script
exec docker-entrypoint.sh postgres
