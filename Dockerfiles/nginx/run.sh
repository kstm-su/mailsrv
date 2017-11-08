#!/bin/sh

sed -i -e "s/{DOMAIN}/${DOMAIN}/" /etc/nginx/nginx.conf

if [ ! -e /common/certs/dhparams.pem ]; then openssl dhparam 2048 -out /etc/certs/dhparams.pem; fi
#certbot certonly --standalone --quiet --agree-tos -d "${DOMAIN}" -d "${MAIL_HOST}.${DOMAIN}" -m="${ADMIN_EMAIL}" --reinstall  --dry-run
if [ ! -e /common/certs/privkey.pem ]; then certbot certonly --standalone --quiet --agree-tos -d "${DOMAIN}" -d "${MAIL_HOST}.${DOMAIN}"  -d "chat.${DOMAIN}" -m="${ADMIN_EMAIL}" --reinstall; cp /etc/letsencrypt/live/"${DOMAIN}"/*.pem /common/certs/; fi
echo '0 10 * * 1 root /usr/bin/certbot renew -q --pre-hook "nginx -s stop" --post-hook "nginx" && cp -r "/etc/letsencrypt/live/${DOMAIN}/*.pem" /common/certs/' >> /var/spool/cron/crontabs/root

crond
nginx -g 'daemon off;'
