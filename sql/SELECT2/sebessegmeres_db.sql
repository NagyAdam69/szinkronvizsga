-- Rendőrségi sebességmérések adatbázisa
-- Database for police speed measurements

DROP DATABASE IF EXISTS speed_measurements;
CREATE DATABASE speed_measurements 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_hungarian_ci;

USE speed_measurements;

-- 1. Tulajdonosok tábla
CREATE TABLE owners (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Azonosító',
    name VARCHAR(100) NOT NULL COMMENT 'Név',
    birth_date DATE COMMENT 'Születési dátum',
    address VARCHAR(200) COMMENT 'Lakcím',
    phone VARCHAR(20) COMMENT 'Telefonszám',
    email VARCHAR(100) COMMENT 'Email cím'
) COMMENT = 'Járműtulajdonosok (személyek)';

-- 2. Járművek tábla
CREATE TABLE vehicles (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Azonosító',
    license_plate VARCHAR(20) NOT NULL UNIQUE COMMENT 'Rendszám',
    brand VARCHAR(50) COMMENT 'Márka',
    model VARCHAR(50) COMMENT 'Típus',
    year_of_manufacture YEAR COMMENT 'Gyártási év',
    color VARCHAR(30) COMMENT 'Szín',
    current_owner_id INT COMMENT 'Aktuális tulajdonos azonosítója',
    FOREIGN KEY (current_owner_id) REFERENCES owners(id)
) COMMENT = 'Járművek (autók, motorok)';

-- 3. Helyszínek tábla (mérési pontok)
CREATE TABLE locations (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Azonosító',
    city VARCHAR(100) NOT NULL COMMENT 'Város',
    street VARCHAR(100) NOT NULL COMMENT 'Utca',
    house_number VARCHAR(10) COMMENT 'Háztól',
    speed_limit INT NOT NULL COMMENT 'Sebességkorlátozás (km/h)'
) COMMENT = 'Mérési helyszínek';

-- 4. Mérőeszközök tábla
CREATE TABLE measuring_devices (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Azonosító',
    device_type ENUM('radar', 'camera', 'laser') NOT NULL COMMENT 'Típus (radar/kamera/lézeres)',
    serial_number VARCHAR(50) UNIQUE COMMENT 'Gyártási szám',
    installation_date DATE COMMENT 'Üzembe helyezés dátuma'
) COMMENT = 'Mérőeszközök (radarok, kamerák)';

-- 5. Mérések tábla
CREATE TABLE measurements (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Azonosító',
    vehicle_id INT NOT NULL COMMENT 'Jármű azonosítója',
    location_id INT NOT NULL COMMENT 'Helyszín azonosítója',
    device_id INT NOT NULL COMMENT 'Mérőeszköz azonosítója',
    measured_speed INT NOT NULL COMMENT 'Mért sebesség (km/h)',
    measurement_date DATE NOT NULL COMMENT 'Mérés dátuma',
    measurement_time TIME NOT NULL COMMENT 'Mérés időpontja',
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id),
    FOREIGN KEY (location_id) REFERENCES locations(id),
    FOREIGN KEY (device_id) REFERENCES measuring_devices(id)
) COMMENT = 'Sebességmérési események';

-- 6. Bírságok tábla (1:1 kapcsolat a mérésekkel)
CREATE TABLE fines (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Azonosító',
    measurement_id INT NOT NULL UNIQUE COMMENT 'Mérés azonosítója (1:1 kapcsolat)',
    amount DECIMAL(10, 2) NOT NULL COMMENT 'Bírság összege (Ft)',
    paid BOOLEAN DEFAULT FALSE COMMENT 'Befizetve (igen/nem)',
    payment_deadline DATE NOT NULL COMMENT 'Befizetési határidő',
    FOREIGN KEY (measurement_id) REFERENCES measurements(id)
) COMMENT = 'Bírságok (csak túllépés esetén)';

-- 7. Tulajdonlások tábla (M:N kapcsolótábla)
CREATE TABLE ownerships (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Azonosító',
    vehicle_id INT NOT NULL COMMENT 'Jármű azonosítója',
    owner_id INT NOT NULL COMMENT 'Tulajdonos azonosítója',
    ownership_start DATE NOT NULL COMMENT 'Tulajdonlás kezdete',
    ownership_end DATE COMMENT 'Tulajdonlás vége (NULL = jelenlegi tulajdonos)',
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id),
    FOREIGN KEY (owner_id) REFERENCES owners(id)
) COMMENT = 'Tulajdonlások (járművek és tulajdonosok közötti M:N kapcsolat, időbeli nyomonkövetéssel)';