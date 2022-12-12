-- 1.0.0 version
use visitors;

CREATE TABLE messages (
                          id BIGINT NOT NULL AUTO_INCREMENT,
                          name VARCHAR(30) NOT NULL,
                          message VARCHAR(400) NOT NULL,
                          PRIMARY KEY (ID)
);