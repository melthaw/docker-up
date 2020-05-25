########## How To Use Docker Image ###############
##
##  Image Name: clouthinkin/nginx-webdav
##  Git link: https://github.com/melthaw/docker-up/blob/master/images/nginx-webdav/Dockerfile
##  Docker hub link: https://hub.docker.com/r/clouthinkin/nginx-webdav/
##  Build docker image: docker build --no-cache -f Dockerfile -t clouthinkin/nginx-webdav --rm=true .
##  Description: Nginx with webdav module installed.
##
##################################################
# Base Docker image: ubuntu:trusty
FROM ubuntu:trusty

LABEL maintainer "melthaw <melthaw@gmail.com>"

RUN apt-get update && apt-get install -y nginx nginx-extras apache2-utils

VOLUME /media
EXPOSE 80
COPY etc/nginx/conf.d/webdav.conf /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-enabled/*

COPY docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh
CMD /docker-entrypoint.sh && nginx -g "daemon off;"
