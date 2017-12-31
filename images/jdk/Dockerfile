########## How To Use Docker Image ###############
##
##  Image Name: clouthinkin/jdk
##  Git link: https://github.com/melthaw/mini-docker-images/blob/master/jdk/Dockerfile
##  Docker hub link: https://hub.docker.com/r/clouthinkin/jdk/
##  Build docker image: docker build --no-cache -f Dockerfile -t clouthinkin/jdk --rm=true .
##  Description: Base image for all java repos with jdk 8 installed
##################################################
# Base Docker image: https://hub.docker.com/_/openjdk/
FROM openjdk:8-jdk-alpine

LABEL maintainer "melthaw@gmail.com"

RUN apk add --update curl bash lsof && \
    # Clean up
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/*
