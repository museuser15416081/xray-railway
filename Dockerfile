FROM alpine:latest
RUN apk add --no-cache ca-certificates curl unzip
RUN curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && unzip -o /tmp/xray.zip -d /usr/bin/ xray && chmod +x /usr/bin/xray && rm /tmp/xray.zip
COPY config.json /usr/local/etc/xray/config.json
COPY --chmod=755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
