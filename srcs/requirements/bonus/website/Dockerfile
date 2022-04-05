FROM alpine:3.15

RUN apk update && apk upgrade && apk add npm

RUN npm i -g serve

COPY tools website

CMD serve -s website/ -p 3001