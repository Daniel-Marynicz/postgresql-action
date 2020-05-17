
ARG INPUT_POSTGRES_IMAGE_TAG=latest

FROM postgres:$INPUT_POSTGRES_IMAGE_TAG as postgres

COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY common-functions.sh /usr/local/bin/common-functions.sh
COPY postgres-healthcheck.sh  /usr/local/bin/postgres-healthcheck.sh

RUN chmod +x /usr/local/bin/postgres-healthcheck.sh

HEALTHCHECK --retries=5 --start-period=20s --interval=5s \
    CMD bash -c /usr/local/bin/postgres-healthcheck.sh
