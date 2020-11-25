FROM 	alpine:latest

RUN 	apk update
# vsftpd is a GPL licensed FTP server for UNIX systems, including Linux. It is secure and extremely fast. It is stable
RUN 	apk add vsftpd

# jq is a lightweight and flexible command-line JSON processor
RUN 	apk add jq
RUN 	apk add openssl

RUN		mkdir -p /ftps
RUN		adduser -D rene -h /ftps
RUN		echo "rene:password" | chpasswd

RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/user.key -out /etc/ssl/user.crt -subj '/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=ft_services'

COPY 	vsftpd.conf etc/vsftpd/vsftpd.conf
COPY 	setup.sh ftp/
RUN 	chmod +x ftp/setup.sh

EXPOSE 20 21 30020 30021

CMD 	/ftp/setup.sh
# File Transfer Protocol, is used to transfer files between computer and server in a given computer network.

# FROM alpine:latest

# RUN apk update && \
# 	apk add vsftpd && \
# 	apk add openssl && \
# 	apk add jq && \
# 	apk add curl

# RUN mkdir -p /ftp

# RUN adduser -D rene -h /ftp && \
# 	echo "rene:password" | chpasswd

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/user.key -out /etc/ssl/user.crt -subj '/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=ft_services'

# COPY vsftpd.conf etc/vsftpd/vsftpd.conf
# COPY setup.sh ftp/
# RUN chmod +x ftp/setup.sh

# EXPOSE 20 21 30020 30021

# #debugger command
# #RUN apk add vim
# #CMD tail -f /dev/null

# #working command
# CMD /ftp/setup.sh