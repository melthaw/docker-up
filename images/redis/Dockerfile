########## How To Use Docker Image ###############
##
##  Image Name: clouthinkin/redis
##  Git link: https://github.com/melthaw/docker-up/blob/master/images/redis/Dockerfile
##  Docker hub link: https://hub.docker.com/r/clouthinkin/redis/
##  Build docker image: docker build --no-cache -f Dockerfile -t clouthinkin/redis --rm=true .
##  Description: Base image for all redis repos with redis 2.7 installed
##################################################
# Base Docker image: https://hub.docker.com/_/redis/
FROM redis:alpine

LABEL maintainer="melthaw@gmail.com"

RUN apk add --update curl bash lsof && \
    # Clean up
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/*


