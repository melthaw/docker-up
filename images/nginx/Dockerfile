########## How To Use Docker Image ###############
##
##  Image Name: clouthinkin/nginx
##  Git link: https://github.com/melthaw/mini-docker-images/blob/master/images/nginx/Dockerfile
##  Docker hub link: https://hub.docker.com/r/clouthinkin/nginx/
##  Build docker image: docker build --no-cache -f Dockerfile -t clouthinkin/nginx --rm=true .
##  Description: Base image for nginx with tools
##
##################################################
# Base Docker image: https://hub.docker.com/_/nginx/
FROM nginx:1.13.7-alpine

LABEL maintainer="melthaw@gmail.com"

RUN apk add --update curl bash lsof && \
    # Clean up
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/*
