FROM ghcr.io/xtls/xray-core:latest AS xray
FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=xray /usr/bin/xray /usr/bin/xray
COPY config.json /usr/local/etc/xray/config.json
COPY --chmod=755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
