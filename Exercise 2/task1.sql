/*
Listaa ruokalajin "Lihapiirakka" kaikki ainesosat.

List all the ingredients which are used in the dish "Lihapiirakka".
*/

SELECT i.name FROM ingredients i INNER JOIN contains c 
ON i.id = c.ingredient_id INNER JOIN dishes d ON c.dish_id = d.id WHERE d.name='Lihapiirakka';