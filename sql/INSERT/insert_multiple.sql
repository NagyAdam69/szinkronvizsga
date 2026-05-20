-- Molnár Maxim

-- Users tábla feltöltése

INSERT INTO users (uid, name, email, password, role, mobile, address, identitycardnumber, is_active, updated_at)
VALUES (NULL, 'Lionel Messi', 'messi@fcbarcelona.es', 'football123', 'user', '+3630111177', 'Barcelona, Camp Nou Stadium', '10100FC', 2, current_timestamp()),
 (NULL, 'Michael Jackson', 'jackson.michael@network.net', 'michaelL', 'user', '+672112361', '42017, Palermo, Strata Villa 1', 'MC120202', 0, current_timestamp()),
 (NULL, 'Barna Bucsú', 'bartabulcsu@gmail.com', 'kiborggeorge', 'főadmin', '+36707257247', '6065 Lakitelek, Csokonai Utca 6.', 'BB6769136', 1, current_timestamp()),
 (NULL, 'Köröskényi István', 'mcisti@gmail.com', 'mcisti111', 'user', '+36301111111', 'Nyíreyháza, utca út 3', 'KB11031', 1, current_timestamp()),
 (NULL, 'Bármi Áron', 'aron.barmi@citromail.hu', 'barmi!aron4', 'librarian', '+36904503236', 'Balotaszállás, Szondi u. 8', '135510BA', 0, current_timestamp()),
 (NULL, 'John Doe', 'john.doe@example.com', 'johnny123', 'user', '+36123456789', 'Budapest, Fő utca 1', 'JD123456', 1, current_timestamp()),
 (NULL, 'Jane Doe', 'jane.doe@library.hu', 'janeDoe!', 'librarian', '+36987654321', 'Szeged, Kossuth Lajos sgt. 5', 'JD654321', 1, current_timestamp()),
 (NULL, 'Donald Trump', 'trump@usa.com', 'trump2024', 'user', '+14155552671', 'New York, Trump Tower', 'DT2024', 1, current_timestamp()),
 (NULL, 'Orbán Viktor', 'orban.viktor@fidesz.hu', 'orban2024', 'user', '+36123456789', 'Budapest, Kossuth Lajos tér 1', 'OV2024', 1, current_timestamp()),
 (NULL, 'Nagy Ádám', 'nagyi@lakitelek.hu', 'nagyi2010', 'user', '+36901234567', 'Lakitelek, Petőfi Sándor u. 10', 'NA2024', 1, current_timestamp()),
 (NULL, 'Kovács Zoltán', 'kovizoli@zoli.net', 'zsmith1020', 'adminisztrátor', '+36909876543', 'Debrecen, Piac u. 3', 'KZ2024', 1, current_timestamp()),
 (NULL, 'Kovács Zalán', 'kzalaaan@zoli.net', 'zsmith1020', 'adminisztrátor', '+36909876544', 'Debrecen, Piac u. 4', 'KZ2025', 1, current_timestamp()),
 (NULL, 'Szabó László', 'szabo.laszlo@zoli.net', 'ltalior2311', 'user', '+36909876545', 'Debrecen, Piac u. 5', 'KZ2026', 1, current_timestamp()),
 (NULL, 'Szoboszlai Dominik', 'szoboszlai@mlsz.hu', 'dominik11', 'user', '+36301234567', 'Budapest, Puskás Aréna', 'SD2024', 1, current_timestamp()),
 (NULL, 'Nagy B. Ödön', 'odonbnagy@gmail.com', 'odon!!44', 'user', '+36307654321', 'Győr, Rába Park', 'NBO2024', 2, current_timestamp()),
 (NULL, 'Seong Gi-hun', 'gihun@squid.game', 'player456', 'user', '+821012345678', 'Seoul, South Korea', 'SGH2024', 1, current_timestamp()),
 (NULL, 'White Walter', 'walter.white@alberquerque.com', 'heisenberg067', 'adminisztrátor', '+15055551234', 'Albuquerque, New Mexico', 'WW2024', 1, current_timestamp()),
 (NULL, 'Eliott Alderson', 'eliott@fsociety.com', 'fsociety123', 'user', '+12025551234', 'New York, USA', 'EA2024', 1, current_timestamp()),
 (NULL, 'Tony Stark', 'tony.stark@starkindustries.com', 'ironman123', 'user', '+14155551234', 'Los Angeles, California', 'TS2024', 1, current_timestamp());

-- Language tábla feltöltése
INSERT INTO languages (lid, language) 
VALUES (1, 'English'),
         (2, 'Hungarian'),
         (3, 'German'),
         (4, 'French'),
         (5, 'Spanish');

-- kiadók feltöltése
INSERT INTO publishers (pid, name, email, address, phone)
VALUES (1, 'Alma könyvkiadó', 'almakonyv@kiado.com', '6000 Kecskemét, Kiadó u. 1', '06-70-123-4567'),
       (2, 'Libri Kiadó', 'libri@kiado.com', '1052 Budapest, Kossuth Lajos tér 1', '06-80-123-4567'),
       (3, 'Cartaphilus Kiadó', 'cartaphilus@kiado.com', '1111 Budapest, Bartók Béla út 1', '06-90-123-4567'),
       (4, 'Európa Könyvkiadó', 'europa@kiado.com', '1054 Budapest, Széchenyi István tér 7', '06-20-123-4567');



-- Könyvek tábla feltöltése
INSERT INTO books (isbn, title, subtitle, pagenumber, edition, publication_year, lid, publishers_pid)
VALUES
    ('978-3-16-148410-0', 'The Great Gatsby', NULL, 180, 1, 1925, 1, 1),
    ('978-0-14-028333-4', '1984', NULL, 328, 1, 1949, 1, 2),
    ('978-0-7432-7356-5', 'To Kill a Mockingbird', NULL, 281, 1, 1960, 1, 3),
    ('978-0-452-28423-4', 'Pride and Prejudice', NULL, 279, 1, 1813, 1, 4),
    ('978-0-316-76948-0', 'The Catcher in the Rye', NULL, 214, 1, 1951, 1, 1),
    ('978-0-7432-7355-8', 'The Hobbit', NULL, 310, 1, 1937, 1, 1),
    ('978-0-14-243723-0', 'Metamorphosis', NULL, 201, 1, 1915, 1, 1),
    ('978-0-452-28425-8', 'Central Park', NULL, 350, 1, 2014, 1, 1),
    ('978-0-316-76949-7', 'Save Me', NULL, 208, 1, 1988, 1, 1),
    ('978-0-7432-7357-2', 'The Da Vinci Code', NULL, 454, 1, 2003, 1, 1),
    ('978-0-14-243724-7', 'Lord of The Rings', 'Two Towers', 352, 1, 1954, 1, 1),
    ('978-0-452-28426-5', 'The Road', NULL, 287, 1, 2006, 1, 1),
    ('978-0-316-76950-3', 'Life of Pi', NULL, 331, 1, 2001, 1, 1),
    ('978-0-7432-7358-9', 'The Alchemist', NULL, 208, 1, 1988, 1, 1),
    ('978-0-14-243725-4', 'Brave New World', NULL, 268, 1, 1932, 1, 1),
    ('978-0-452-28427-2', 'The Book Thief', NULL, 552, 1, 2005, 1, 1),
    ('978-0-316-76951-0', 'The Hunger Games', NULL, 374, 1, 2008, 1, 1),
    ('978-0-7432-7359-6', 'Fifty Shades of Grey', NULL, 514, 1, 2011, 1, 1),
    ('978-0-14-243726-1', 'The Fault in Our Stars', NULL, 313, 1, 2012, 1, 1),
    ('978-0-452-28428-9', 'Gone Girl', NULL, 432, 1, 2012, 1, 1);

-- Kategóriák feltöltése
INSERT INTO categories (cid, name, description, parent_id, updated_at)
VALUES
    (1, 'Fikció', 'Fikciós könyvek', NULL, current_timestamp()),
    (2, 'Sci-fi', 'Science Fiction könyvek', 1, current_timestamp()),
    (3, 'Fantasy', 'Fantasy könyvek', 1, current_timestamp()),
    (4, 'Rejtély', 'Rejtélyekkel foglalkozó könyvek', 1, current_timestamp()),
    (5, 'Életrajz', 'Életrajzi könyvek', NULL, current_timestamp()),
    (6, 'Történelmi', 'Történelmi témájú könyvek', NULL, current_timestamp()),
    (7, 'Romantikus', 'Romantikus könyvek', 1, current_timestamp()),
    (8, 'Non-fiction', 'Nem fikciós könyvek', NULL, current_timestamp()),
    (9, 'Önfejlesztés', 'Önfejlesztő könyvek', 8, current_timestamp()),
    (10, 'Üzlet és Gazdaság', 'Üzleti és gazdasági témájú könyvek', 8, current_timestamp()),
    (11, 'Gyermekkönyvek', 'Gyermekeknek szóló könyvek', NULL, current_timestamp()),
    (12, 'Ifjúsági irodalom', 'Ifjúsági könyvek', 11, current_timestamp()),
    (13, 'Képregények', 'Képregények és grafikus novellák', 11, current_timestamp()),
    (14, 'Tudomány', 'Tudományos könyvek', 8, current_timestamp()),
    (15, 'Művészet és Dizájn', 'Művészeti és dizájn témájú könyvek', 8, current_timestamp()),
    (16, 'Utazás', 'Utazási könyvek és útikalauzok', 8, current_timestamp()),
    (17, 'Gasztronómia', 'Főzési és gasztronómiai könyvek', 8, current_timestamp()),
    (18, 'Egészség és Wellness', 'Egészségügyi és wellness könyvek', 8, current_timestamp()),
    (19, 'Sport', 'Sporttal kapcsolatos könyvek', 8, current_timestamp()),
    (20, 'Zene', 'Zenei témájú könyvek', 8, current_timestamp());

-- Írók feltöltése
INSERT INTO authors(aid, firstname, lastname, birth_date, death_date, nationality, created_at, updated_at)
VALUES
    (1, 'George', 'Orwell', '1903-06-25', '1950-01-21', 'Brit', current_timestamp(), current_timestamp()),
    (2, 'Harper', 'Lee', '1926-04-28', '2016-02-19', 'Amerikai', current_timestamp(), current_timestamp()),
    (3, 'Joanne', 'Rowling', '1965-07-31', NULL, 'Brit', current_timestamp(), current_timestamp()),
    (4, 'John Ronald Reuel', 'Tolkien', '1892-01-03', '1973-09-02', 'Brit', current_timestamp(), current_timestamp()),
    (5, 'Francis Scott', 'Fitzgerald', '1896-09-24', '1940-12-21', 'Amerikai', current_timestamp(), current_timestamp()),
    (6, 'Markus', 'Zusak', '1975-06-23', NULL, 'Ausztrál', current_timestamp(), current_timestamp()),
    (7, 'Suzanne', 'Collins', '1962-08-10', NULL, 'Amerikai', current_timestamp(), current_timestamp()),
    (8, 'Dan', 'Brown', '1964-06-22', NULL, 'Amerikai', current_timestamp(), current_timestamp()),
    (9, 'John', 'Green', '1977-08-24', NULL, 'Amerikai', current_timestamp(), current_timestamp()),
    (10, 'Gillian', 'Flynn', '1971-02-24', NULL, 'Amerikai', current_timestamp(), current_timestamp()),
    (11, 'Franz', 'Kafka', '1883-07-03', '1924-06-03', 'Cseh', current_timestamp(), current_timestamp());
    (12, 'J.K.', 'Rowling', '1965-07-31', NULL, 'Brit', current_timestamp(), current_timestamp()),
    (13, 'C.S.', 'Lewis', '1898-11-29', '1963-11-22', 'Brit', current_timestamp(), current_timestamp()),
    (14, 'Aldous', 'Huxley', '1894-07-26', '1963-11-22', 'Brit', current_timestamp(), current_timestamp()),
    (15, 'Margaret', 'Atwood', '1939-11-18', NULL, 'Kanadai', current_timestamp(), current_timestamp()),
    (16, 'Paulo', 'Coelho', '1947-08-24', NULL, 'Brazíliai', current_timestamp(), current_timestamp()),
    (17, 'Suzanne', 'Collins', '1962-08-10', NULL, 'Amerikai', current_timestamp(), current_timestamp()),
    (18, 'E.L.', 'James', '1963-03-07', NULL, 'Brit', current_timestamp(), current_timestamp()),
    (19, 'Cormac', 'McCarthy', '1933-07-20', NULL, 'Amerikai', current_timestamp(), current_timestamp()),
    (20, 'Yann', 'Martel', '1963-06-25', NULL, 'Kanadai', current_timestamp(), current_timestamp());