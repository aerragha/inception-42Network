FROM alpine:3.15

RUN apk update && apk upgrade && apk add mariadb mariadb-client openrc
RUN openrc && touch /run/openrc/softlevel

# COPY ./conf/data.sql .
COPY ./tools/script.sh .

ENTRYPOINT ["sh", "script.sh"]