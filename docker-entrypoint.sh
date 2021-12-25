#!/bin/bash

set -eo pipefail

cd /docker
IMAGE_ID=$(docker build --quiet --build-arg INPUT_POSTGRES_IMAGE_TAG="$INPUT_POSTGRES_IMAGE_TAG" .)

SERVICE_ID=$(docker run \
  -e POSTGRES_USER="${INPUT_POSTGRES_USER:-postgres}" \
  -e POSTGRES_DB="${INPUT_POSTGRES_DB:-postgres}"     \
  -e POSTGRES_PASSWORD="${INPUT_POSTGRES_PASSWORD:-postgres}" \
  -e POSTGRES_EXTENSIONS="$INPUT_POSTGRES_EXTENSIONS" \
  -e APP_USER="$INPUT_APP_USER" \
  -e APP_USER_PASSWORD="$INPUT_APP_USER_PASSWORD" \
  -e APP_DB="$INPUT_APP_DB" \
  -p "$INPUT_EXPOSED_POSTGRES_PORT:5432" \
  --detach \
  ${IMAGE_ID})

retry=0
function waitUntilHealthy() {
    SHORT_ID=$(docker ps --filter "health=healthy" --filter "id=${SERVICE_ID}" --quiet)
    if [[ -z "$SHORT_ID" ]] ;
    then
        ((retry=retry+1))
        if [[ ${retry} < 10 ]] ; then
            sleep 1
            waitUntilHealthy
        fi
    fi
}
waitUntilHealthy

sleep 2
echo "sdsad"
docker logs "$SERVICE_ID"
sleep 10
docker ps -a
echo $SERVICE_ID
docker logs "$SERVICE_ID"
waitUntilHealthy

docker ps -a
