# Dockerize NodeJS and MySQL with Docker Compose&nbsp;[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fnumerica-ideas%2Fcommunity%2Ftree%2Fmaster%2Fdocker%2Fdocker-compose-nodejs-mysql&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://numericaideas.com/blog/docker-compose-nodejs-mysql)

This project and the related article illustrate how to dockerize a **NodeJS** and **MySQL** project using **Docker Compose**.

**Read the related article written by "Orleando Dassi" on the blog**: https://numericaideas.com/blog/docker-compose-nodejs-mysql

## Run

It's a normal **NodeJS** project, so you can run it via `npm start` but Docker Compose takes care of this by linking it to a **MySQL** instance.

## Environment Variables

Provide the following variables in the **.env** file, a copy of [.env.sample](./.env.sample):
- MYSQL_DATABASE
- MYSQL_PASSWORD

## Docker Images

- The project uses the official **MySQL** Docker image available in the [Docker Hub](https://hub.docker.com/_/mysql).
- A [Dockerfile](./Dockerfile) exists to create an image of the NodeJS App.

Build the NodeJS App **image** with: `docker build . `.

## Start Containers

The MySQL service within the `docker-compose.yml` file will use the **environment variables** defined on the top to start MySQL.

Run all the **services** using **Docker Compose** via the command: `docker compose up`.

## Stop Containers

To stop all the running containers, run:
```bash
docker compose down
```

Here's the exact command to stop and remove everything created by **Docker Compose**, talking about the **containers**, **images**, and **networks**:
```bash
docker compose down --rmi all
```
