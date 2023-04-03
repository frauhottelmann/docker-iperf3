FROM alpine:3.17.3

ARG APPLICATION="docker-iperf3"
ARG BUILD_RFC3339="1970-01-01T00:00:00Z"
ARG REVISION="local"
ARG DESCRIPTION="Alpine iperf3 in a Docker container"
ARG PACKAGE="frauhottelmann/docker-iperf3"
ARG VERSION="3.12-r0"

STOPSIGNAL SIGKILL

LABEL org.opencontainers.image.ref.name="${PACKAGE}" \
      org.opencontainers.image.created=$BUILD_RFC3339 \
      org.opencontainers.image.authors="frauhottelmann" \
      org.opencontainers.image.documentation="https://github.com/${PACKAGE}/README.md" \
      org.opencontainers.image.description="${DESCRIPTION}" \
      org.opencontainers.image.licenses="GPLv3" \
      org.opencontainers.image.source="https://github.com/${PACKAGE}" \
      org.opencontainers.image.revision=$REVISION \
      org.opencontainers.image.version=$VERSION \
      org.opencontainers.image.url="https://hub.docker.com/r/${PACKAGE}/"

ENV \
      APPLICATION="${APPLICATION}" \
      BUILD_RFC3339="${BUILD_RFC3339}" \
      REVISION="${REVISION}" \
      DESCRIPTION="${DESCRIPTION}" \
      PACKAGE="${PACKAGE}" \
      VERSION="${VERSION}"

RUN apk add --no-cache iperf3=3.12-r0 \
    && adduser -S iperf

USER iperf

EXPOSE 5201/tcp 5201/udp

ENTRYPOINT ["iperf3"]

CMD ["-s"]
