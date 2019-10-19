#!/bin/bash
envsubst '${DOCKER_REGISTRY_HOST} ${DOCKER_REGISTRY_PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"
