FROM alpine:3.15

RUN apk update && apk upgrade && apk add mariadb mariadb-client openrc

COPY ./tools/run.sh .

# ENTRYPOINT ["sh", "run.sh"]
ENTRYPOINT ["tail", "-f", "/dev/null"]