## Requirements

Start PostgreSQL and pgAdmin

Created network for connecting two docker containers
```shell
docker network create postgres-network;
```

docker run the DB PostgreSQL (--name pg - this name of PC, theanurin/devel.postgres-13 in DockerHub)
```shell
docker run --network postgres-network --name pg --interactive --tty --rm --publish 5432:5432 theanurin/devel.postgres-13; 
```

docker run the pgAdmin 
```shell
docker run --network postgres-network --name pgadmin --interactive --tty --rm --publish 8081:80 --env 'PGADMIN_DEFAULT_EMAIL=user@domain.com' --env 'PGADMIN_DEFAULT_PASSWORD=SuperSecret' dpage/pgadmin4
```
(browser listening port 8081,
port 8081 we can assign this port ourselves,
port 80 - assign developers of pgAdmin, --name pg, this is host name)


## Getting started

* Log in pgAdmin
* In pgAdmin create a table, for example:
```shell
CREATE TABLE customers
(
    Id SERIAL PRIMARY KEY,
    FirstName CHARACTER VARYING(30),
    LastName CHARACTER VARYING(30),
    Age INTEGER
);
```
* Using main.dart for insert and select table data
