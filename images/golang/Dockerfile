########## How To Use Docker Image ###############
##
##  Image Name: clouthinkin/golang
##  Git link: https://github.com/melthaw/mini-docker-images/blob/master/golang/Dockerfile
##  Docker hub link: https://hub.docker.com/r/clouthinkin/golang/
##  Build docker image: docker build --no-cache -f Dockerfile -t clouthinkin/golang --rm=true .
##  Description: Base image for all golang repos with golang 1.8.4 installed
##################################################
# Base Docker image: https://hub.docker.com/_/golang/
FROM golang:1.8.4-alpine3.6

LABEL maintainer "melthaw@gmail.com"

RUN apk add --update curl bash lsof && \
    # Clean up
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/*


