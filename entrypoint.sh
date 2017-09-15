#!/bin/sh

mkdir -p /etc/nginx/tls

openssl req -batch -new -x509 -days 1024 -nodes -sha256 \
  -subj '/CN=INSECURE/O=INSECURE/C=IO' \
  -out /etc/nginx/tls/self-signed.pem \
  -keyout /etc/nginx/tls/self-signed.key

chown -R nginx /etc/nginx/tls
chmod 400 /etc/nginx/tls/self-signed.*

exec nginx -g "daemon off;"
