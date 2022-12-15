# Brooklyn Hello World :: Spring Boot Version

Requires JDK version 19 - any distribution works.

## Download Releases

Dynamic links for downloading files:

https://github.com/cloudsoft/hello-world-spring-boot/releases/latest/download/hello-world.jar
https://github.com/cloudsoft/hello-world-spring-boot/releases/latest/download/creation-script-mariadb.sql

## Build

To build run:

```shell
mvn # with default goals
#  or 
mvn clean install 
```

## Run 

To run locally:

```shell
java -jar target/hello-world.jar
```

To run on a VM or Docker container, without a database:

```shell
nohup java -jar target/hello-world.jar --spring.profiles.active=local >> server.log 2>&1 &
```

To run on a VM or Docker container, with a remote database:

```shell
nohup java -jar target/hello-world.jar --spring.profiles.active=remote --server.port=XXXX --DB_IP=X.X.X.X --DB_PORT=XXXX --DB_USER=brooklyn --DB_PASS=br00k11n >> server.log 2>&1 &
```

If not present:

* `spring.profiles.active` defaults to `local` (thus all `DB_*` properties will be ignored)
* `server.port` defaults to `8080`
* `DB_IP` defaults to `localhost` (requires a MariaDB containter running on your Docker Runtime, built with the contents if the `mariadb-docker` directory)
* `DB_PORT` defaults to `3306`
* `DB_USER` defaults to `brooklyn`
* `DB_PASS` defaults to `br00k11n`

**NOTE:** If you want to use different values for `DB_USER` and `DB_PASS` modify the `creation-script-mariadb.sql` too before running it.

## Set Up Port Forwarding

```shell
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
sudo iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 8080
sudo iptables -t nat -vnL
```

## What's Next

1. Make DB configurable (use profiles to separate dependencies for each database type, currently we support H2 and MariaDB)
2. {Your Proposal here} (Please contribute!)