/*
Design and implement a view into the Shop database, which lists products and their related orders.
The result should include product's name, order id and customer's name.

Suunnittele ja toteuta näkymä Shop-tietokantaan, joka listaa tuotteet ja niihin liittyvät tilaukset. 
Tuloksessa tulisi olla mukana tuotteen nimi, tilauksen id ja tilanneen asiakkaan nimi.
*/

CREATE VIEW ProductOrders AS
SELECT products.name, orders.id, CONCAT(customers.first_name, ' ', customers.last_name) AS customer_name
FROM products
INNER JOIN orders ON products.id = orders.product_id
INNER JOIN customers ON orders.customer_id = customers.id;
ORDER BY products.name, orders.id;

