FROM 	alpine:latest

RUN 	apk update
RUN 	apk upgrade
# vsftpd is a GPL licensed FTP server for UNIX systems, including Linux. It is secure and extremely fast. It is stable
RUN 	apk add vsftpd

# jq is a lightweight and flexible command-line JSON processor
RUN 	apk add jq
RUN 	apk add openssl

RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj '/C=NL/ST=NH/O=CODAM/CN=rbraaksm'
RUN 	mkdir -p /var/ftp

RUN		adduser -D -h /var/ftp rbraaksm
RUN		echo "rbraaksm:ft_services" | chpasswd

COPY 	vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY 	setup.sh ./

EXPOSE 	20 21 30000 30001 30002

CMD 	./setup.sh

# File Transfer Protocol, is used to transfer files between computer and server in a given computer network.