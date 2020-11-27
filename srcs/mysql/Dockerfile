FROM alpine:latest

# RUN apk update && \
# 	apk add mysql && \
# 	apk add mysql-client && \
# 	apk add --no-cache

RUN 	apk update
RUN 	apk add mysql
RUN 	apk add mysql-client
RUN		apk add --no-cache
RUN 	addgroup mysql mysql

# RUN addgroup mysql mysql

COPY my.cnf /etc/
COPY setup.sh /
RUN chmod +x /setup.sh

#VOLUME [ "/var/lib/mysql" ]

RUN 	exec echo "CREATE DATABASE IF NOT EXISTS mysql;" >> /my.sql
RUN		exec echo "SET PASSWORD FOR 'mysql'@'localhost'=PASSWORD('password');" >> /my.sql
RUN		exec echo "GRANT ALL ON *.* TO 'mysql'@'127.0.0.1' IDENTIFIED BY 'password' WITH GRANT OPTION;" >> /my.sql
RUN		exec echo "GRANT ALL ON *.* TO 'mysql'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;" >> /my.sql
RUN		exec echo "GRANT ALL ON *.* TO 'mysql'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;" >> /my.sql
RUN		exec echo "FLUSH PRIVILEGES;" >> /my.sql

EXPOSE 3306

#debugger command
#RUN apk add vim
#CMD tail -f /dev/null

ENTRYPOINT ./setup.sh
