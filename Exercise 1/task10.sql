/* 
Calculate and return the count of albums each band has in the database.
Include Artist name and album count into the result.
Name the result columns as "Artist" and "Album count".
*/

SELECT artist.name AS "Artist", COUNT(album.id) AS "Album count" FROM artist INNER JOIN album 
ON artist.id = album.artist_id GROUP BY artist.id;