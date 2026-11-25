#!/bin/sh
set -eu
: "${UUID:?Set UUID env var}"
: "${WSPATH:=/ray}"
PORT="${PORT:-8080}"
sed -i "s|__UUID__|${UUID}|g; s|__PORT__|${PORT}|g; s|__WSPATH__|${WSPATH}|g" /usr/local/etc/xray/config.json
exec xray run -config /usr/local/etc/xray/config.json
