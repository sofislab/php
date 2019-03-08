FROM alpine:3.6
LABEL AUTOR="MARTIN VILCHE"
RUN apk add --update busybox-suid curl tzdata apache2 php5-dom php5 php5-cli php5-apache2 php5-opcache php5-json php5-mcrypt php5-curl php5-pdo_mysql php5-mysql php5-xml php5-openssl php5-ldap php5-gd php5-soap php5-pear php5-dev php5-intl php5-common php5-phar php5-xsl php5-imap && \
sed -i -e "s/^Listen 80/Listen 8080/" /etc/apache2/httpd.conf && sed -ri -e 's!^(\s*ErrorLog)\s+\S+!\1 /proc/self/fd/2!g' /etc/apache2/httpd.conf && \
sed -i -e "s/^short_open_tag = Off/short_open_tag = On/" /etc/php5/php.ini && \
sed -i -e "s/^post_max_size = 8M/post_max_size = 40M/" /etc/php5/php.ini && \
sed -i -e "s/^upload_max_filesize = 2M/upload_max_filesize = 40M/" /etc/php5/php.ini && \
sed -i -e "s/^LogLevel warn/LogLevel Error/" /etc/php5/php.ini && \
ln -s /usr/bin/php5 /usr/bin/php && \
mkdir /run/apache2 && chown apache:apache -R /var/www/logs/ /run/apache2  /var/www/localhost/htdocs && \
rm -rf /var/cache/apk/*
COPY --chown=apache:apache run.sh /usr/bin/run.sh
COPY --chown=apache:apache seguridad.conf /etc/apache2/conf.d/
EXPOSE 8080
USER apache
WORKDIR /var/www/localhost/htdocs
VOLUME ["/var/www/localhost/htdocs"]
ENTRYPOINT ["/usr/bin/run.sh"]
CMD ["httpd", "-DFOREGROUND"]
