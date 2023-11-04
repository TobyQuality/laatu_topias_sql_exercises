/* 
Add users for the web news paper database. There should be at least two users defined, one for article authors who can post new articles
and another role for readers. Readers are not allowed to publish articles, but they can comment on them. Apply privileges to proper
tables for each user created.

Lisää käyttäjät verkkolehtitietokannalle. Tietokannan tulee sisältää ainakin kaksi käyttäjää, toinen artikkeleiden kirjoittajille ja toinen
artikkelijen lukijoille. Kirjoittaja voi julkaista uusia artikkeleita. Lukija ei voi julkaista artikkeleja, mutta tämä käyttäjä voi kommentoida niitä.
Anna luoduille käyttäjille tähän käyttötarkoitukseen soveltuvat oikeudet kuhunkin tauluun.
*/

// creating reader
CREATE USER 'reader'@'localhost' IDENTIFIED BY 'reader';
//granting reader privileges
GRANT INSERT, UPDATE, SELECT ON verkkolehti.comment TO 'reader'@'localhost';
GRANT SELECT ON verkkolehti.article TO 'reader'@'localhost';
GRANT SELECT ON verkkolehti.journalist TO 'reader'@'localhost';
GRANT SELECT ON verkkolehti.user TO 'reader'@'localhost';
// creating writer
CREATE USER 'writer'@'localhost' IDENTIFIED BY 'writer';
// creating writer priviliges
GRANT INSERT, UPDATE, SELECT ON verkkolehti.article TO 'writer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON verkkolehti.comment TO 'writer'@'localhost';
GRANT SELECT ON verkkolehti.journalist TO 'writer'@'localhost';
GRANT SELECT ON verkkolehti.user TO 'writer'@'localhost';