FROM docker:29

RUN set -eux ; \
    apk add  --no-cache bash
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint
COPY docker /docker
RUN chmod +x /usr/bin/docker-entrypoint
ENTRYPOINT ["docker-entrypoint"]
