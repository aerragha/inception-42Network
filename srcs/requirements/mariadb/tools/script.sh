#!/bin/sh

# mkdir -p /run/openrc/
# touch /run/openrc/softlevel

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
	/etc/init.d/mariadb setup
	/etc/init.d/mariadb start

	mysql -u ${MYSQL_ROOT} < database.sql

	# User with privileges to all databases
	mysql -u ${MYSQL_ROOT} -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
	mysql -u ${MYSQL_ROOT} -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

	# User with privileges to wordpress databases
	mysql -u ${MYSQL_ROOT} -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
	mysql -u ${MYSQL_ROOT} -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

	# Flush privileges will reloads the grant tables in the mysql database enabling the changes to take effect without reloading or restarting mysql service.
	mysql -u ${MYSQL_ROOT} -e "FLUSH PRIVILEGES;"
fi

sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb restart
rc-service mariadb stop

# Stay in the foreground 
/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid
