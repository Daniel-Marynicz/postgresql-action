# PostgreSQL GitHub Action

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/Daniel-Marynicz/postgresql-action/blob/master/LICENSE)
![Test postgresql-action](https://github.com/Daniel-Marynicz/postgresql-action/workflows/Test%20postgresql-action/badge.svg)

Setups PostgreSQL database  with unprivileged postgres user and PostgreSQL extensions.

## Inputs

### `postgres_image_tag`

**Optional** Docker postgres image tag for available image tags please follow 
[https://hub.docker.com/_/postgres](https://hub.docker.com/_/postgres)
* Default value:  `latest`

### `postgres_image_name`

**Optional** Docker postgres image name if not using 
[https://hub.docker.com/_/postgres](https://hub.docker.com/_/postgres)
* Default value:  `postgres`

### `postgres_user` 

* POSTGRES_USER - create the user with the superuser power
* Default value:  `postgres`

### `postgres_db`

* POSTGRES_DB - postgres database
* Default value:  `postgres`

### `postgres_password`

* POSTGRES_PASSWORD - superuser password
* Default value:  `postgres`

### `postgres_extensions`

* POSTGRES_EXTENSIONS - List of postgres extensions separated by space to install in template1 database.
* Default value is empty
* Example: `uuid-ossp ltree`

### `app_user`

* APP_USER - unprivileged postgres user
* Default value: `app`

### `app_user_password`

* APP_PASSWORD_USER - password for unprivileged postgres user
* Default value: `app`

### `app_db`

* APP_DB - database or list of databases separated by space for unprivileged postgres user
* Default value: `app`
* Example: `app1 app2 app3`

### `exposed_postgres_port`

* EXPOSED_POSTGRES_PORT - exposed postgres port
* Default value: `5432`


## Example usage

```yaml
- name: Setup Postgres database
  uses: Daniel-Marynicz/postgresql-action@master
  with:
    postgres_image_tag: 12-alpine
    app_user: app
    app_user_password: develop
    app_db: app app2 app3 app4
    postgres_extensions: uuid-ossp ltree    
```

