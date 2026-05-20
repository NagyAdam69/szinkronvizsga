-- MySQL ALTER utasítások gyakorló feladatsor - MEGOLDÁSOK
-- Filmek adatbázis módosítása lépésről lépésre

USE filmek_db;

-- ============================================================================
-- 1. OSZLOPOK HOZZÁADÁSA (ADD)
-- ============================================================================

-- a) birth_year hozzáadása a directors tábla végéhez
ALTER table directors ADD birth_year YEAR;

-- b) duration hozzáadása a movies tábla végéhez
ALTER table movies ADD duration INT;

-- c) nationality hozzáadása a name oszlop után
ALTER table directors ADD nationality VARCHAR(50) AFTER name;

-- d) original_title hozzáadása az első helyre
ALTER table movies ADD original_title VARCHAR(100) FIRST;

-- ============================================================================
-- 2. OSZLOP TÍPUS MÓDOSÍTÁSA (MODIFY)
-- ============================================================================

-- e) directors.name típusának módosítása VARCHAR(100)-ra
ALTER TABLE directors MODIFY name VARCHAR(100);

-- f) movies.title típusának módosítása VARCHAR(150)-re
ALTER TABLE movies MODIFY title VARCHAR(150);

-- ============================================================================
-- 3. NOT NULL MEGSZORÍTÁS HOZZÁADÁSA (MODIFY)
-- ============================================================================

-- g) directors.name beállítása NOT NULL-ra
ALTER TABLE directors MODIFY name VARCHAR(100) NOT NULL;

-- h) movies.title beállítása NOT NULL-ra
ALTER TABLE movies MODIFY title VARCHAR(150) NOT NULL;

-- ============================================================================
-- 4. DEFAULT ÉRTÉK BEÁLLÍTÁSA (MODIFY)
-- ============================================================================

-- i) directors.nationality alapértelmezett értékének beállítása
ALTER TABLE directors MODIFY nationality VARCHAR(50) DEFAULT 'Ismeretlen';

-- j) movies.year típusának módosítása YEAR-ra és NOT NULL beállítása
ALTER TABLE movies MODIFY year YEAR NOT NULL;

-- ============================================================================
-- 5. OSZLOP ÁTNEVEZÉSE ÉS MÓDOSÍTÁSA (CHANGE)
-- ============================================================================

-- k) year átnevezése release_year-re
ALTER TABLE movies CHANGE 'year' release_year YEAR NOT NULL;

-- l) original_title átnevezése original_name-re
ALTER TABLE movies CHANGE original_title original_name VARCHAR(150);

-- ============================================================================
-- 6. OSZLOP EGYSZERŰ ÁTNEVEZÉSE (RENAME COLUMN)
-- ============================================================================

-- m) original_name visszanevezése original_title-re
ALTER TABLE movies RENAME COLUMN original_name TO original_title;

-- n) directors.id átnevezése director_id-re
ALTER TABLE directors RENAME COLUMN id TO director_id;

-- ============================================================================
-- 7. PRIMARY KEY HOZZÁADÁSA
-- ============================================================================

-- o) PRIMARY KEY beállítása a directors.director_id oszlopon
ALTER TABLE directors ADD PRIMARY KEY (director_id);

-- p) PRIMARY KEY beállítása a movies.id oszlopon
ALTER TABLE movies ADD PRIMARY KEY (id);

-- ============================================================================
-- 8. AUTO_INCREMENT TULAJDONSÁG HOZZÁADÁSA
-- ============================================================================

-- q) AUTO_INCREMENT beállítása a directors.director_id oszlopon
ALTER TABLE directors MODIFY director_id INT AUTO_INCREMENT;

-- r) AUTO_INCREMENT beállítása a movies.id oszlopon
ALTER TABLE movies MODIFY id INT AUTO_INCREMENT;

-- ============================================================================
-- 9. ÚJ OSZLOPOK HOZZÁADÁSA A MOVIES TÁBLÁHOZ
-- ============================================================================

-- s) genre oszlop hozzáadása
ALTER TABLE movies ADD genre VARCHAR(50);

-- t) age_rating oszlop hozzáadása ENUM típussal
ALTER TABLE movies ADD age_rating ENUM('G', 'PG', 'PG-13', 'R', 'NC-17');

-- ============================================================================
-- 10. FOREIGN KEY KAPCSOLAT LÉTREHOZÁSA
-- ============================================================================

-- u) director_id oszlop hozzáadása a movies táblához
AKTER TABLE movies ADD director_id INT;

-- v) FOREIGN KEY kapcsolat létrehozása (nevesítve)
ALTER TABLE movies ADD CONSTRAINT fk_director FOREIGN KEY (director_id) REFERENCES directors(director_id);

-- ============================================================================
-- 11. OSZLOP TÖRLÉSE (DROP)
-- ============================================================================

-- w) original_title oszlop törlése
ALTER TABLE movies DROP COLUMN original_title;

-- x) duration oszlop törlése
ALTER TABLE movies DROP COLUMN duration;

-- ============================================================================
-- 12. DEFAULT ÉRTÉK MÓDOSÍTÁSA ALTER COLUMN HASZNÁLATÁVAL
-- ============================================================================

-- y) genre alapértelmezett értékének beállítása
ALTER TABLE movies ALTER COLUMN genre SET DEFAULT 'Drama';

-- z) age_rating alapértelmezett értékének beállítása
ALTER TABLE movies ALTER COLUMN age_rating SET DEFAULT 'PG-13';

-- ============================================================================
-- 13. TÁBLA ÁTNEVEZÉSE
-- ============================================================================

-- aa) movies tábla átnevezése films-re
ALTER TABLE movies RENAME TO films;

-- ============================================================================
-- 14. AUTO_INCREMENT KEZDŐÉRTÉK MÓDOSÍTÁSA
-- ============================================================================

-- ab) directors tábla AUTO_INCREMENT értékének beállítása
ALTER TABLE directors AUTO_INCREMENT = 10;

-- ============================================================================
-- 15. BÓNUSZ: PRIMARY KEY TÖRLÉSE ÉS ÚJRA HOZZÁADÁSA
-- ============================================================================

-- ac) AUTO_INCREMENT tulajdonság törlése (MODIFY-val)
ALTER TABLE directors MODIFY director_id INT;

-- ad) PRIMARY KEY törlése
ALTER TABLE directors DROP PRIMARY KEY;

-- ae) PRIMARY KEY és AUTO_INCREMENT újra hozzáadása
ALTER TABLE directors MODIFY director_id INT AUTO_INCREMENT PRIMARY KEY;

-- ============================================================================
-- 16. FOREIGN KEY TÖRLÉSE ÉS ÚJRA LÉTREHOZÁSA
-- ============================================================================

-- af) fk_director idegen kulcs törlése
ALTER TABLE films DROP FOREIGN KEY fk_director;

-- ag) fk_director idegen kulcs újra létrehozása
ALTER TABLE films ADD CONSTRAINT fk_director FOREIGN KEY (director_id) REFERENCES directors(director_id);

-- ============================================================================
-- ELLENŐRZÉS
-- ============================================================================

-- ============================================================================
-- DIRECTORS TÁBLA SZERKEZETE
-- ============================================================================
DESCRIBE directors;

-- ============================================================================
-- FILMS TÁBLA SZERKEZETE
-- ============================================================================
DESCRIBE films;

-- ============================================================================
-- DIRECTORS TÁBLA LÉTREHOZÁSI UTASÍTÁSA
-- ============================================================================
SHOW CREATE TABLE directors;

-- ============================================================================
-- FILMS TÁBLA LÉTREHOZÁSI UTASÍTÁSA
-- ============================================================================
SHOW CREATE TABLE films;

-- ============================================================================
-- ADATOK A TÁBLÁKBAN
-- ============================================================================
SELECT * FROM films;