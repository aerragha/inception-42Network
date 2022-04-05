FROM alpine:3.15

RUN apk update && apk upgrade && apk add mariadb mariadb-client openrc

RUN openrc
RUN touch /run/openrc/softlevel

COPY ./conf/database.sql .

COPY ./tools/script.sh .

ENTRYPOINT ["sh", "script.sh"]