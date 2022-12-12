FROM mariadb:latest

COPY scripts /docker-entrypoint-initdb.d/

ENV MARIADB_ROOT_PASSWORD=mainpass

ENV MARIADB_USER=brooklyn
ENV MARIADB_PASSWORD=br00k11n
ENV MARIADB_DATABASE=visitors

ENV PORT 3306
EXPOSE 3306
