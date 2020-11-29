#!/bin/bash

nginx -g "daemon off;" &
if [ ! -d /mnt/letsencrypt/live/d-sci.southeastasia.azurecontainer.io ]; then
    echo 'Certificate not found. Trying to get the new ones from letsencrypt'
    certbot certonly --webroot -w /usr/app/public/ -n -d d-sci.southeastasia.azurecontainer.io --agree-tos --email ${APP_EMAIL}
    cp -rf /etc/letsencrypt/* /mnt/letsencrypt/
else
    echo 'Existing certificates found. Trying to renew.'
    mkdir -p /etc/letsencrypt
    cp -rf /mnt/letsencrypt/* /etc/letsencrypt/
    cd /etc/letsencrypt/live/d-sci.southeastasia.azurecontainer.io
    ln -s ../../archive/d-sci.southeastasia.azurecontainer.io/cert1.pem cert.pem
    ln -s ../../archive/d-sci.southeastasia.azurecontainer.io/chain1.pem chain.pem
    ln -s ../../archive/d-sci.southeastasia.azurecontainer.io/fullchain1.pem fullchain.pem
    ln -s ../../archive/d-sci.southeastasia.azurecontainer.io/privkey1.pem privkey.pem
    certbot renew
fi
mv /etc/nginx/conf.d/ssl.conf.bak /etc/nginx/conf.d/ssl.conf
nginx -s reload
/usr/app/convert-cert.sh

echo '0 12 * * * (/usr/bin/certbot renew && nginx -s reload && /usr/app/convert-cert.sh)' | crontab

cd /usr/app
pm2-runtime start npm -- start