FROM docker:stable

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint
COPY docker /docker
RUN chmod +x /usr/bin/docker-entrypoint
ENTRYPOINT ["docker-entrypoint"]
