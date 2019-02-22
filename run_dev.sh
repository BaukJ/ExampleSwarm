#!/usr/bin/env sh

export VERSION=${VERSION:-latest}
docker-compose pull
docker stack deploy --compose-file docker-compose.yaml --compose-file docker-compose-dev.yaml example
