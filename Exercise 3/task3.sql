/*
In some use cases we cound have multiple users with identical or very similar privileges. For this SQL defines user roles. Roles are predefined sets of
privileges which can be granted for users and toggled on or off. In our news paper website example there could be separate roles for e.g. authors and readers.
Define those roles and apply suitable privileges for them. Remove existing privileges from users created in the previous task and replace them with 
newly created roles. Enable roles for users.

Joissain järjestelmissä voimme tarvita useita eri käyttäjiä, joilla on samat tai lähes samat käyttöoikeudet. Tätä käyttötapausta varten SQL määrittää
roolit. Rooli on ennalta määritelty joukko käyttöoikeuksia, jotka voidaan antaa käyttäjille oikeuksien sijaan (tai lisäksi) ja jotka voidaan kytkeä päälle
tai pois tarvittaessa. Verkkolehtitietokantaesimerkissämme voisi olla esimerkiksi määritettynä roolit artikkelin kirjoittajalle ja lukijalle. Määritä nämä
roolit ja anna soveltuvat käyttöoikeudet näille. Poista aiemmin määrittelemämme oikeudet aiemmassa tehtävässä määrittämiltämme käyttäjiltä ja korvaa ne uusilla
roolimäärityksillä. Ota uudet roolit käyttöön.
*/

/* revoke privileges from users */

REVOKE ALL PRIVILEGES ON verkkolehti.* FROM 'writer'@'localhost';
REVOKE ALL PRIVILEGES ON verkkolehti.* FROM 'user'@'localhost';

/* create writer role */

CREATE ROLE 'writer';

GRANT INSERT, UPDATE, SELECT ON verkkolehti.article TO writer;
GRANT SELECT, INSERT, UPDATE ON verkkolehti.comment TO writer;
GRANT SELECT ON verkkolehti.journalist TO writer;
GRANT SELECT ON verkkolehti.user TO writer;

SET DEFAULT ROLE writer FOR 'writer'@'localhost';


/* create role user */
CREATE ROLE 'user';

GRANT INSERT, UPDATE, SELECT ON verkkolehti.comment TO user;
GRANT SELECT ON verkkolehti.article TO user;
GRANT SELECT ON verkkolehti.journalist TO user;
GRANT SELECT ON verkkolehti.user TO user;

SET DEFAULT ROLE reader FOR 'reader'@'localhost';

/* create role admin */

CREATE ROLE 'admin';

GRANT ALL PRIVILEGES ON verkkolehti.* TO admin;

SET DEFAULT ROLE admin FOR 'admin'@'localhost';