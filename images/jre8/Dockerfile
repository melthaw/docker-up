########## How To Use Docker Image ###############
##
##  Image Name: nextoa/jre
##  Git link: https://github.com/melthaw/docker-up/blob/master/images/jre/Dockerfile
##  Docker hub link: https://hub.docker.com/r/nextoa/jre/
##  Build docker image: docker build --no-cache -f Dockerfile -t nextoa/jre8 --rm=true .
##  Description: Base image for all java repos with jre 8 installed
##################################################
# Base Docker image: https://hub.docker.com/_/openjdk/
FROM openjdk:8u212-jdk-alpine

LABEL maintainer="melthaw@gmail.com"

RUN apk add --update curl bash lsof tree && \
    # Clean up
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/*

RUN java -version 2>&1 | grep "1.8" && \
    which curl && which bash && which lsof && which tree

ADD wait_for.sh /
RUN chmod + /*.sh
