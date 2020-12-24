FROM	alpine:latest

RUN 	apk update
RUN		apk upgrade
RUN		apk add curl

RUN 	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_static_linux_amd64.tar.gz
RUN		tar -zxvf telegraf-1.15.3_static_linux_amd64.tar.gz
RUN 	mkdir /etc/telegraf

COPY 	telegraf.conf /etc/telegraf/telegraf.conf

CMD 	cd telegraf-1.15.3/usr && ./bin/telegraf
