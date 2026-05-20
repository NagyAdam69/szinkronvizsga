-- Zene adatbázis - Kezdő állapot
-- Ez a fájl létrehozza az alapvető szerkezetet, amit majd ALTER utasításokkal fejlesztünk tovább

-- Adatbázis létrehozása és kiválasztása
DROP DATABASE IF EXISTS zene_db;
CREATE DATABASE zene_db 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_hungarian_ci;

USE zene_db;

-- Előadók tábla - kezdeti egyszerű állapot
CREATE TABLE artists (
    id INT,                    -- Még nincs PRIMARY KEY és AUTO_INCREMENT
    name VARCHAR(60)           -- Rövid név mező, nincs megszorítás
);

-- Albumok tábla - kezdeti egyszerű állapot  
CREATE TABLE albums (
    id INT,                    -- Még nincs PRIMARY KEY és AUTO_INCREMENT
    title VARCHAR(80),         -- Rövid cím mező, nincs megszorítás
    year INT                   -- Egyszerű INT típus, nincs megszorítás
);

-- Néhány kezdeti adat a gyakorláshoz
INSERT INTO artists (id, name) VALUES
(1, 'The Beatles'),
(2, 'Pink Floyd'),
(3, 'Queen');

INSERT INTO albums (id, title, year) VALUES
(1, 'Abbey Road', 1969),
(2, 'The Dark Side of the Moon', 1973),
(3, 'A Night at the Opera', 1975),
(4, 'Let It Be', 1970);

-- Ellenőrzés
SELECT 'Kezdeti artists tábla:' AS info;
DESCRIBE artists;
SELECT * FROM artists;

SELECT 'Kezdeti albums tábla:' AS info;
DESCRIBE albums;
SELECT * FROM albums;