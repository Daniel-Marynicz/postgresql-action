#!/bin/sh

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

docker logs ${SERVICE_ID}
