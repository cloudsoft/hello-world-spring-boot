FROM mariadb:latest

COPY scripts /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=mainpass

ENV MYSQL_USER=brooklyn
ENV MYSQL_PASSWORD=br00k11n
ENV MYSQL_DATABASE=visitors

ENV PORT 3306
EXPOSE 3306
