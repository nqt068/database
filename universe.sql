CREATE DATABASE IF NOT EXISTS universe;

USE universe;

CREATE TABLE IF NOT EXISTS galaxy
(
    galaxy_id SERIAL PRIMARY KEY,
    galaxy_name VARCHAR(30) NOT NULL UNIQUE,
    galaxy_type TEXT NOT NULL,
    num_of_stars INT NOT NULL,
    galaxy_group VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS quasar
(
    quasar_id SERIAL PRIMARY KEY,
    quasar_name VARCHAR(30) NOT NULL UNIQUE,
    quasar_type TEXT NOT NULL,
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);

CREATE TABLE IF NOT EXISTS star
(
    star_id SERIAL PRIMARY KEY,
    star_name VARCHAR(30) NOT NULL UNIQUE,
    star_type TEXT NOT NULL,
    planets INT,
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);

CREATE TABLE IF NOT EXISTS planet
(
    planet_id SERIAL PRIMARY KEY,
    planet_name VARCHAR(30) NOT NULL UNIQUE,
    moons INT,
    rings BIT NOT NULL,
    star_id INT REFERENCES star(star_id)
);

CREATE TABLE IF NOT EXISTS moon
(
    moon_id SERIAL PRIMARY KEY,
    moon_name VARCHAR(30) NOT NULL UNIQUE,
    sole_moon BIT NOT NULL,
    year_discovered NUMERIC(4),
    planet_id INT REFERENCES planet(planet_id)
);

INSERT INTO galaxy
    (galaxy_name, galaxy_type, num_of_stars, galaxy_group)
VALUES('Milky Way', 'barred-spiral', 5000, 'Local Group'),
    ('Canis Major Dwarf', 'dwarf-irregular', 5000, 'Local Group'),
    ('Virgo Stellar Stream', 'dwarf-spheroid', 3000, 'Local Group' ),
    ('Sagittarius Dwarf', 'dwarf-spheroid', 1000, 'Local Group'),
    ('Large Magellanic Cloud', 'Magellanic-spiral', 2000, 'Local Group'),
    ('Small Magellanic Cloud', 'dwarf-irregular', 3000, 'Local Group');

SELECT * FROM galaxy;

INSERT INTO quasar
    (quasar_name, quasar_type, galaxy_id)
VALUES('Example 1', 'Radio-loud', 3),
    ('Example 2', 'Radio-quiet', 6),
    ('Example 3', 'Red', 5);

INSERT INTO star
    (star_name, star_type, planets, galaxy_id)
VALUES('Sol', 'Yellow Dwarf', 8, 1),
    ('Proxima Centauri', 'Red Dwarf', 3, 1),
    ('Barnards Star', 'Red Dwarf', 1, 1),
    ('Luhman 16', 'Brown Dwarf', 0, 1),
    ('W0855', 'Brown Dwarf', NULL, 1),
    ('Wolf 359', 'Red Dwarf', 2, 1);

INSERT INTO planet
    (planet_name, moons, rings, star_id)
VALUES('Mercury', 0, 0, 1),
    ('Venus', 0, 0, 1),
    ('Earth', 1, 0, 1),
    ('Mars', 2, 0, 1),
    ('Jupiter', 79, 1, 1),
    ('Saturn', 82, 1, 1),
    ('Uranus', 27, 1, 1),
    ('Neptune', 14, 1, 1),
    ('Proxima b', NULL, 0, 2),
    ('Proxima c', NULL, 0, 2),
    ('Proxima d', NULL, 0, 2),
    ('Barnards Star b', NULL, 0, 3);

INSERT INTO moon
    (moon_name, sole_moon, year_discovered, planet_id)
VALUES('Moon', 1, 1610, 3),
    ('Phobos', 0, 1877, 4),
    ('Deimos', 0, 1877, 4),
    ('Ganymede', 0, 1610, 5),
    ('Callisto', 0, 1610, 5),
    ('Io', 0, 1610, 5),
    ('Europa', 0, 1610, 5),
    ('Amalthea', 0, 1892, 5),
    ('Himalia', 0, 1904, 5),
    ('Elara', 0, 1905, 5),
    ('Pasiphae', 0, 1908, 5),
    ('Sinope', 0, 1914, 5),
    ('Lysithea', 0, 1938, 5),
    ('Carme', 0, 1938, 5),
    ('Ananke', 0, 1951, 5),
    ('Leda', 0, 1974, 5),
    ('Thebe', 0, 1979, 5),
    ('Adrastea', 0, 1979, 5),
    ('Metis', 0, 1979, 5),
    ('Callirrhoe', 0, 1999, 5);






