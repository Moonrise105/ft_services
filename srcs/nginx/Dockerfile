FROM alpine:3.13
RUN apk update && apk add nginx openrc openssh openssl telegraf supervisor
RUN adduser -D -g 'www' www
RUN mkdir /www && mkdir -p /run/nginx && mkdir /etc/nginx/ssl && \
	chown -R www:www /var/lib/nginx && chown -R www:www /www
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/nginx/ssl/ctobias_site.pem -keyout /etc/nginx/ssl/ctobias_site.key \
 	-subj "/C=RU/ST=Moscow/L=Moscow/O=21 School/OU=ctobias/CN=ctobias_site"
COPY nginx-init.sh /
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
EXPOSE 80 443 22
ENTRYPOINT ["sh", "nginx-init.sh"]