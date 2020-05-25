########## How To Use Docker Image ###############
##
##  Image Name: nextoa/python
##  Git link: https://github.com/melthaw/docker-up/blob/master/images/python/Dockerfile
##  Docker hub link: https://hub.docker.com/r/nextoa/python/
##  Build docker image: docker build --no-cache -f Dockerfile -t nextoa/python --rm=true .
##  Description: Base image for all python repos with python 2.7 installed
##################################################
# Base Docker image: https://hub.docker.com/_/python/
FROM python:2.7-alpine3.6

LABEL maintainer="melthaw@gmail.com"

RUN apk add --update curl bash lsof && \
    # Clean up
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/*


