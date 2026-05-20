-- MySQL ALTER utasítások dolgozat - MEGOLDÁSOK
-- Zene adatbázis módosítása lépésről lépésre

USE zene_db;

-- ============================================================================
-- a) Oszlop hozzáadása (2 pont)
-- ============================================================================
ALTER TABLE albums ADD genre VARCHAR(40);


-- ============================================================================
-- b) Oszlop típus módosítása (2 pont)
-- ============================================================================
ALTER TABLE artists MODIFY name VARCHAR(100);


-- ============================================================================
-- c) NOT NULL megszorítás hozzáadása (2 pont)
-- ============================================================================
ALTER TABLE albums MODIFY title VARCHAR(80) NOT NULL;


-- ============================================================================
-- d) Oszlop átnevezése és módosítása (3 pont)
-- ============================================================================
ALTER TABLE albums CHANGE year release_year YEAR NOT NULL;


-- ============================================================================
-- e) Oszlop átnevezése (2 pont)
-- ============================================================================
ALTER TABLE artists change id artist_id INt; 


-- ============================================================================
-- f) PRIMARY KEY hozzáadása (2 pont)
-- ============================================================================
ALTER TABLE artists ADD PRIMARY KEY (artist_id);


-- ============================================================================
-- g) AUTO_INCREMENT tulajdonság (3 pont)
-- ============================================================================
ALTER TABLE artists MODIFY artist_id INT AUTO_INCREMENT;


-- ============================================================================
-- h) PRIMARY KEY és AUTO_INCREMENT egyszerre (3 pont)
-- ============================================================================
alter TABLE albums MODIFY id INT AUTO_INCREMENT PRIMARY KEY; 


-- ============================================================================
-- i) Idegen kulcs oszlop hozzáadása (2 pont)
-- ============================================================================
ALTER TABLE albums add artist_id INt;


-- ============================================================================
-- j) FOREIGN KEY kapcsolat létrehozása (3 pont)
-- ============================================================================
ALTER TABLE albums ADD CONSTRAINt fk_artist FOREIGN KEY (artist_id) REFERENCES artists(artist_id);


-- MOlnár Maxim 