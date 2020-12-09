FROM 	alpine:latest

RUN		apk update
RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-curl php7-json php7-mbstring php7-xml php7-zip php7-soap php7-ssh2 php7-tokenizer php7-session php7 php7-zlib
RUN		apk add nginx

RUN		mkdir -p /www
RUN		mkdir -p /www/tmp
RUN 	mkdir -p /www/phpmyadmin
RUN 	mkdir -p /www/phpmyadmin/tmp
RUN		mkdir -p /run/nginx


RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN 	tar xzf phpMyAdmin-5.0.4-all-languages.tar.gz --strip-components=1 -C /www
RUN 	tar xzf phpMyAdmin-5.0.4-all-languages.tar.gz --strip-components=1 -C /www/phpmyadmin
RUN 	rm phpMyAdmin-5.0.4-all-languages.tar.gz

RUN		adduser -D -g 'www' www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
RUN		chown -R www:www /www/tmp
RUN		chown -R www:www /www/phpmyadmin
RUN		chown -R www:www /www/phpmyadmin/tmp

COPY	config.inc.php /www/
COPY	config.inc.php /www/phpmyadmin
COPY 	nginx.conf /etc/nginx/nginx.conf
COPY 	setup.sh /
RUN 	chmod +x /setup.sh

EXPOSE 	5000

CMD 	./setup.sh