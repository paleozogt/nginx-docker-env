#!/usr/bin/env sh
set -eu

envsubst '${PORT} ${PORT}' < /etc/nginx/conf.d/default.conf.tmpl > /etc/nginx/conf.d/default.conf
exec "$@"
