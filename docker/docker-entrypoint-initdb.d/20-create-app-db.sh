#!/usr/bin/env bash

set -eo pipefail

. /usr/local/bin/common-functions.sh

readarray -td" " databases <<<"$app_db"

set -x
for database in "${databases[@]}"
do
  echo $database
  echo "${database}-a" |  xargs
done
for database in "${databases[@]}"
do
  database = $(echo "${database}" | xargs)
  psql -v ON_ERROR_STOP=1 \
      --dbname "$db" \
      --username="$user" <<-EOSQL
      CREATE DATABASE "${database}" OWNER ${app_user};
EOSQL
done

