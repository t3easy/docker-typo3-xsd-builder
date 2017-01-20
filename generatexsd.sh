#!/bin/sh

for version in $*
do
    db=typo3_$(echo ${version} | tr '.' '_')
    cd /app/${version}/
    composer install
    vendor/bin/typo3cms install:setup --non-interactive \
        --database-user-name="root" \
        --database-host-name="127.0.0.1" \
        --database-port="3306" \
        --database-name="${db}" \
        --admin-user-name="admin" \
        --admin-password="password" \
        --site-name="XSD Builder" \
        --site-setup-type="site"
    vendor/bin/typo3cms documentation:generatexsd \
        --php-namespace="TYPO3\CMS\Fluid\ViewHelpers" \
        --xsd-namespace="https://typo3.org/ns/typo3/cms-fluid/${version}/ViewHelpers" \
        --target-file="/xsd/typo3.cms-fluid.${version}.xsd"
done