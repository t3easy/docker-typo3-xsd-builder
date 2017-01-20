#!/bin/sh

killall mysqld
apk del .build-deps
composer clear-cache
rm -rf /var/lib/mysql
rm -rf /app/*