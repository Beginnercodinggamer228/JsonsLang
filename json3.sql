CREATE TABLE users (
  id INT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  logged_in BOOLEAN DEFAULT TRUE
);

INSERT INTO users (username, password)
VALUES ('<username>', '<password>');

UPDATE users SET logged_in = FALSE WHERE id = 1;