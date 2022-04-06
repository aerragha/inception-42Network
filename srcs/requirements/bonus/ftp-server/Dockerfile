FROM alpine:3.15

RUN apk update && apk upgrade && apk add vsftpd openssl

RUN mkdir -p /etc/ssl/private

RUN openssl req -x509 -nodes -days 365 \
            -subj "/C=MA/ST=KH/O=1337, Inc./CN=aerragha" \
            -addext "subjectAltName=DNS:aerragha.42.fr" -newkey rsa:2048 \
            -keyout /etc/ssl/private/vsftpd.pem \
            -out /etc/ssl/private/vsftpd.pem

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY ./tools/script.sh .

ENTRYPOINT ["sh", "script.sh"]