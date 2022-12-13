-- use this to configure an external MariaDB database
create database visitors;

-- creating users
CREATE USER 'brooklyn'@'%' IDENTIFIED BY 'br00k11n';
CREATE USER 'brooklyn'@'localhost' IDENTIFIED BY 'br00k11n';

-- if your blueprint sets the password it can be removed here
-- grant all privileges on *.*  to 'brooklyn'@'%' identified by 'br00k11n';
--  useful if sockets work also
grant all privileges on *.* to 'brooklyn'@'localhost';
grant all privileges on *.* to 'brooklyn'@'%';

-- delete from mariadb.user where User='';
flush privileges;

-- and now the table for visitors
use visitors;

CREATE TABLE messages (
                          id BIGINT NOT NULL AUTO_INCREMENT,
                          name VARCHAR(30) NOT NULL,
                          message VARCHAR(400) NOT NULL,
                          PRIMARY KEY (ID)
);

-- 1.0.0 version
INSERT INTO messages(name, message) values ('Isaac Asimov', 'I was born in Brooklyn' );
INSERT INTO messages(name, message) values ('Isaac Asimov', 'A robot may not injure a human being or, through inaction, allow a human being to come to harm.' );
INSERT INTO messages(name, message) values ('Isaac Asimov', 'A robot must obey the orders given it by human beings except where such orders would conflict with the First Law.' );
INSERT INTO messages(name, message) values ('Isaac Asimov', 'A robot must protect its own existence as long as such protection does not conflict with the First or Second Law.' );