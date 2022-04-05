#!/bin/sh

# Edit Database config
sed -i 's|DATABASE_NAME|'${MYSQL_DATABASE}'|g' /wordpress/wp-config.php
sed -i 's|DATABASE_USER|'${MYSQL_USER}'|g' /wordpress/wp-config.php
sed -i 's|DATABASE_PASS|'${MYSQL_PASSWORD}'|g' /wordpress/wp-config.php
sed -i 's|DATABASE_HOST|'${DB_HOST}'|g' /wordpress/wp-config.php
# Edit cache config
sed -i 's|DOMAIN_NAME|'${DOMAIN_NAME}'|g' /wordpress/wp-config.php
sed -i 's|REDIS__HOST|'${REDIS__HOST}'|g' /wordpress/wp-config.php
sed -i 's|NONCE__SALT|'${NONCE__SALT}'|g' /wordpress/wp-config.php

# Copy wordpress files to the volume
cp -r /wordpress/* /var/www/html/wordpress/

# Copy wordpress files to the volume
cp -r redis-cache/ /wordpress/wp-content/plugins/

# Force to stay in foreground 
php-fpm7 -F -R