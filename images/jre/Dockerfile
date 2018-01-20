########## How To Use Docker Image ###############
##
##  Image Name: clouthinkin/jre
##  Git link: https://github.com/melthaw/docker-up/blob/master/images/jre/Dockerfile
##  Docker hub link: https://hub.docker.com/r/clouthinkin/jre/
##  Build docker image: docker build --no-cache -f Dockerfile -t clouthinkin/jre --rm=true .
##  Description: Base image for all java repos with jre 8 installed
##################################################
# Base Docker image: https://hub.docker.com/_/openjdk/
FROM openjdk:8-jre-alpine

LABEL maintainer "melthaw@gmail.com"

RUN apk add --update curl bash lsof && \
    # Clean up
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/*
