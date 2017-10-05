FROM php:7.1-fpm-alpine
MAINTAINER homi

RUN apk --update add libmcrypt-dev && rm -rf /var/cache/apk/* && \
    docker-php-ext-install mbstring && \
    docker-php-ext-install mcrypt && \
    docker-php-ext-install pdo_mysql && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \ 
    composer global require hirak/prestissimo

# install wkhtmltox
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-i386.tar.xz \
    && tar -xf wkhtmltox-0.12.4_linux-generic-i386.tar.xz \
    && mv wkhtmltox/ /opt/ \
    && rm -rf wkhtmltox-0.12.4_linux-generic-i386.tar.xz

RUN wget http://dl.ipafont.ipa.go.jp/IPAexfont/IPAexfont00301.zip && \
    unzip IPAexfont00301.zip && \
    cp -rf IPAexfont00301/ /usr/share/fonts/ 
