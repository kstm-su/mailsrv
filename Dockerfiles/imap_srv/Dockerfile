FROM alpine:latest


RUN set -x && \
    apk update && apk add --no-cache dovecot dovecot-ldap &&\


CMD dovecot

#/etc/dovecot/conf.d/10-ssl.conf
#ssl_cert = </etc/letsencrypt/live/YOURSITE/fullchain.pem
#ssl_key = </etc/letsencrypt/live/YOURSITE/privkey.pem
