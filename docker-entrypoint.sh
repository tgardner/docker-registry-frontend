#!/bin/bash

[[ -z "$DOCKER_REGISTRY_HOST" ]] && die "Missing environment variable: DOCKER_REGISTRY_HOST=url-to-your-registry" 
[[ -z "$DOCKER_REGISTRY_PORT" ]] && DOCKER_REGISTRY_PORT=80 
[[ -z "$REGISTRY_PROXY_FQDN" ]] && REGISTRY_PROXY_FQDN=$DOCKER_REGISTRY_HOST
[[ -z "$REGISTRY_PROXY_PORT" ]] && REGISTRY_PROXY_PORT=$DOCKER_REGISTRY_PORT

envsubst '${DOCKER_REGISTRY_HOST} ${DOCKER_REGISTRY_PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf
echo "{\"host\": \"$REGISTRY_PROXY_FQDN\", \"port\": $REGISTRY_PROXY_PORT}" > /app/registry-host.json

exec "$@"
