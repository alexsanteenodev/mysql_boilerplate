FROM postgres:14

# Add any custom configurations if needed
COPY ./postgresql.conf /etc/postgresql/postgresql.conf

# Set up a healthcheck
HEALTHCHECK --interval=5s --timeout=5s --retries=3 CMD pg_isready -U postgres || exit 1

# Default command to run when starting the container
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"] 