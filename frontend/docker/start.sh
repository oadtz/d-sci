#!/bin/bash

nginx -g "daemon off;" &
if [ ! -d /mnt/letsencrypt/live/${APP_DOMAIN_NAME} ]; then
    echo 'Certificate not found. Trying to get the new ones from letsencrypt'
    certbot certonly --webroot -w /usr/app/public/ -n -d ${APP_DOMAIN_NAME} --agree-tos --email ${APP_EMAIL}
    cp -rf /etc/letsencrypt/* /mnt/letsencrypt/
else
    echo 'Existing certificates found. Trying to renew.'
    mkdir -p /etc/letsencrypt
    cp -rf /mnt/letsencrypt/* /etc/letsencrypt/
    cd /etc/letsencrypt/live/${APP_DOMAIN_NAME}
    ln -s ../../archive/${APP_DOMAIN_NAME}/cert1.pem cert.pem
    ln -s ../../archive/${APP_DOMAIN_NAME}/chain1.pem chain.pem
    ln -s ../../archive/${APP_DOMAIN_NAME}/fullchain1.pem fullchain.pem
    ln -s ../../archive/${APP_DOMAIN_NAME}/privkey1.pem privkey.pem
    certbot renew
fi
mv /etc/nginx/conf.d/ssl.conf.bak /etc/nginx/conf.d/ssl.conf
nginx -s reload
/usr/app/convert-cert.sh

echo '0 12 * * * (/usr/bin/certbot renew && nginx -s reload && /usr/app/convert-cert.sh)' | crontab

cd /usr/app
pm2-runtime start npm -- start