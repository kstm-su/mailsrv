#!/bin/sh

postconf -e myhostname=${MAIL_HOST}.${DOMAIN}

postfix start

#loop
tail -f /dev/null
