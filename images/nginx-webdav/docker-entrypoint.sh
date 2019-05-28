FROM ubuntu:trusty

RUN apt-get update && apt-get install -y nginx nginx-extras apache2-utils

VOLUME /media
EXPOSE 80
EXPOSE 443

COPY webdav.conf /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/sites-enabled/*

COPY docker-entrypoint.sh /
RUN chmod +x entrypoint.sh
CMD /docker-entrypoint.sh && nginx -g "daemon off;"