#!/bin/sh
mkdir /etc/telegraf
cp /etc/telegraf.conf /etc/telegraf/telegraf.conf
sed -i "s~# database = \"telegraf\"~database = \"ftps\"~g" /etc/telegraf/telegraf.conf
sed -i "s~# urls = \[\"unix:///var/run/influxdb.sock\"\]~urls = \[\"http://influxdb:8086\"\]~g" /etc/telegraf/telegraf.conf
/usr/bin/supervisord -c /etc/supervisord.conf
