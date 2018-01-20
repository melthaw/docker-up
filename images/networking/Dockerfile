########## How To Use Docker Image ###############
##  Image Name: clouthinkin/network
##  Git link: https://github.com/melthaw/docker-up/blob/master/images/networking/Dockerfile
##  Docker hub link: https://hub.docker.com/r/clouthinkin/networking/
##  Build docker image: docker build --no-cache -f Dockerfile -t clouthinkin/networking --rm=true .
##  Description: unbuntu + traceroute + brctl+ tcpdump
##################################################
# Base Docker image: https://hub.docker.com/_/ubuntu/
from ubuntu:16.04

LABEL maintainer "melthaw@gmail.com"

ARG APT_FLAGS_COMMON="-qq -y"
ARG APT_FLAGS_PERSISTANT="${APT_FLAGS_COMMON} --no-install-recommends"
ARG APT_FLAGS_DEV="${APT_FLAGS_COMMON} --no-install-recommends"

RUN apt-get -y update && \
    apt-get -y install wget curl bash lsof traceroute bridge-utils uml-utilities tcpdump && \
    apt-get -y autoremove 1>/dev/null && \
    rm -rf /var/lib/apt/lists/*
