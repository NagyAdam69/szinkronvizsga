-- Aliasok használata AS kulcsszóval
SELECT id AS azonosito, city AS varos FROM locations;

-- Aliasok használata AS kulcsszó nélkül
SELECT id azonosito, city varos, speed_limit sebesseghatar FROM locations;

-- WHERE feltétel megadása 
SELECT * FROM locations WHERE speed_limit = 50;

-- WHERE feltételek vagy kapcsolattal
SELECT * FROM locations WHERE speed_limit = 50 OR house_number = 10;

-- WHERE feltételek és kapcsolattal
SELECT * FROM locations WHERE speed_limit = 50 and house_number = 10;

-- WHERE feltételek és-vagy kombinációval 
SELECT id, city, speed_limit FROM locations WHERE city = "Debrecen" OR (speed_limit <= 50 AND house_number > 30);

-- ORDER BY rendezés
SELECT * FROM locations ORDER BY city;

-- ORDER BY csökkenő sorrenddel
SELECT * FROM locations ORDER BY city DESC;

-- ORDER BY rendezés ALAPÉRTELMEZETT sorrenddel
SELECT * FROM locations ORDER BY city ASC;

-- ORDER BY rendezés több mező alapján
SELECT * FROM locations ORDER BY city DESC, speed_limit ASC;
SELECT * FROM locations ORDER BY city DESC, speed_limit DESC;

-- WHERE / ORDER kombinálása
SELECT * FROM locations WHERE speed_limit > 50 ORDER BY city DESC;

-- Az utasítások sorrendje:
-- SELECT - FROM
-- WHERE
-- ORDER BY
-- LIMIT 

-- Limit beállítása (rekordok számának beállítása)
SELECT * FROM locations WHERE speed_limit > 50 ORDER BY city DESC LIMIT 2;

-- LIMIT / OFFSET beállítása
SELECT * FROM locations WHERE speed_limit > 50 ORDER BY city DESC LIMIT 2 OFFSET 2;

-- GROUP BY rekordok csoportosítása 
SELECT city, COUNT(city) AS TALALATOK_SZAMA FROM locations GROUP BY city;

-- Csoportosítás városra, a maximum sebességkorlát keresésével
SELECT city, street, MAX(speed_limit) AS TALALATOK_SZAMA FROM locations GROUP BY city, street;

-- Kombinált utasítás
SELECT city, COUNT(speed_limit) FROM locations GROUP BY city ORDER BY city DESC LIMIT 5;

-- HAVING feltétel a csoportosítás után
SELECT city, COUNT(city) AS talalatok_szama FROM locations GROUP BY city HAVING talalatok_szama > 1;

-----------------------------------------------------

-- Összes tulajdonos kilistázása
SELECT * FROM owners;

-- Magyarra fordítása az oszlopneveknek
SELECT id azonosito, name nev, birth_date szuletesi_datum, address lakcim, phone telefonszam, email email FROM owners;

-- Autók táblából lekérdezzük a 2005 utáni autókat
SELECT * FROM vehicles WHERE year_of_manufacture >= 2020;

-- Tulajdonosok lekérdezése születési dátum alapján
SELECT * FROM owners WHERE birth_date > '1990-01-01';

-- Tulajdonosok lekérdezése születési dátum intervallum alapján
SELECT * FROM owners WHERE birth_date BETWEEN '1992-01-01' AND '1995-12-31'; 

-- Fizetett bírságok lekérdezése
SELECT * FROM fines WHERE paid = 1;

-- Szeptember 30-án született tulajdonosok lekérdezése
SELECT * FROM owners WHERE birth_date LIKE "%-30";

-- 40000 Ft-nál nagyobb összegű, de még ki nem fizetett bírságok lekérdezése
SELECT * FROM fines WHERE amount > 40000 AND paid = FALSE;

-- Fehér vagy fekete színű autók lekérdezése
SELECT * FROM vehicles WHERE color = 'fehér' OR color = 'fekete';

-- Fekete vagy fehér színű Volkswagen Golf autók lekérdezése
SELECT * FROM vehicles WHERE (color = 'fehér' OR color = 'fekete') AND (brand = 'Volkswagen' AND model = 'Golf');

-- Leggyorsabb gyorshajtás
SELECT * FROM measurements ORDER BY measured_speed DESC;