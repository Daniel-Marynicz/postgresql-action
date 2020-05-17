#!/usr/bin/env bash

set -eo pipefail

. /usr/local/bin/common-functions.sh

if [[ -z "${POSTGRES_EXTENSIONS}" ]] ; then
  return 0
fi


readarray -td" " extensions <<<"$POSTGRES_EXTENSIONS"

for extension in "${extensions[@]}"
do
  extension=$(echo ${extension} | xargs)
  psql -v ON_ERROR_STOP=1 \
      --dbname "template1" \
      --username="$user" <<-EOSQL
      CREATE EXTENSION IF NOT EXISTS "${extension}";
EOSQL

done

