#!/bin/bash

[[ -z "$REGISTRY_PROXY_FQDN" ]] && $REGISTRY_PROXY_FQDN=$DOCKER_REGISTRY_HOST

envsubst '${DOCKER_REGISTRY_HOST} ${DOCKER_REGISTRY_PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
echo "{\"host\": \"$REGISTRY_PROXY_FQDN\", \"port\": $DOCKER_REGISTRY_PORT}" > /app/registry-host.json

exec "$@"
