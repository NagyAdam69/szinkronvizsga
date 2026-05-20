-- Gyakorló feladatok - SELECT utasítások
-- Speed Measurements Database - Query Exercises
-- speed_measurements adatbázishoz

-- ========================================
-- EGYSZERŰ LEKÉRDEZÉSEK (FROM)
-- ========================================

-- 1. Listázd ki az összes tulajdonost!
SELECT * FROM owners;

-- 2. Listázd ki az összes járművet!
SELECT * FROM vehicles;

-- 3. Listázd ki az összes mérési helyszínt!
SELECT * FROM locations;

-- 4. Listázd ki az összes mérőeszközt!
SELECT * FROM measuring_devices;

-- 5. Listázd ki az összes mérést!
SELECT * FROM measurements;


-- ========================================
-- ALIAS HASZNÁLATA
-- ========================================

-- 6. Listázd ki a tulajdonosok nevét és email címét magyar oszlopnevekkel!
SELECT name AS 'Név', email AS 'Email cím' FROM owners;

-- 7. Listázd ki a járművek rendszámát és márkáját magyar oszlopnevekkel!
SELECT license_plate AS 'rendszám', brand as 'márka' FROM vehicles;

-- 8. Listázd ki a mérések sebességét "Mért sebesség" néven!
SELECT measured_speed AS 'mért sebesség' FROM measurements;


-- ========================================
-- WHERE FELTÉTELEK
-- ========================================

-- 9. Melyik helyszínek sebességkorlátja 50 km/h?
SELECT * FROM locations WHERE speed_limit = 50;

-- 10. Listázd ki azokat a járműveket, amelyek 2021-ban vagy később készültek!
SELECT * FROM vehicles WHERE year_of_manufacture >= 2021;

-- 11. Melyik mérések esetén a mért sebesség meghaladta a 80 km/h-t?
SELECT * FROM measurements WHERE measured_speed > 80;

-- 12. Listázd ki a budapesti helyszíneket!
SELECT * FROM locations WHERE city = 'Budapest';

-- 13. Melyik tulajdonosok születtek 1995 előtt?
SELECT * FROM owners WHERE birth_date < '1995-01-01';

-- 14. Listázd ki a fekete színű járműveket!
SELECT * FROM vehicles WHERE color = 'fekete';

-- 15. Melyik bírságok vannak még kifizetetlenül?
SELECT * FROM fines WHERE paid = FALSE;

-- 16. Listázd ki azokat a méréseket, amelyek 2024 februárjában történtek!
SELECT * FROM measurements WHERE measurement_date >= '2024-02-01' AND measurement_date < '2024-02-29';

-- 17. Melyik mérőeszközök típusa "radar"?
SELECT * FROM measuring_devices WHERE device_type = 'radar';

-- 18. Listázd ki azokat a helyszíneket, ahol a sebességkorlát 60 km/h vagy annál nagyobb!
SELECT * FROM locations WHERE speed_limit >= 60;


-- ========================================
-- WHERE ÉS TÖBB FELTÉTEL (AND, OR)
-- ========================================

-- 19. Listázd ki a budapesti helyszíneket, ahol a sebességkorlát 50 km/h!
SELECT * FROM locations WHERE city = 'Budapest' AND speed_limit = 50;

-- 20. Melyik járművek BMW vagy Audi márkájúak?
SELECT * FROM vehicles WHERE brand = 'BMW' OR brand = 'Audi';

-- 21. Listázd ki azokat a méréseket, ahol a sebesség 70 és 90 km/h között volt!
SELECT * FROM measurements WHERE measured_speed >= 70 AND measured_speed <= 90;

-- 22. Melyik bírságok összege nagyobb mint 40000 Ft ÉS még nincsenek kifizetve?
SELECT * FROM fines WHERE amount > 40000 and paid = FALSE;

-- 23. Listázd ki a fehér vagy fekete járműveket!
select * from vehicles where color = 'fehér' OR color = 'fekete';


-- ========================================
-- ORDER BY (RENDEZÉS)
-- ========================================

-- 24. Listázd ki a tulajdonosokat név szerint ABC sorrendben!
SELECT * FROM owners ORDER BY name ASC;

-- 25. Listázd ki a járműveket gyártási év szerint csökkenő sorrendben!
SELECT * FROM vehicles ORDER BY year_of_manufacture DESC;

-- 26. Melyik mérések történtek, rendezve a mért sebesség szerint csökkenő sorrendben?
SELECT * FROM measurements ORDER BY measured_speed DESC;

-- 27. Listázd ki a bírságokat összeg szerint növekvő sorrendben!
SELECT * FROM fines ORDER BY amount ASC;

-- 28. Rendezd a helyszíneket város, majd utca szerint ABC sorrendben!
select * FROM locations ORDER BY city ASC, street asc;

-- 29. Listázd ki a méréseket dátum szerint csökkenő, majd időpont szerint növekvő sorrendben!
SELECT * FROM measurements order by measurement_date DESC, measurement_time ASC;


-- ========================================
-- LIMIT (KORLÁTOZÁS)
-- ========================================

-- 30. Listázd ki az első 5 tulajdonost!
SELECT * FROM owners LIMIT 5;

-- 31. Melyek a 3 leggyorsabb mérés?
SELECT * FROM measurements ORDER BY measured_speed DESC LIMIT 3;

-- 32. Listázd ki a 10 legdrágább bírságot!
SELECT * FROM fines ORDER BY amount DESC LIMIT 10;

-- 33. Melyik 5 jármű a legfiatalabb (legújabb gyártású)?
select * from vehicles ORDER BY year_of_manufacture DESC LIMIT 5;

-- 34. Listázd ki az első 3 helyszínt, ahol a legnagyobb a sebességkorlát!
SELECT * FROM locations ORDER BY speed_limit DESC LIMIT 3;

-- 35. Kik az első 5 tulajdonos, születési dátum szerint növekvő sorrendben?
SELECT * FROM owners ORDER BY birth_date ASC LIMIT 5;


-- ========================================
-- GROUP BY ÉS AGGREGÁLÓ FÜGGVÉNYEK
-- ========================================

-- 36. Hány mérés történt helyszínenként?
SELECT location_id, COUNT(*) AS meresi_helyek FROM measurements GROUP BY location_id;

-- 37. Melyik városból van a legtöbb helyszín rögzítve az adatbázisban?
SELECT city, COUNT(*) AS meresi_helyek FROM locations GROUP BY city ORDER BY meresi_helyek DESC LIMIT 1;

-- 38. Hány jármű van gyártási évenként?
SELECT year_of_manufacture, COUNT(*) AS jarmuvek_szama FROM vehicles GROUP BY year_of_manufacture;

-- 39. Mi az átlagos mért sebesség helyszínenként?
SELECT location_id, AVG(measured_speed) AS atlagos_mert_sebesseg FROM measurements GROUP BY location_id;

-- 40. Mennyi a bírságok összege tulajdonlás szerint (járművenként)?
SELECT vehicle_id, SUM(amount) AS birsag_osszeg FROM fines GROUP BY vehicle_id;

-- 41. Hány mérést végzett mindegyik mérőeszköz?
select device_id, COUNT(*) AS meresek_szama FROM measurements GROUP BY device_id;

-- 42. Mi a legmagasabb mért sebesség járművenként?
SELECT vehicle_id, MAX(measured_speed) AS legmagasabb_mert_sebesseg FROM measurements GROUP BY vehicle_id;

-- 43. Hány bírság van fizetési státusz szerint (fizetve/fizetetlen)?
SELECT paid, COUNT(*) AS birsagok_szama FROM fines GROUP BY paid;

-- ========================================
-- HAVING (CSOPORTOK SZŰRÉSE)
-- ========================================

-- 44. Melyik helyszíneken történt legalább 3 mérés?
select location_id, COUNT(*) AS meresek_szama FROM measurements GROUP BY location_id HAVING meresek_szama >= 3;

-- 45. Melyik városokban van legalább 2 mérési helyszín?
SELECT city, COUNT(*) AS meresi_helyek FROM locations GROUP BY city HAVING meresi_helyek >= 2;

-- 46. Melyik járműveknek van legalább 2 mérése?
SELECT vehicle_id, COUNT(*) AS meresek_szama FROM measurements GROUP BY vehicle_id HAVING meresek_szama >= 2;

-- 47. Melyik helyszíneken az átlagos mért sebesség meghaladja a 65 km/h-t?
SELECT location_id, AVG(measured_speed) AS atlagos_mert_sebesseg FROM measurements GROUP BY location_id HAVING atlagos_mert_sebesseg > 65;