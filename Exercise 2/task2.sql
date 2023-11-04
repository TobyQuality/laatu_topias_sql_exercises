/*
Listaa kaikki ruokalajit, joissa on käytetty ainesosaa "Peruna".

List all the dishes which contains ingredient "Peruna".
*/

SELECT d.name from dishes d INNER JOIN contains c ON d.id = c.dish_id
INNER JOIN ingredients i ON c.ingredient_id = i.id
WHERE i.name = "Peruna";