#!/usr/bin/env sh


export VERSION=${VERSION:-`git describe --tags`}

printf "
    USING VERSION: $VERSION
"

docker-compose -f docker-compose.yaml -f docker-compose-build.yaml build
docker stack deploy --compose-file docker-compose.yaml example
