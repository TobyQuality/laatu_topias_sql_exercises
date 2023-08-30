/*
Insert a new album called "The Final Frontier" and all the tracks for that
album. Information of tracks is listed below. The artist is Iron Maiden, release year 2010.

Lisää uusi albumi tietokantaan. Albumin nimi on "The Final Frontier", julkaisuvuosi 2010. Artisti on Iron Maiden.
Kappaleiden tiedot on listattu alla, lisää myös ne tietokantaan.

 1. Satellite 15... The Final Frontier 8.40
 2. El Dorado 6.49
 3. Mother of Mercy Harris 5.20
 4. Coming Home 5.52
 5. The Alchemist 4.29
 6. Isle of Avalon 9.06
 7. Starblind 7.48
 8. The Talisman 9.03
 9. The Man Who Would Be King 8.28
 10. When the Wild Wind Blows 10.59
*/

INSERT INTO album VALUES (8, 'The Final Frontier', 2010, 1);
INSERT INTO track(name, length, track_number, album_id) VALUES("Satellite 15... The Final Frontier", "00:08:40", 1, 1),
("El Dorado", "000:06:49", 2, 1),
("Mother of Mercy Harris", "00:05:20", 3, 1),
("Coming Home", "00:05:52", 4, 1),
("The Alchemist", "00:04:29", 5, 1),
("Isle of Avalon", "00:09:06", 6, 1),
("Starblind", "00:07:48", 7, 1),
("The Talisman", "00:09:03", 8, 1),
("The Man Who Would Be King", "00:08:28", 9, 1),
("When the Wild Wind Blows", "00:10:59", 10, 1);