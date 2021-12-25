#!/usr/bin/env bash

set -eo pipefail

. /usr/local/bin/common-functions.sh


set -x

psql -v ON_ERROR_STOP=1 \
    --dbname "$db" \
    --username="$user" -c '\l'

psql -v ON_ERROR_STOP=1 \
    --dbname "$db" \
    --username="$user" -c '\du'

