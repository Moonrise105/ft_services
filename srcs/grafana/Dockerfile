FROM alpine:3.13
RUN apk add libc6-compat telegraf supervisor
ADD https://dl.grafana.com/oss/release/grafana-7.2.2.linux-amd64.tar.gz ./
RUN tar -xvf grafana*tar* --strip-components 1
RUN rm -rf ./grafana*tar*
#ADD grafana.db ./data/
COPY grafana-init.sh /
ADD grafana.db ./data/
COPY supervisord.conf /etc/supervisord.conf
EXPOSE 3000
ENTRYPOINT ["sh", "grafana-init.sh"]