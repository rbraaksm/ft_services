FROM 	alpine:latest

RUN 	apk update
RUN 	apk add libc6-compat

RUN 	wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.4.linux-amd64.tar.gz
RUN 	tar -zxvf grafana-enterprise-7.3.4.linux-amd64.tar.gz
COPY 	grafana.db /grafana-7.3.4/data/

COPY 	./setup.sh ./
RUN 	chmod +x setup.sh

EXPOSE 	3000

CMD 	./setup.sh