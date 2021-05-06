# !/bin/sh
mkdir /etc/telegraf
cp /etc/telegraf.conf /etc/telegraf/telegraf.conf
sed -i "s~# database = \"telegraf\"~database = \"nginx\"~g" /etc/telegraf/telegraf.conf
sed -i "s~# urls = \[\"unix:///var/run/influxdb.sock\"\]~urls = \[\"http://influxdb:8086\"\]~g" /etc/telegraf/telegraf.conf
echo "Hello World!" > /www/index.html
/usr/bin/supervisord -c /etc/supervisord.conf