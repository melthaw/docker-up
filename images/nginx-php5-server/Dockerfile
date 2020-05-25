########## How To Use Docker Image ###############
##
##  Image Name: nextoa/nginx-php5-server
##  Git link: https://github.com/melthaw/docker-up/blob/master/images/nginx-php5-server/Dockerfile
##  Docker hub link: https://hub.docker.com/r/nextoa/nginx-php5-server/
##  Build docker image: docker build --no-cache -f Dockerfile -t nextoa/nginx-php5-server --rm=true .
##  Description: Base image for php runtime server with nginx 1.13.7 & php 5.6.31 & mysql client installed and everything is configured.
##
##################################################
# Base Docker image:
FROM alpine:3.4

LABEL maintainer "melthaw <melthaw@gmail.com>"

ARG APK_FLAGS_COMMON="-q"
ARG APK_FLAGS_PERSISTANT="${APK_FLAGS_COMMON} --clean-protected --no-cache"
ARG APK_FLAGS_DEV="${APK_FLAGS_COMMON} --no-cache"

ENV TERM=xterm

ENV HOST_NAME=localhost
ENV PHP_TZ=Europe/Riga

ENV NGINX_VERSION=1.13.7
ENV PHP_VERSION=5.6.31

RUN addgroup -S nginx && \
    adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx && \
    mkdir -p /usr/share/myphp && \
    chown --quiet -R nginx:root /usr/share/myphp && \
    apk update && \
    apk add ${APK_FLAGS_PERSISTANT} \
            supervisor \
            bash \
            mariadb-client-libs \
            mariadb-client \
            nginx \
            php5-fpm \
            php5-mysqli \
            php5-ctype \
            php5-sockets \
            php5-gd \
            php5-gettext \
            php5-bcmath \
            php5-xmlreader \
            php5-ldap \
            php5-json \
            ttf-dejavu && \
    rm -rf /var/cache/apk/*

ADD container_files/etc/ /etc/
ADD container_files/usr/ /usr/
ADD container_files/scripts/ /

RUN apk add ${APK_FLAGS_DEV} --virtual build-dependencies \
            coreutils \
            gettext && \
    apk del ${APK_FLAGS_COMMON} --purge \
            build-dependencies && \
    rm -rf /var/cache/apk/*

RUN chmod +x /*.sh

WORKDIR /usr/share/myphp

EXPOSE 80/TCP 443/TCP

VOLUME ["/etc/ssl/nginx","/usr/share/myphp"]

ENTRYPOINT ["/bin/bash"]

CMD ["/run_server.sh"]
