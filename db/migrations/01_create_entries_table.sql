-- create the table
CREATE TABLE entries (id SERIAL PRIMARY KEY, title VARCHAR(60), content TEXT, date_created DATE);
-- add test data
INSERT INTO entries (title, content, date_created) VALUES ('First Entry', 'Small test entry', '2021-01-01');
INSERT INTO entries (title, content, date_created) VALUES ('Second Entry', 'Small test entry', '2021-01-02');
INSERT INTO entries (title, content, date_created) VALUES ('Third Entry', 'Small test entry', '2021-01-03');