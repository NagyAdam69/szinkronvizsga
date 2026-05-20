DROP DATABASE IF EXISTS filmadatbazis;
CREATE DATABASE filmadatbazis;
ALTER DATABASE library CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE DATABASE filmadatbazis;

CREATE TABLE IF NOT EXISTS filmek(
    azonosito INT PRIMARY KEY AUTO_INCREMENT,
    cim VARCHAR(150) UNIQUE NOT NULL,
    rendezo VARCHAR(100),
    megjelenesi_ev YEAR(4), -- 1901 és 2155 kozott tud tarolni
    hossz INT CHECK (hossz BETWEEN 30 AND 300),
    korhatar ENUM('0', '6', '12', '16', '18'),
    ertekeles FLOAT(2,1) DEFAULT '5.0' NOT NULL
);

CREATE TABLE IF NOT EXISTS szineszek(
    azonosito INT PRIMARY KEY AUTO_INCREMENT,
    nev VARCHAR(100) NOT NULL,
    szuletesi_datum DATE,
    nemzetiseg VARCHAR(100) DEFAULT 'magyar',
    aktiv ENUM('igen', 'nem') DEFAULT 'igen',
    regisztracio_idopontja TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE filmek;
SHOW CREATE TABLE IF NOT EXISTS szineszek;