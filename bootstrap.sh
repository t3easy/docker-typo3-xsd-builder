#!/bin/sh

apk add --no-cache --virtual .build-deps \
        mariadb \
        mariadb-client \
        libxml2-dev

mysql_install_db --user=mysql
/usr/bin/mysqld_safe --user=mysql --datadir='/var/lib/mysql' --port=3306 --no-watch
docker-php-ext-install mbstring mysqli soap zip
