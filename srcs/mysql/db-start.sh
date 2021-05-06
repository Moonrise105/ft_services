#!/bin/sh

until mysqladmin ping
do
	sleep 1
done
echo "CREATE DATABASE $DB_NAME;" | mysql -u root --skip-password
echo "CREATE USER '$USER_NAME'@'%' IDENTIFIED BY '$USER_PASSWORD';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$USER_NAME'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

if [ $(mysql -N -s -u root -e \
        "select count(*) from information_schema.tables where \
            table_name='wp_options';") -eq 0 ]; then
        mysql -u root wordpress < wp.sql
fi
