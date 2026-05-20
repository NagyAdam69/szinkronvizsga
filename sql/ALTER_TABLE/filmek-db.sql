-- Filmek adatbázis - Kezdő állapot
-- Ez a fájl létrehozza az alapvető szerkezetet, amit majd ALTER utasításokkal fejlesztünk tovább

-- Adatbázis létrehozása és kiválasztása
DROP DATABASE IF EXISTS filmek_db;
CREATE DATABASE filmek_db 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_hungarian_ci;

USE filmek_db;

-- Rendezők tábla - kezdeti egyszerű állapot
CREATE TABLE directors (
    id INT,                    -- Még nincs PRIMARY KEY és AUTO_INCREMENT
    name VARCHAR(50)           -- Rövid név mező, nincs megszorítás
);

-- Filmek tábla - kezdeti egyszerű állapot  
CREATE TABLE movies (
    id INT,                    -- Még nincs PRIMARY KEY és AUTO_INCREMENT
    title VARCHAR(100),        -- Rövid cím mező, nincs megszorítás
    year INT                   -- Egyszerű INT típus, nincs megszorítás
);

-- Néhány kezdeti adat a gyakorláshoz
INSERT INTO directors (id, name) VALUES
(1, 'Christopher Nolan'),
(2, 'Quentin Tarantino'),
(3, 'Martin Scorsese');

INSERT INTO movies (id, title, year) VALUES
(1, 'Inception', 2010),
(2, 'Pulp Fiction', 1994),
(3, 'The Godfather', 1972),
(4, 'Interstellar', 2014);

-- Ellenőrzés
SELECT 'Kezdeti directors tábla:' AS info;
DESCRIBE directors;
SELECT * FROM directors;

SELECT 'Kezdeti movies tábla:' AS info;
DESCRIBE movies;
SELECT * FROM movies;