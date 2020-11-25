FROM alpine:latest

RUN apk update
RUN apk add nginx
RUN apk add openssl
RUN apk add openssh
RUN mkdir /var/run/nginx

# add user -D= no password -g= Name or ID of the primary group.
RUN adduser -D -g 'www' www
RUN mkdir -p /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

#add user for ssh -D=Don't assign a password -h=Home directory
RUN adduser -D rene -h / && \
	echo "rene:password" | chpasswd

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/user.key -out /etc/ssl/user.crt -subj '/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=ft_services'

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html
COPY sshd_config /etc/ssh/sshd_config
COPY setup.sh ./

RUN chmod +x setup.sh

EXPOSE 22 80 443

CMD ./setup.sho