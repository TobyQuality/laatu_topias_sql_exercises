/*
Create a database based on last week's task 4. In that task we designed a database for a web news paper. The database has
to follow the plan created last week. If you need to update the plan, include an updated drawing of the
database to your return. Add foreign key restrictions for the tables as well.

Luo tietokanta viime viikon tehtävän 3 perusteella. Tuossa tehtävässä suunittelimme tietokannan verkkolehdelle.
Tietokannan tulee noudattaa viime viikon suunitelmaa. Jos suunnitelmaan pitää tehdä muutoksia, lisää palautukseen
mukaan kuva päivitetyn tietokannan rakenteesta. Lisää myös vierasavainrajoitteet tauluille.
*/

CREATE TABLE article(id INT AUTO_INCREMENT, 
article_name VARCHAR(255) NOT NULL, 
date DATETIME NOT NULL, 
journalist_id INT NOT NULL,
content LONGTEXT NOT NULL,
PRIMARY KEY(id), 
FOREIGN KEY (journalist_id) REFERENCES journalist(id) ON DELETE RESTRICT ON UPDATE CASCADE);

CREATE TABLE journalist(
id INT AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE user(
id INT AUTO_INCREMENT,
user_name VARCHAR(100) NOT NULL,
password TEXT NOT NULL,
email VARCHAR(256) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE comment(
id INT AUTO_INCREMENT,
content TEXT NOT NULL,
user_id INT NOT NULL,
article_id INT NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (user_id) REFERENCES user(id),
FOREIGN KEY (article_id) REFERENCES article(id)
);
