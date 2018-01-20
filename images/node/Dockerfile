########## How To Use Docker Image ###############
##
##  Image Name: clouthinkin/node
##  Git link: https://github.com/melthaw/docker-up/blob/master/images/node/Dockerfile
##  Docker hub link: https://hub.docker.com/r/clouthinkin/node/
##  Build docker image: docker build --no-cache -f Dockerfile -t clouthinkin/node --rm=true .
##  Description: Base image for nodejs with node 8 installed
##################################################
# Base Docker image: https://hub.docker.com/r/mhart/alpine-node/
FROM mhart/alpine-node:8

LABEL maintainer "melthaw@gmail.com"

RUN apk add --update curl bash lsof && \
    # Clean up
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/*
