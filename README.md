/etc/apache2/apache2.conf 수정
<Directory /var/www/>
        Options Indexes FollowSymLinks
        AllowOverride None  --> AllowOverride ALL
        Require all granted
</Directory>

apache2 restart

