FROM alpine:3.13
RUN apk update && apk add nginx openrc openssh openssl \
	php7 php7-fpm php7-opcache php7-gd php7-mysqli \
    php7-zlib php7-curl php7-mbstring php7-json php7-session telegraf supervisor \
	php-phar mysql-client
RUN adduser -D -g 'www' www
RUN mkdir /www && mkdir -p /run/nginx && mkdir /etc/nginx/ssl
	

WORKDIR /www/
ADD https://wordpress.org/latest.tar.gz  ./
RUN tar -xvf latest*tar* --strip-components 1
RUN rm -rf ./latest*tar*
# RUN wget -q https://wordpress.org/latest.tar.gz https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
ADD wp-config.php ./
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/ctobias_site.pem -keyout /etc/nginx/ssl/ctobias_site.key \
 	-subj "/C=RU/ST=Moscow/L=Moscow/O=21 School/OU=ctobias/CN=ctobias_site"

WORKDIR /
COPY nginx.conf /etc/nginx/nginx.conf
COPY wp-init.sh /
COPY supervisord.conf /etc/supervisord.conf
EXPOSE 5050
ENTRYPOINT ["sh", "wp-init.sh"]