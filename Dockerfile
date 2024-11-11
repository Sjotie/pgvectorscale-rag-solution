FROM timescale/timescaledb-ha:pg16

ENV POSTGRES_DB=postgres
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

# Add wrapper script for Railway-specific port handling
COPY wrapper.sh /usr/local/bin/wrapper.sh
RUN chmod +x /usr/local/bin/wrapper.sh

ENTRYPOINT ["wrapper.sh"]
CMD ["postgres", "--port=5432"]
