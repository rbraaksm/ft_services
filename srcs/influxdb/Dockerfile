FROM alpine:latest

RUN apk update
RUN	apk add influxdb

EXPOSE 8086

CMD influxd run -config /etc/influxdb.conf

# RUN apk update && \
# 	apk add vim \
# 			influxdb \
# 			wget \
# 			curl

# # expose default port 8086
# EXPOSE 8086

# #CMD ./startup.sh
# CMD influxd run
