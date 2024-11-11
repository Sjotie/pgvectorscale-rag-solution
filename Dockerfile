FROM timescale/timescaledb-ha:pg16

ENV POSTGRES_DB=postgres
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

# Create config directory and add our custom config
RUN mkdir -p /etc/postgresql/conf.d
COPY postgresql.conf /etc/postgresql/conf.d/

COPY --chmod=755 wrapper.sh /usr/local/bin/wrapper.sh

ENTRYPOINT ["/usr/local/bin/wrapper.sh"]
CMD ["postgres", "--port=5432"]
