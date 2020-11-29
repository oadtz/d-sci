#!/bin/bash

if [ -d /mnt/letsencrypt/archive/d-sci.southeastasia.azurecontainer.io ]; then
    cd /mnt/letsencrypt/archive/d-sci.southeastasia.azurecontainer.io
    openssl pkcs12 -export -out d-sci.southeastasia.azurecontainer.io.pfx -inkey privkey1.pem -in fullchain1.pem -password pass:password
fi