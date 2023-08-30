/*
Create a new table called review. The table should have the columns listed below.
Choose proper data types for each column.

Luo uusi taulu, jonka nimi on review. Taulussa pitää olla alla listatut sarakkeet.
Valitse sarakkeille sopivat tietotyypit.

 - id
 - name of the reviewer, not null
 - headline
 - review text
 - a reference to the album id which is reviewed, not null
*/

CREATE TABLE review (id INT AUTO_INCREMENT,
    name_of_the_reviewer VARCHAR(255) NOT NULL,
    headline VARCHAR(255),
    review_text LONGTEXT,
    album_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (album_id) REFERENCES album(id));