#!/bin/sh

killall mysqld
apk del .build-deps
rm -rf /var/lib/mysql
rm -rf /app/*