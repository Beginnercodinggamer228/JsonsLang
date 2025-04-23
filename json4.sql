CREATE TABLE users (
  id INT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT
);

INSERT INTO users (username, password)
VALUES ('<username>', '<password>');

SET @json = JSON_OBJECT('username', username, 'password', password);
SELECT JSON agg(@json);