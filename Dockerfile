FROM timescale/timescaledb-ha:pg16

# Install sudo like they do
RUN apt-get update && apt-get install -y sudo

# Allow postgres user to use sudo for specific commands
RUN echo "postgres ALL=(root) NOPASSWD: /usr/bin/mkdir, /bin/chown" > /etc/sudoers.d/postgres

ENV POSTGRES_DB=postgres
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}

# Copy wrapper with correct permissions
COPY --chmod=755 wrapper.sh /usr/local/bin/wrapper.sh

ENTRYPOINT ["wrapper.sh"]
CMD ["postgres", "--port=5432"]
