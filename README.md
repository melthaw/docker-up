# Overview

The toolkits for docker devops.

* Minmized images based on alpine image.
* Scripts to simplify docker backup & restore.


## Minmized images

[mini docker @ docker hub](https://hub.docker.com/u/clouthinkin/)

All based on the mini alpine image and add following supports:
* bash
* curl
* lsof

And the version is

IMAGE NAME | VERSION
---|---
clouthinkin/jdk8 | jdk 8
clouthinkin/jre8 | jre 8
clouthinkin/golang | golang 1.8.4
clouthinkin/node | node 8
clouthinkin/python | python 2.7
clouthinkin/nginx | nginx 1.13.7
clouthinkin/redis | redis 4.0.2 
clouthinkin/networking | ubuntu 16.04 + traceroute + bridge-utils + uml-utilities + tcpdump

### nginx + php 5 + mysql client

Please see [Guide](images/nginx-php5-server/README.md)


## Helpful scripts

category | features
---|---
mongodb | export(backup)
 . | restore
mysql | export(backup)
 . | restore

