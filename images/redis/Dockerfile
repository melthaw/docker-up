########## How To Use Docker Image ###############
##
##  Image Name: nextoa/redis
##  Git link: https://github.com/melthaw/docker-up/blob/master/images/redis/Dockerfile
##  Docker hub link: https://hub.docker.com/r/nextoa/redis/
##  Build docker image: docker build --no-cache -f Dockerfile -t nextoa/redis --rm=true .
##  Description: Base image for all redis repos with redis 2.7 installed
##################################################
# Base Docker image: https://hub.docker.com/_/redis/
FROM redis:alpine

LABEL maintainer="melthaw@gmail.com"

RUN apk add --update curl bash lsof && \
    # Clean up
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/*


