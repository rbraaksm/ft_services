FROM alpine:latest

RUN apk update && \
	apk add curl

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_static_linux_amd64.tar.gz && \
	tar -zxvf telegraf-1.15.3_static_linux_amd64.tar.gz && \
	rm telegraf-1.15.3_static_linux_amd64.tar.gz && \
	mkdir /etc/telegraf

COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8125

CMD cd telegraf-1.15.3/usr && ./bin/telegraf