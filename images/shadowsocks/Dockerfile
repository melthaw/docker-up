########## How To Use Docker Image ###############
##
##  Image Name: nextoa/shadowsocks
##  Build Scripts: docker build -t nextoa/shadowsocks:latest --rm=true .
##  Image link: https://github.com/melthaw/docker-up/blob/images/shadowsocks
##
##################################################
FROM ubuntu:14.04

ENV VPN_PASSWORD "Change_me"
ENV VPN_PORT "6187"

COPY runtime/shadowsocks.json /etc/shadowsocks.json
COPY container-files/docker-entrypoint.sh /docker-entrypoint.sh

RUN apt-get -y update && \
    apt-get install -y lsof wget telnet python-pip python-m2crypto && \
    pip install shadowsocks && \
    chmod o+x /*.sh && \
    rm -rf /var/cache/* && \
    rm -rf /tmp/* /var/tmp/* 

EXPOSE ${VPN_PORT}

ENTRYPOINT /docker-entrypoint.sh
