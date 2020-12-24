FROM 	alpine:latest

RUN 	apk update
RUN 	apk add mysql
RUN 	apk add mysql-client
RUN		apk add --no-cache
RUN 	addgroup mysql mysql

COPY 	database.sql /database.sql
COPY 	my.cnf /etc/
COPY 	setup.sh /
RUN 	chmod +x /setup.sh

RUN		exec echo "SET PASSWORD FOR 'mysql'@'localhost'=PASSWORD('ft_services');" >> /database.sql
RUN		exec echo "GRANT ALL ON *.* TO 'mysql'@'127.0.0.1' IDENTIFIED BY 'ft_services' WITH GRANT OPTION;" >> /database.sql
RUN		exec echo "GRANT ALL ON *.* TO 'mysql'@'localhost' IDENTIFIED BY 'ft_services' WITH GRANT OPTION;" >> /database.sql
RUN		exec echo "GRANT ALL ON *.* TO 'mysql'@'%' IDENTIFIED BY 'ft_services' WITH GRANT OPTION;" >> /database.sql
RUN		exec echo "FLUSH PRIVILEGES;" >> /database.sql

EXPOSE 3306

CMD ./setup.sh