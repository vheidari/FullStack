# A Simple Example: Running Multiple Containers through Docker Compose
In this example, the mission is to run a couple of services through  `docker compose`

## A Bit About Docker Compose
`Docker Compose` is an orchestration tool integrated with `Docker Engine`. It allows us to manage multiple containers via a single Docker Compose file.


## How this project work ?
It's simple. we use `docker-compose.yml`file to describe our service and network ant etc ... that we need to bring up.

`Docker Compose` use `docker-compose.yml` file to bring up all service and thier requirement like `network interface`, `file system access`, etc ... .

Inside this project we describe 3 `Nginx Load Balancer` and a `Redis` database with a 2 network interface for each `Load Blancer` and `Redis` database and their configuration.
