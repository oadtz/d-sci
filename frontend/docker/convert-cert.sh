#!/bin/bash

if [ -d /mnt/letsencrypt/archive/${APP_DOMAIN_NAME} ]; then
    cd /mnt/letsencrypt/archive/${APP_DOMAIN_NAME}
    openssl pkcs12 -export -out ${APP_DOMAIN_NAME}.pfx -inkey privkey1.pem -in fullchain1.pem -password pass:password
fi