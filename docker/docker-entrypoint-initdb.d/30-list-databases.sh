#!/usr/bin/env bash

set -eo pipefail

. /usr/local/bin/common-functions.sh


set -x

for database in "${databases[@]}"
do
  psql -v ON_ERROR_STOP=1 \
      --dbname "$db" \
      --username="$user" <<-EOSQL
      \l
EOSQL
done

