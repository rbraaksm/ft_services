FROM 	alpine:latest

RUN 	apk update
RUN 	apk add libc6-compat
RUN		apk add wget

RUN 	wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.4.linux-amd64.tar.gz
RUN 	tar -zxvf grafana-enterprise-7.3.4.linux-amd64.tar.gz
RUN 	rm grafana-enterprise-7.3.4.linux-amd64.tar.gz
COPY 	grafana.db /grafana-7.3.4/data/

COPY 	./setup.sh ./
RUN 	chmod +x setup.sh

COPY 	default.yaml /usr/share/grafana-7.3.4/conf/provisioning/datasources/
COPY	*.json /usr/share/grafana-7.3.4/conf/provisioning/dashboards/mine/
COPY 	default.yaml /usr/share/grafana-7.3.4/conf/provisioning/dashboardsY

EXPOSE	3000

WORKDIR grafana-7.3.4
CMD 	./bin/grafana-server
