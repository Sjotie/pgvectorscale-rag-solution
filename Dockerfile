FROM timescale/timescaledb-ha:pg16

ENV POSTGRES_DB=postgres
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

# Copy init script and wrapper
COPY --chmod=755 init-config.sh /docker-entrypoint-initdb.d/
COPY --chmod=755 wrapper.sh /usr/local/bin/wrapper.sh

ENTRYPOINT ["/usr/local/bin/wrapper.sh"]
CMD ["postgres", "--port=5432"]
