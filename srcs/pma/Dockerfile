FROM alpine:3.13
RUN apk update && apk add nginx openrc openssh openssl \
	php7 php7-fpm php7-opcache php7-gd php7-mysqli \
    php7-zlib php7-curl php7-mbstring php7-json php7-session telegraf supervisor
RUN adduser -D -g 'www' www
RUN mkdir /www && mkdir -p /run/nginx && mkdir /etc/nginx/ssl && \
	chown -R www:www /var/lib/nginx && chown -R www:www /www

WORKDIR /www/
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz ./
RUN tar -xvf phpMyAdmin*tar* --strip-components 1
RUN rm -rf ./phpMyAdmin*tar*
ADD config.inc.php ./
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/ctobias_site.pem -keyout /etc/nginx/ssl/ctobias_site.key \
 	-subj "/C=RU/ST=Moscow/L=Moscow/O=21 School/OU=ctobias/CN=ctobias_site"

WORKDIR /
COPY nginx.conf /etc/nginx/nginx.conf
COPY pma-init.sh /
COPY supervisord.conf /etc/supervisord.conf
EXPOSE 5000
ENTRYPOINT ["sh", "pma-init.sh"]