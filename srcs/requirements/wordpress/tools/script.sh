#!/bin/sh

sed -i 's|DATABASE_NAME|'${MYSQL_DATABASE}'|g' /wordpress/wp-config.php
sed -i 's|DATABASE_USER|'${MYSQL_USER}'|g' /wordpress/wp-config.php
sed -i 's|DATABASE_PASS|'${MYSQL_PASSWORD}'|g' /wordpress/wp-config.php
sed -i 's|DATABASE_HOST|'${DB_HOST}'|g' /wordpress/wp-config.php

# Copy Folder of WordPress to mounted volume
cp -r /wordpress/* /var/www/html/wordpress/

# This is a variant of PHP that will run in the background as a daemon, listening for CGI requests.
php-fpm7 -FR