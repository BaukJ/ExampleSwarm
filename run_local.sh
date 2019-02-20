#!/usr/bin/env sh

export VERSION=${VERSION:-latest}
docker-compose build
docker stack deploy --compose-file docker-compose.yaml example
