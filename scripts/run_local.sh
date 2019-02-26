#!/usr/bin/env sh

./scripts/build.sh


export VERSION=${VERSION:-`git describe --tags`}

printf "
         RUNNING LOCAL BUILD
        =====================
    USING VERSION: $VERSION

"

docker stack deploy --compose-file docker-compose.yaml example
