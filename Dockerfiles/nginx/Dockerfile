FROM nginx:mainline-alpine

COPY ./run.sh /
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./html/ /usr/share/nginx/html/


RUN set -x &&\
    apk update && apk add --no-cache certbot openssl &&\
    chmod +x /run.sh

CMD /run.sh
