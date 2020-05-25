########## How To Use Docker Image ###############
##  Image Name: nextoa/fastdfs
##  Git link: https://github.com/melthaw/docker-up/blob/master/images/fastdfs/Dockerfile
##  Docker hub link: https://hub.docker.com/r/nextoa/fastdfs/
##  Build docker image: docker build --no-cache -f Dockerfile -t nextoa/fastdfs --rm=true .
##################################################
# Base Docker image: https://hub.docker.com/r/season/fastdfs/
from season/fastdfs:1.2

RUN apt-get update && \
    apt-get install -y curl wget lsof tree net-tools netcat && \
    # Clean up
    rm -rf /var/lib/apt/lists/*
