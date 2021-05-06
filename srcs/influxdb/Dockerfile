FROM alpine:3.13
RUN apk update
RUN apk add --no-cache influxdb telegraf supervisor
RUN mkdir /etc/telegraf	
COPY influxdb-init.sh /
COPY supervisord.conf /etc/supervisord.conf
EXPOSE 8086
ENTRYPOINT ["sh", "influxdb-init.sh"]