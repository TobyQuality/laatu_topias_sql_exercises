/* 
Calculate and return the count of albums each band has in the database.
Include Artist name and album count into the result.
Name the result columns as "Artist" and "Album count".
*/

SELECT art.name AS "Artist", al.artist_id AS "Album count" FROM artist art RIGHT JOIN album al ON art.id = al.artist_id WHERE al.artist_id = count(al.artist_id);