FROM alpine:3

# iperf3 version from the Alpine repositories. "~=" accepts any package
# revision (e.g. 3.20-r0, 3.20-r1), so Alpine rebuilds don't break the build.
# Keep this in sync with the git tag of a release.
ARG IPERF3_VERSION=3.20

RUN apk add --no-cache "iperf3~=${IPERF3_VERSION}" \
    && addgroup -S -g 1000 iperf \
    && adduser -S -D -H -u 1000 -G iperf -s /sbin/nologin iperf

USER 1000:1000

EXPOSE 5201/tcp 5201/udp

ENTRYPOINT ["iperf3"]

CMD ["-s"]
