########## How To Use Docker Image ###############
##
##  Image Name: clouthinkin/jdk
##  Git link: https://github.com/melthaw/docker-up/blob/master/images/jdk/Dockerfile
##  Docker hub link: https://hub.docker.com/r/clouthinkin/jdk/
##  Build docker image: docker build --no-cache -f Dockerfile -t clouthinkin/jdk8 --rm=true .
##  Description: Base image for all java repos with jdk 8 installed
##################################################
# Base Docker image: https://hub.docker.com/_/openjdk/
FROM openjdk:8u212-b04-jdk-stretch

LABEL maintainer="melthaw@gmail.com"

RUN apt-get update
RUN apt-get install -y curl netcat-openbsd net-tools vim htop jq
RUN apt-get autoclean
RUN apt-get clean

ADD wait_for.sh /
RUN chmod + /*.sh
