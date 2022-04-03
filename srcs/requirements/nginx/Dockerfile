FROM alpine:3.15

RUN apk update && apk upgrade && apk add nginx openssl openrc

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 \
            -subj "/C=MA/ST=KH/O=1337, Inc./CN=aerragha" \
            -addext "subjectAltName=DNS:aerragha.42.fr" -newkey rsa:2048 \
            -keyout /etc/nginx/ssl/nginx-selfsigned.key \
            -out /etc/nginx/ssl/nginx-selfsigned.crt
#openssl req -x509 -nodes -days 365 -subj "/C=MA/ST=KH/O=1337, Inc./CN=aerragha" -addext "subjectAltName=DNS:aerragha.42.fr" -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt

RUN openrc
RUN touch /run/openrc/softlevel

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/http.d/default.conf

# tells Nginx to stay in the foreground and not daemonize.
ENTRYPOINT ["nginx", "-g", "daemon off;"]