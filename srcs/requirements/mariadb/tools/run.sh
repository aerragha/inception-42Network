#!/bin/ash

apk update && apk upgrade && apk add mariadb mariadb-client openrc

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then
	
	chown -R mysql:mysql /var/lib/mysql

	# init database
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
fi





# apk update && apk upgrade && apk add mariadb mariadb-client openrc

# mkdir -p /run/openrc/
# touch /run/openrc/softlevel

# /usr/bin/mysql_install_db --user=mysql
# /usr/bin/mysqld_safe --datadir="/var/lib/mysql"