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
java -jar target/hello-world-spring-boot-0.0.1.jar
```

To run on a VM or Docker container:

```shell
nohup java -jar  target/hello-world-spring-boot-0.0.1.jar server.log 2>&1 &
```

## Set Up Port Forwarding

```shell
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
sudo iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 8080
sudo iptables -t nat -vnL
```

## What's Next

1. Configure DB support
2. Make DB configurable (maybe separate builds fot MariaDB and PostgreSQL ?)
3. {Your Proposal here} (Please contribute!)