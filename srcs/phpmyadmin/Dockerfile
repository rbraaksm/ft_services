# FROM 	alpine:latest

# RUN		apk update
# RUN		apk add php7 php7-mysqli php7-fpm php7-curl php7-json php7-mbstring php7-xml php7-zip php7-gd php7-soap php7-ssh2 php7-tokenizer
# RUN		apk add nginx

# RUN		adduser -D -g 'www' www
# RUN		mkdir -p /www
# RUN 	mkdir -p /www/phpmyadmin
# RUN		mkdir -p /run/nginx
# RUN		chown -R www:www /var/lib/nginx
# RUN		chown -R www:www /www

# RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
# RUN 	tar xzf phpMyAdmin-5.0.4-all-languages.tar.gz -C /www
# RUN 	rm phpMyAdmin-5.0.4-all-languages.tar.gz

# COPY	config.inc.php /www/
# COPY 	nginx.conf /etc/nginx/nginx.conf
# COPY 	setup.sh /
# RUN 	chmod +x /setup.sh

# EXPOSE 	5000

# CMD 	./setup.sh

FROM alpine:latest

RUN apk update && \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-zip && \
	apk add nginx

RUN mkdir -p /www && \
	mkdir -p /www/phpmyadmin && \
	mkdir -p /www/tmp && \
	mkdir -p /www/phpmyadmin/tmp && \
	mkdir -p /run/nginx

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
	tar -zxvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www && \
	tar -zxvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www/phpmyadmin && \
	rm phpMyAdmin-5.0.1-english.tar.gz

RUN adduser -D -g 'www' www && \
	chown -R www:www /www && \
	chown -R www:www /www/tmp && \
	chown -R www:www /www/phpmyadmin/tmp

COPY config.inc.php /www/
COPY config.inc.php /www/phpmyadmin/
COPY nginx.conf /etc/nginx/nginx.conf
COPY setup.sh /
RUN chmod +x /setup.sh

EXPOSE 5000

#debugger command
#RUN apk add vim
#CMD tail -f /dev/null

CMD ./setup.sh