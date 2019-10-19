FROM nginx:alpine

ENV DOCKER_REGISTRY_HOST=localhost
ENV DOCKER_REGISTRY_PORT=5000

RUN apk add --no-cache ca-certificates bash

COPY dist/ /app
COPY nginx.conf.template /etc/nginx/conf.d/default.conf.template
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]