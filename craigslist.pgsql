DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    preferred_region INT REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(40) NOT NULL,
    body TEXT NOT NULL, 
    posting_location TEXT NOT NULL, 
    user_id INT REFERENCES users ON DELETE SET NULL,
    region_id INT REFERENCES regions ON DELETE SET NULL,
    category_id INT REFERENCES categories ON DELETE SET NULL
);



INSERT INTO regions (id, region_name)
VALUES 
(1, 'Midwest');

INSERT INTO users (id, username, password, preferred_region)
VALUES 
(1, 'boneeater5', 'dogsrule100', 1);

INSERT INTO categories (id, category)
VALUES 
(1, 'Humor');

INSERT INTO posts (id, title, body, posting_location, user_id, region_id, category_id)
VALUES 
(1, 'Tricking Parents', 'Looking to trick my parents into giving me their food-- any ideas?', 'Grand Rapids, MI', 1, 1, 1);



