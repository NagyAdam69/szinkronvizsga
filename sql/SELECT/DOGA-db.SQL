-- Adatbázis létrehozása és kiválasztása
DROP DATABASE IF EXISTS konyvtar_db;
CREATE DATABASE konyvtar_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_hungarian_ci;
USE konyvtar_db;
-- Könyvek tábla létrehozása
CREATE TABLE books (
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(150) NOT NULL,
author VARCHAR(100) NOT NULL,
genre VARCHAR(50) NOT NULL,
published_year YEAR NOT NULL,
pages SMALLINT NOT NULL,
price INT NOT NULL COMMENT 'Ár forintban',
language VARCHAR(30) NOT NULL,
rating DECIMAL(3,1) NOT NULL COMMENT 'Értékelés 1.0-10.0 skálán'
);
-- 25 könyv beszúrása
INSERT INTO books (title, author, genre, published_year, pages, price, language,
rating) VALUES
('Harry Potter and the Philosopher Stone', 'J.K. Rowling', 'fantasy', 1997, 223,
4500, 'angol', 9.2),
('1984', 'George Orwell', 'dystopia', 1949, 328, 3200, 'angol', 9.5),
('To Kill a Mockingbird', 'Harper Lee', 'drama', 1960, 281, 3500, 'angol', 8.9),
('The Great Gatsby', 'F. Scott Fitzgerald', 'drama', 1925, 180, 2800, 'angol',
8.5),
('Pride and Prejudice', 'Jane Austen', 'romance', 1813, 432, 3000, 'angol', 8.7),
('The Hobbit', 'J.R.R. Tolkien', 'fantasy', 1937, 310, 4200, 'angol', 9.0),
('A gyűrűk ura', 'J.R.R. Tolkien', 'fantasy', 1954, 1178, 8500, 'magyar', 9.8),
('Az egri csillagok', 'Gárdonyi Géza', 'historical', 1901, 568, 3800, 'magyar',
8.8),
('A Pál utcai fiúk', 'Molnár Ferenc', 'youth', 1906, 234, 2500, 'magyar', 8.3),
('Tüskevár', 'Fekete István', 'youth', 1957, 318, 2900, 'magyar', 8.6),
('Murder on the Orient Express', 'Agatha Christie', 'crime', 1934, 256, 3300,




'angol', 8.4),
('The Da Vinci Code', 'Dan Brown', 'thriller', 2003, 454, 4800, 'angol', 7.8),
('The Hunger Games', 'Suzanne Collins', 'dystopia', 2008, 374, 4100, 'angol',
8.2),
('Brave New World', 'Aldous Huxley', 'dystopia', 1932, 268, 3100, 'angol', 8.6),
('Animal Farm', 'George Orwell', 'satire', 1945, 112, 2200, 'angol', 9.1),
('The Catcher in the Rye', 'J.D. Salinger', 'drama', 1951, 234, 3400, 'angol',
7.9),
('Lord of the Flies', 'William Golding', 'drama', 1954, 224, 2700, 'angol', 8.0),
('A kőszívű ember fiai', 'Jókai Mór', 'historical', 1869, 892, 5200, 'magyar',
8.5),
('Sherlock Holmes kalandjai', 'Arthur Conan Doyle', 'crime', 1892, 307, 3600,
'angol', 9.3),
('Dune', 'Frank Herbert', 'scifi', 1965, 688, 5500, 'angol', 9.4),
('Foundation', 'Isaac Asimov', 'scifi', 1951, 255, 3900, 'angol', 9.0),
('Fahrenheit 451', 'Ray Bradbury', 'dystopia', 1953, 194, 2900, 'angol', 8.7),
('A setét torony', 'Stephen King', 'fantasy', 1982, 231, 4300, 'magyar', 8.1),
('Az arany ember', 'Jókai Mór', 'romance', 1872, 456, 3700, 'magyar', 7.6),
('Micimackó', 'A.A. Milne', 'youth', 1926, 178, 2400, 'magyar', 8.9);