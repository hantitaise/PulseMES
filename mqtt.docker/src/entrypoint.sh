#!/usr/bin/env bash
set -e

# Start Mosquitto in background
mosquitto -c /etc/mosquitto/mosquitto.conf &

# Start NGINX in foreground (will keep container alive)
nginx -g "daemon off;"
