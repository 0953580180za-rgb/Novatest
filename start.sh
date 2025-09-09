#!/bin/sh
# Heroku provides $PORT and $DATABASE_URL automatically
export GF_SERVER_HTTP_PORT=${PORT}
export GF_SERVER_ROOT_URL=%(protocol)s://%(domain)s/

# Persist users/dashboards in Postgres (Heroku add-on)
export GF_DATABASE_TYPE=postgres
export GF_DATABASE_URL=${DATABASE_URL}

# Security
export GF_AUTH_ANONYMOUS_ENABLED=false

# Optional: install plugins on boot (comma-separated IDs)
# export GF_INSTALL_PLUGINS="grafana-clock-panel,grafana-piechart-panel"

# Run the official entrypoint
exec /run.sh
