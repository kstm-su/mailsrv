FROM alpine:latest

RUN set -x && \
    apk update && apk add --no-cache openldap openldap-back-bdb openldap-clients

CMD slapd;tail -f /dev/null
