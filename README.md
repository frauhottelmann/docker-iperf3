[![Docker Image CI](https://github.com/frauhottelmann/docker-iperf3/actions/workflows/docker-image.yml/badge.svg)](https://github.com/frauhottelmann/docker-iperf3/actions/workflows/docker-image.yml)

# Alpine iperf3 in a Docker container

- based on [mlabbe/iperf3](https://github.com/michellabbe/docker-iperf3)
- iperf3 from the stable Alpine repositories
- runs as an unprivileged user (UID/GID 1000)
- multi-arch images for `linux/amd64`, `linux/arm64`, `linux/arm/v7` and `linux/arm/v6`
- built, smoke-tested and scanned for vulnerabilities on GitHub Actions

## Image tags

Images are published to `ghcr.io/frauhottelmann/iperf3`.

| Tag | Built from |
| --- | --- |
| `latest` | the most recent release (git tag) |
| `3.20.0`, `3.20`, `3` | a release, named after the iperf3 version in Alpine |
| `edge` | the latest commit on `master`, rebuilt weekly for Alpine security fixes |
| `sha-<commit>` | a specific commit on `master` |

## Server

```sh
docker run -d --name iperf3 -p 5201:5201/tcp -p 5201:5201/udp ghcr.io/frauhottelmann/iperf3:latest
```

The container runs `iperf3 -s` by default. Any arguments replace that, e.g.
`... ghcr.io/frauhottelmann/iperf3:latest -s -p 5202` for another port.

## Client

```sh
docker run --rm ghcr.io/frauhottelmann/iperf3:latest -c <server> -t 10
```

## Docker Compose example

```yaml
name: iperf3
services:
  iperf:
    image: ghcr.io/frauhottelmann/iperf3:latest
    restart: unless-stopped
    ports:
      - 5201:5201/tcp
      - 5201:5201/udp
    read_only: true
    tmpfs:
      - /tmp  # iperf3 keeps its test buffers in a temporary file
    cap_drop:
      - ALL
    security_opt:
      - no-new-privileges:true
```

To run several servers, add more services with a different host port each
(e.g. `5202:5201/tcp`).

## Notes

- **Accurate measurements:** Docker's port mapping (NAT, userland proxy) can
  cost throughput, especially for UDP at high rates. For the most accurate
  results use `network_mode: host` (`--network host`) and drop the `ports`
  section.
- iperf3 serves one test at a time. A second client gets "the server is busy"
  until the running test has finished.
