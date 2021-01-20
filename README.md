# Alpine iperf3 in a docker container

- based on mlabbe/iperf3 and jnovack/docker-multi-arch-hooks
- automatic multiarch builds on docker hub
- based on stable Alpine
- tags correspond to iperf3 package in Alpine

# Docker-compose example

You can add more instances by adding another service.
´´´´
version: "3"

services:
  iperf:
    image: frauhottelmann/iperf3:3.9-r1
    restart: always
    container_name: iperf3
    ports:
      - "5201:5201"

´´´´
