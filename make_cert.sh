#!/bin/sh

set -e

DOMAIN=example.com

openssl genrsa -des3 -passout pass:x -out ${DOMAIN}.pass.key 2048

openssl rsa -passin pass:x -in ${DOMAIN}.pass.key -out ${DOMAIN}.key

rm ${DOMAIN}.pass.key

openssl req -new -key ${DOMAIN}.key -out ${DOMAIN}.csr

openssl x509 -req -sha256 -days 365 -in ${DOMAIN}.csr -signkey ${DOMAIN}.key -out ${DOMAIN}.crt

