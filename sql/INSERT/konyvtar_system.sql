-- Konyvtár rendszer
--
-- Szerepkörök: admin, könyvtáros, olvasó/kölcsönző
CREATE DATABASE IF NOT EXISTS library;
ALTER DATABASE library CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE library;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(60) NOT NULL,
    telephone_number VARCHAR(20) NOT NULL,
    home_address VARCHAR(255) NOT NULL,
    birthdate DATE NOT NULL,
    birthplace VARCHAR(100) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    country_id INT(2) NOT NULL,
    id_number VARCHAR(20) NOT NULL,
    mother_name VARCHAR(255) NOT NULL,
    role ENUM('admin', 'librarian', 'user') DEFAULT 'user' NOT NULL
);

-- Adat bevitel
INSERT INTO users (name, password, email, telephone_number, home_address, birthdate, birthplace, registration_date, country_id, id_number, mother_name) 
VALUES('Molnár Maxim', 'asd1234', 'scopsy@scopsy.hu', '06701712970', 'Izsák, Kossuth L. 81', '2007.06.29', 'Kecskemét', '1', '769271ME', 'Makai Marianna')


-- Összes adat kiválasztás
SELECT * FROM users;

-- Rekordok számának megkeresése
SELECT COUNT(*) FROM users;

-- Elnevezve 'row_count'-nak
SELECT COUNT(*) AS 'row_count' FROM users;

-- Több mező lekérdezése (id, name, email)
SELECT id, name, email FROM users;

-- Adatok kiürítése
TRUNCATE users;

-- Eltűnteti az adatokat és a SZERKEZETET is!!! - Nem ajánlott 
DROP TABLE users;

-- Több sor bevitele
INSTERT INTO users (name, password, email, telephone_number, home_address, birthdate, birthplace, registration_date, country_id, id_number, mother_name, role)
VALUES
('Molnár Maxim', 'asd1234', 'scopsy@scopsy.hu', '06701712970', 'Izsák, Kossuth L. 81', '2007.06.29', 'Kecskemét', '1', '769271ME', 'Makai Marianna', 'admin'),
('Kovács Anna', 'qwe5678', 'anna@scopsy.hu', '06701234567', 'Budapest, Petőfi S. 10', '1995.03.15', 'Budapest', '1', '123456AB', 'Nagy Erzsébet', 'librarian'),
('Szabó Péter', 'zxc9012', 'peter@scopsy.hu', '06709876543', 'Debrecen, Ady E. 5', '1988.11.22', 'Debrecen', '1', '654321CD', 'Kiss Mária', 'user');

-- Adott értékű mező keresése
SELECT * FROM `users` WHERE id=1;

-- Plusz mező hozzáadása
ALTER TABLE users ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;