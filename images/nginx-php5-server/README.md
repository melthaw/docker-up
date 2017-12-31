# introduction

The following components are installed all-in-one.

* nginx
* php5
* mysql-client

# versioning

name | version
---|---
alphine | 3.4
nginx | 1.13.7
php | 5.6.31
supervisor| 3.2.4
mysql | mariadb-client


## php modules installed

See follow list:

* php5-fpm
* php5-mysqli
* php5-ctype
* php5-sockets
* php5-gd
* php5-gettext
* php5-bcmath
* php5-xmlreader
* php5-ldap
* php5-json

# configuration and customization

module | path | description
---|---|---
nginx | /etc/nginx/nginx.conf |
.  | /etc/nginx/conf.d/ |
php5 | /etc/php5/php-fpm.conf|
.  | /etc/php5/fpm.d/ |
.  | /etc/php5/conf.d/ | customize.ini build-in
supervisord | /etc/supervisor/supervisord.conf|
.  | /etc/supervisor/conf.d/nginx.conf |
.  | /etc/supervisor/conf.d/php-fpm.conf |


# docker

## CMD

The default `CMD` is

> /run_server.sh

What's the `CMD` doing ?

* set env vars
* prepare nginx conf
* start supervisord including
    * nginx
    * php-fpm

## PORT

All the http request will be processed by nginx and the final exposed port is `80`.

Any validated ssl cert (`ssl.crt` & `ssl.key`) found under path `/etc/ssl/nginx`,the nginx ssl will be enabled automatically.
The port `443` is available after the server is started successfully.


## VOLUME

Here is the volume to customize

volume | description
---|---
/etc/ssl/nginx | Any validated ssl cert found under the path , the nginx ssl will be enabled automatically.
/usr/share/myphp/etc | The file nginx.conf & nginx_ssl.conf under this path will be copied to /etc/nginx/conf.d/
/usr/share/myphp/www | The php source files which service the PHP request.

Normally, everything is ready. So just please place your PHP source filed under `/usr/share/myphp/www`.

There are two ways to do this:

* supply your local PHP file as volume
* or package your PHP files as a volume docker and feed it to the PHP server

**Usage 1**:

```yml
version: '2'
services:
  php-server:
    container_name: php-server
    build: .
    ports:
      - '8888:80'
    depends_on:
      - php-content
    volumes:
      - ./sample/www:/usr/share/myphp/www
```

**Usage 2**:

```yml
version: '2'
services:
  php-server:
    container_name: php-server
    build: .
    ports:
      - '8888:80'
    depends_on:
      - php-content
    volumes_from:
      - php-content
  php-content:
    container_name: php-content
    image: busybox:latest
    volumes:
      - ./sample/www:/usr/share/myphp/www

```
