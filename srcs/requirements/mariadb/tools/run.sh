#!/bin/sh

# mkdir -p /run/openrc/
# touch /run/openrc/softlevel

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ];
then
	/etc/init.d/mariadb setup
	/etc/init.d/mariadb start

	# mysql -u ${MYSQL_ROOT} < data.sql
	# rm data.sql
	mysql -u ${MYSQL_ROOT} -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
	mysql -u ${MYSQL_ROOT} -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

	mysql -u ${MYSQL_ROOT} -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
	mysql -u ${MYSQL_ROOT} -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

	mysql -u ${MYSQL_ROOT} -e "ALTER USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
	mysql -u ${MYSQL_ROOT} -e "ALTER USER '${MYSQL_ROOT}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
fi
rc-service mariadb start
rc-service mariadb stop
/usr/bin/mariadbd --basedir=/usr --datadir=/var/lib/mysql --plugin-dir=/usr/lib/mariadb/plugin --user=mysql --pid-file=/run/mysqld/mariadb.pid