FROM alpine:latest

RUN 	apk update
RUN 	apk add mysql
RUN 	apk add mysql-client
RUN		apk add --no-cache
RUN 	addgroup mysql mysql

COPY my.cnf /etc/
COPY setup.sh /
RUN chmod +x /setup.sh

RUN 	exec echo "CREATE DATABASE IF NOT EXISTS mysql;" >> /my.sql
RUN		exec echo "SET PASSWORD FOR 'mysql'@'localhost'=PASSWORD('ft_services');" >> /my.sql
RUN		exec echo "GRANT ALL ON *.* TO 'mysql'@'127.0.0.1' IDENTIFIED BY 'ft_services' WITH GRANT OPTION;" >> /my.sql
RUN		exec echo "GRANT ALL ON *.* TO 'mysql'@'localhost' IDENTIFIED BY 'ft_services' WITH GRANT OPTION;" >> /my.sql
RUN		exec echo "GRANT ALL ON *.* TO 'mysql'@'%' IDENTIFIED BY 'ft_services' WITH GRANT OPTION;" >> /my.sql
RUN		exec echo "FLUSH PRIVILEGES;" >> /my.sql

EXPOSE 3306

CMD ./setup.sh