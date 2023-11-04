/*
One reason to use views is information security. In some cases the user has to have access to some data in a table, but not all of it. An example about this
case can be the previous task's Customers table from the user could have to fetch customer's name but nothing else. Create a new user to the database and
grant that user access to query data using the view defined in the previous task. Don't grant user a direct access to tables.

Yksi syy käyttää näkymiä liittyy tietoturvaan. Joissain tapauksissa käyttäjän pitää pystyä hakemaan tietyn solun tai solujen sisältö taulusta, mutta
ei koko taulun sisältöä. Esimerkiksi edellisen tehtävän asiakastaulu voisi olla tällainen (asiakkaan nimen haku). Määritä uusi käyttäjä tietokantaan ja
määritä tälle käyttäjälle oikeus hakea dataa edellisen tehtävän näkymää käyttäen, mutta älä anna käyttäjälle oikeutta hakea tietoa suoraan näkymän
käyttävistä tauluista.
*/

-- Create a view that has only customer's name
CREATE VIEW CustomerNames AS
SELECT CONCAT(first_name, ' ', last_name) AS customer_name
FROM customers
ORDER BY customer_name;

-- Create a customer a user
CREATE USER 'customer'@'localhost' IDENTIFIED BY 'customer';

-- Grant the user access to the view
GRANT SELECT ON shop.CustomerNames TO 'customer'@'localhost';

