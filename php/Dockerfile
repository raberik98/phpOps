FROM alpine:3.21.3

RUN apk update && apk add --no-cache \
    apache2 \
    php83 \
    php83-apache2 \
    php83-pdo \
    php83-pdo_mysql \
    php83-mbstring \
    php83-common \
    && ln -sf /usr/bin/php83 /usr/bin/php \
    || { echo "Failed to install packages"; exit 1; }

# Enable Apache rewrite module
RUN sed -i 's/#LoadModule rewrite_module/LoadModule rewrite_module/' /etc/apache2/httpd.conf

# Configure Apache to use /var/www/html as document root
RUN sed -i 's#DocumentRoot "/var/www/localhost/htdocs"#DocumentRoot "/var/www/html"#' /etc/apache2/httpd.conf \
    && sed -i 's#<Directory "/var/www/localhost/htdocs">#<Directory "/var/www/html">#' /etc/apache2/httpd.conf \
    && echo "ServerName localhost" >> /etc/apache2/httpd.conf \
    && echo -e "<Directory /var/www/html>\n    AllowOverride All\n</Directory>" >> /etc/apache2/httpd.conf

WORKDIR /var/www/html

# Set proper permissions for mounted directory
RUN chown -R apache:apache /var/www/html \
    && chmod -R 755 /var/www/html

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]