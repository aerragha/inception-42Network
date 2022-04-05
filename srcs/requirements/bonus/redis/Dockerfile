FROM alpine:3.15

RUN apk update && apk upgrade && apk add redis

COPY ./tools/script.sh .

ENTRYPOINT ["sh", "script.sh"]