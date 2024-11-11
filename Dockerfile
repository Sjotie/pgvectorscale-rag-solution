FROM timescale/timescaledb-ha:pg16

# Set environment variables first
ENV POSTGRES_DB=postgres
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

# Copy wrapper script right away
COPY --chmod=755 wrapper.sh /usr/local/bin/wrapper.sh

# Use the docker-entrypoint path we learned
ENTRYPOINT ["/usr/local/bin/wrapper.sh"]
CMD ["postgres", "--port=5432"]
