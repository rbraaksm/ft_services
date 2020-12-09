FROM	alpine:latest

RUN 	apk update
RUN 	apk add nginx
RUN 	apk add php7 php7-fpm php7-opcache php7-common php7-phar php7-dom php7-ssh2 php7-xml php7-curl php-zip php7-exif php7-ftp php7-gd php7-iconv php7-imagick php7-json php7-mbstring php7-mysqli php7-openssl php7-tokenizer php7-zlib

# it's a dummy package to easy install of commands tools
RUN 	apk add mysql-client
RUN 	apk add jq
# cURL is a library that lets you make HTTP requests in PHP.
RUN 	apk add curl

RUN		mkdir /var/run/nginx
RUN		mkdir /www
# add user -D= no password -g= Name or ID of the primary group.
RUN		adduser -D -g 'www' www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www

COPY	nginx.conf /etc/nginx/nginx.conf

# wordpress download, install and setup
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN 	chmod +x wp-cli.phar
RUN 	mv wp-cli.phar /usr/local/bin/wp
RUN 	chmod +x /www
RUN		wp core download --path=/www

COPY	setup.sh /
RUN		chmod +x /setup.sh
# COPY 	wp-config.php www/

EXPOSE	5050

CMD		./setup.sh