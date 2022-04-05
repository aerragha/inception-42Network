FROM alpine:3.15

RUN apk update && apk upgrade && apk add wget openrc unzip \
    php7-common \
    php7-iconv \
    php7-json \
    php7-curl \
    php7-xml \
    php7-mysqli \
    php7-imap \
    php7-cgi \
    fcgi \
    php7-pdo \
    php7-pdo_mysql \
    php7-soap \
    php7-xmlrpc \
    php7-posix \
    php7-mcrypt \
    php7-gettext \
    php7-ldap \
    php7-ctype \
    php7-dom \
    php7 \
    php7-fpm \
    php7-opcache \
    php7-session \
    php7-mbstring \
    php7-gd \
    php7-zlib \
    php7-redis


# Download wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xvf latest.tar.gz
RUN rm latest.tar.gz

# Download Redis Object Cache plugin
RUN wget https://downloads.wordpress.org/plugin/redis-cache.2.0.23.zip
RUN unzip redis-cache.2.0.23.zip
RUN rm -rf redis-cache.2.0.23.zip

COPY conf/wp-config.php /wordpress/wp-config.php
COPY ./conf/www.conf /etc/php7/php-fpm.d/www.conf

# For cash part
COPY conf/object-cache.php /wordpress/wp-content/object-cache.php

RUN openrc
RUN touch /run/openrc/softlevel

COPY ./tools/script.sh .

ENTRYPOINT ["sh", "script.sh"]