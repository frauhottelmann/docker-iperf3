# Alpine iperf3 in a docker container

- based on [mlabbe/iperf3](https://github.com/michellabbe/docker-iperf3) and [jnovack/docker-multi-arch-hooks](https://github.com/jnovack/docker-multi-arch-hooks)
- automatic multiarch builds on docker hub
- based on stable Alpine
- tags correspond to iperf3 package in Alpine

# Docker-compose example

You can add more instances by adding another service.
```yaml
version: "3"

services:
  iperf:
    image: frauhottelmann/docker-iperf3:v3.9-r1
    restart: always
    container_name: iperf3
    ports:
      - "5201:5201"
```
