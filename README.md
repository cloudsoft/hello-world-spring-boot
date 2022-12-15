# Brooklyn Hello World :: Spring Boot Version

Requires JDK version 19 - any distribution works.

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
java -jar target/hello-world-spring-boot-1.0.1.jar
```

To run on a VM or Docker container, without a database:

```shell
nohup java -jar target/hello-world-spring-boot-1.0.1.jar --spring.profiles.active=local >> server.log 2>&1 &
```

To run on a VM or Docker container, with a remote database:

```shell
nohup java -jar target/hello-world-spring-boot-1.0.1.jar --spring.profiles.active=remote --DB_IP=X.X.X.X --DB_USER=brooklyn --DB_PASS=br00k11n >> server.log 2>&1 &
```

If not present:

* `DB_IP` defaults to `localhost`
* `DB_USER` defaults to `brooklyn`
* `DB_PASS` defaults to `br00k11n`

## Set Up Port Forwarding

```shell
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
sudo iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 8080
sudo iptables -t nat -vnL
```

## What's Next

1. Make DB configurable (use profiles to separate dependencies for each database type, currently we support H2 and MariaDB)
2. {Your Proposal here} (Please contribute!)