#!/bin/bash

set +e

# Script trace mode
if [ "${DEBUG_MODE}" == "true" ]; then
    set -o xtrace
fi

# Default timezone for web interface
PHP_TZ=${PHP_TZ:-"Europe/Riga"}

# Default host name for nginx server name
HOST_NAME=${HOST_NAME:-"localhost"}

# myphp's etc directory
MYPHP_ETC_DIR="/usr/share/myphp/etc"

# default nginx conf.d directory
NGINX_CONFD_DIR="/etc/nginx/conf.d"

# the ssl cert store directory
NGINX_SSL_CONFIG="/etc/ssl/nginx"

# the php5 lib directory
PHP_SESSIONS_DIR="/var/lib/php5"

prepare_nginx_server() {

    echo "** Disable default vhosts"
    rm -f $NGINX_CONFD_DIR/*.conf

    echo "** Adding my virtual host (HTTP)"
    if [ -f "$MYPHP_ETC_DIR/nginx.conf" ]; then
        cp $MYPHP_ETC_DIR/nginx.conf $NGINX_CONFD_DIR
    else
        echo "**** Impossible to enable HTTP virtual host"
    fi

    if [ -f "$NGINX_SSL_CONFIG/ssl.crt" ] && [ -f "$NGINX_SSL_CONFIG/ssl.key" ] && [ -f "$NGINX_SSL_CONFIG/dhparam.pem" ]; then
        echo "** Enable SSL support for Nginx"
        if [ -f "$MYPHP_ETC_DIR/nginx_ssl.conf" ]; then
            cp $MYPHP_ETC_DIR/nginx_ssl.conf $NGINX_CONFD_DIR
        else
            echo "**** Impossible to enable HTTPS virtual host"
        fi
    else
        echo "**** Impossible to enable SSL support for Nginx. Certificates are missed."
    fi

    if [ -d "/var/log/nginx/" ]; then
        ln -sf /dev/fd/2 /var/log/nginx/error.log
    fi

    ln -sf /dev/fd/2 /var/log/php5-fpm.log
}

prepare_nginx_server

echo "########################################################"

echo "** Executing supervisord"
exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf

echo "########################################################"
