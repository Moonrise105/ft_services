FROM alpine:3.13
RUN apk update
RUN apk add mysql mysql-client openrc telegraf supervisor
COPY db-init.sh /
COPY db-start.sh /
COPY wp.sql /
COPY supervisord.conf /etc/supervisord.conf
ENTRYPOINT ["sh", "db-init.sh"]