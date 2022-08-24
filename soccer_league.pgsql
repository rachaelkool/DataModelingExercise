DROP DATABASE soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL,
    rank INT 
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INT REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    team_1 INT REFERENCES teams ON DELETE SET NULL,
    team_2 INT REFERENCES teams ON DELETE SET NULL,
    ref_1 INT REFERENCES referees ON DELETE SET NULL,
    ref_2 INT REFERENCES referees ON DELETE SET NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players ON DELETE SET NULL,
    game_id INT REFERENCES games ON DELETE SET NULL,
    number_of_goals INT
);



INSERT INTO teams (id, name, start_date, end_date, rank)
VALUES 
(1, 'The Puppies', '05-01-2022', '08-25-2022', 2),
(2, 'The Squirrels', '05-15-2022', '09-01-2022', 1);

INSERT INTO players (id, name, team_id)
VALUES 
(1, 'Scooby', 1),
(2, 'Tubby', 1),
(3, 'Snow', 2);

INSERT INTO referees (id, name)
VALUES 
(1, 'John H'),
(2, 'Jessica W');

INSERT INTO games (id, team_1, team_2, ref_1, ref_2)
VALUES 
(1, 1, 2, 1, 2);

INSERT INTO goals (id, player_id, game_id, number_of_goals)
VALUES 
(1, 1, 1, 3),
(2, 2, 1, 1),
(3, 3, 1, 2);