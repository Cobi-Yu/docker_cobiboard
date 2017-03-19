#!/bin/bash
mysql -uroot -pyou2781 < /var/www/html/board_query.sql
a2enmod rewrite
