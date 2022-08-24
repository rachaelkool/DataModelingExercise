-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  moons TEXT[]
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);



INSERT INTO stars (id, name)
VALUES
(1, 'The Sun'),
(2, 'Proxima Centauri'),
(3, 'Gliese');

INSERT INTO galaxies (id, name)
VALUES
(1, 'The Milky Way');

INSERT INTO planets (id, name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  (1, 'Earth', 1.00, 1, 1, '{"The Moon"}'),
  (2, 'Mars', 1.88, 1, 1, '{"Phobos", "Deimos"}'),
  (3, 'Venus', 0.62, 1, 1, '{}'),
  (4, 'Neptune', 164.8, 1, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  (5, 'Proxima Centauri b', 0.03, 2, 1, '{}'),
  (6, 'Gliese 876 b', 0.23, 3, 1, '{}');