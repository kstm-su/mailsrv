FROM alpine:latest

COPY ./run.sh /

#sed -i -e ""  /path/to/file

RUN set -x && \
    apk update && apk add --no-cache postfix postfix-ldap &&\
    postconf -e myorigin='$mydomain' mydestination='$myhostname, localhost.$mydomain, localhost, $mydomain' &&\
    postconf -e smtpd_tls_security_level=may smtpd_tls_cert_file=/common/certs/fullchain.pem smtpd_tls_key_file=/common/certs/privkey.pem &&\
    echo "submission inet n       -       n       -       -       smtpd" >> /etc/postfix/master.cf &&\
    chmod +x /run.sh

CMD /run.sh
