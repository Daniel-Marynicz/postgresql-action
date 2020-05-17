#!/usr/bin/env bash

set -eo pipefail

. /usr/local/bin/common-functions.sh

export PGPASSWORD="${password}"

pg_isready \
    --host="$host" \
    --username="$user" \
    --dbname="$db"