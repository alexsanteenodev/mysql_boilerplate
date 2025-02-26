# PostgreSQL Docker Boilerplate

This is a simple PostgreSQL Docker setup for development purposes.

## Configuration

The PostgreSQL service is configured with the following default settings:

- **Database Name**: postgres_boilerplate
- **Username**: user
- **Password**: pass
- **Port**: 5432 (mapped to host)

## Directory Structure

- `docker-compose.yaml`: Docker Compose configuration file
- `Dockerfile`: Custom PostgreSQL image configuration
- `postgresql.conf`: Custom PostgreSQL configuration
- `init/`: Contains SQL scripts that will be executed when the container is first started
  - `01-init.sql`: Sample initialization script that creates tables and inserts data

## How to Use

### Starting the PostgreSQL Server

```bash
cd postgres_boilerplate
docker-compose up -d
```

### Stopping the PostgreSQL Server

```bash
docker-compose down
```

### Connecting to PostgreSQL

#### From the Host Machine

Using the psql client:

```bash
psql -h 127.0.0.1 -p 5432 -U user -d postgres_boilerplate
```

When prompted, enter the password: `pass`

#### From Another Docker Container

If you're connecting from another service in the same Docker network, use:

```
Host: postgres_db
Port: 5432
Username: user
Password: pass
Database: postgres_boilerplate
```

### Persisting Data

Data is persisted in a Docker volume named `postgres_data`. This means your data will survive container restarts and removals.

## Customization

To modify the default settings, edit the environment variables in the `docker-compose.yaml` file.

To add more initialization scripts, place them in the `init/` directory with a `.sql` extension. They will be executed in alphabetical order when the container is first started.

To modify PostgreSQL configuration, edit the `postgresql.conf` file and rebuild the container.
