FROM ubuntu:14.04
MAINTAINER CobiYu <gudghks0825@naver.com>

# package manager update
RUN apt-get update
RUN apt-get upgrade

# git install
RUN apt-get install -y git
# apache install
RUN apt-get install -y apache2
# php install
RUN apt-get install -y php5
# mysql install
RUN { \
        echo mysql-server mysql-server/root_password password you2781''; \
        echo mysql-server mysql-server/root_password_again password you2781''; \
    } | debconf-set-selections \
    && apt-get install -y mysql-server

# php, mysql connect
RUN apt-get install php5-mysql

# Cobi-Board initialize
RUN rm -rf /var/www/*
RUN git clone https://github.com/Cobi-Yu/CobiBoard.git /var/www/html

# open port
EXPOSE 80
EXPOSE 8080
EXPOSE 3306

# set entrypoint
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# service start
ENTRYPOINT service mysql start && service apache2 start && /bin/bash
