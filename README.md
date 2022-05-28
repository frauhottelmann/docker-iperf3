[![Docker Image CI](https://github.com/frauhottelmann/docker-iperf3/actions/workflows/docker-image.yml/badge.svg)](https://github.com/frauhottelmann/docker-iperf3/actions/workflows/docker-image.yml)

# Alpine iperf3 in a docker container

- based on [mlabbe/iperf3](https://github.com/michellabbe/docker-iperf3)
- automatic multiarch builds on GitHub
- based on stable Alpine
- tags correspond to iperf3 version in Alpine

# Docker-compose example

You can add more instances by adding another service.
```yaml
version: "3"

services:
  iperf:
    image: frauhottelmann/docker-iperf3:v3.11-r0
    restart: always
    container_name: iperf3
    ports:
      - "5201:5201"
```
