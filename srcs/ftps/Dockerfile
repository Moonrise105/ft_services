FROM alpine:3.13

RUN apk update && apk add --no-cache vsftpd openssl telegraf supervisor
#RUN mkdir /etc/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
	-out /etc/ssl/ctobias_site.pem -keyout /etc/ssl/ctobias_site.key \
 	-subj "/C=RU/ST=Moscow/L=Moscow/O=21 School/OU=ctobias/CN=ctobias_site"
RUN adduser -D admin && echo "admin:admin" | chpasswd
COPY ftps-init.sh /
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY supervisord.conf /etc/supervisord.conf
EXPOSE 21 21100
ENTRYPOINT ["sh", "ftps-init.sh"]