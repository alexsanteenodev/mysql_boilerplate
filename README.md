# MySQL Docker Boilerplate

This is a simple MySQL Docker setup for development purposes.

## Configuration

The MySQL service is configured with the following default settings:

- **Database Name**: mydb
- **Username**: user
- **Password**: password
- **Root Password**: rootpassword
- **Port**: 3306 (mapped to host)

## Directory Structure

- `docker-compose.yaml`: Docker Compose configuration file
- `init/`: Contains SQL scripts that will be executed when the container is first started
  - `01-init.sql`: Sample initialization script that creates tables and inserts data

## How to Use

### Starting the MySQL Server

```bash
cd mysql_boilerplate
docker-compose up -d
```

### Stopping the MySQL Server

```bash
docker-compose down
```

### Connecting to MySQL

#### From the Host Machine

Using the MySQL client:

```bash
mysql -h 127.0.0.1 -P 3306 -u user -p
```

When prompted, enter the password: `password`

#### From Another Docker Container

If you're connecting from another service in the same Docker network, use:

```
Host: mysql_db
Port: 3306
Username: user
Password: password
Database: mydb
```

### Persisting Data

Data is persisted in a Docker volume named `mysql_data`. This means your data will survive container restarts and removals.

## Customization

To modify the default settings, edit the environment variables in the `docker-compose.yaml` file.

To add more initialization scripts, place them in the `init/` directory with a `.sql` extension. They will be executed in alphabetical order when the container is first started.
