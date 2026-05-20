-- 1. magyar könyvek lekérdezése

SELECT * FROM books WHERE language = 'magyar';

-- 2. fantasy könyvek abc sorrendben
SELECT * FROM books WHERE genre = 'fantasy' ORDER BY title ASC;

-- 3. 3 legdrágább könyv ár szerint csökkenve
SELECT * FROM books ORder BY price DESC LIMIT 3;

-- 4. 1950-2000 közt megjelent könyvek, év szerint növekvő
SELECT * from books WHERE published_year BETWEEN 1950 AND 2000 ORDER BY published_year ASC;

--5. AZOk a könyvek ahol szerepel a névben a THE szó
SELECT * FROM books where title LIKE '%The%';

-- 6. angol nyelvű 9.0 minimális értékelés, értékelés szerint csökken
SELECT * from BOOKS WHERE language = 'angol' and rating >= 9.0 ORDER by rating DESC;

--7. minden könyv ami SICFI vagy DYSTOPIA 
select * FROM books WHERE genre = 'scifi' or genre = 'dystopia';

--8. 3000-4500 ft között, legalabb 250 oldal , ar szerint novekvo
SELECt * FROM books WHERE price BETWEEN 3000 AND 4500 and pages >= 250 ORDER BY price asc;

--9. magyar nyelvu konyvek, A betu szerepel benne, abc sorrendben cim szerint
SELECT * from BOOKS WHERE language = 'magyar' and title like '%a%' ORDER BY title ASC;

-- 10. ELSŐ 5 könyv, ami 300 oldalnal hosszabb vagy ertekelese legalabb 9.0, ertekeles szerint csokken elso 5 talalt
select * FROM books where pages > 300 or rating >= 9.0 ORDER BY rating desc LIMIT 5;

-- Molnár Maxim 
