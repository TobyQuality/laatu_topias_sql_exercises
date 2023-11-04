/*
Kirjoita kysely, joka palauttaa niiden ruokalajien määrän, jotka sisältävät ainesosan "Sipuli".

Write a query which returns the amount of dishes that contain ingredient "Sipuli".
*/

SELECT d.name, c.amount FROM dishes d INNER JOIN contains c ON d.id = c.dish_id
INNER JOIN ingredients i ON c.ingredient_id = i.id
WHERE c.ingredient_id = 3;