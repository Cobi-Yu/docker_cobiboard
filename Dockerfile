FROM ubuntu:14.04
MAINTAINER CobiYu <gudghks0825@naver.com>

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y git
RUN apt-get install -y apache2
RUN apt-get install -y php5

RUN { \
        echo mysql-server mysql-server/root_password password you2781''; \
        echo mysql-server mysql-server/root_password_again password you2781''; \
    } | debconf-set-selections \
    && apt-get install -y mysql-server

RUN rm -rf /var/www/*
RUN git clone https://github.com/Cobi-Yu/CobiBoard.git /var/www/html

RUN apt-get install php5-mysql

EXPOSE 80
EXPOSE 8080
EXPOSE 3306

ENTRYPOINT service mysql start && service apache2 start && /bin/bash

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT service mysql start && service apache2 start && /bin/bash
