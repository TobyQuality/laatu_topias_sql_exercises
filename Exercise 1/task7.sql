/*
Fetch album and track information for the artist "Iron Maiden".
Select album name, album year, track name, track number and track length to the result.
Sort the result primarily by album name and secondarily by track number.

Hae albumien ja kappaleiden tiedot artistille "Iron Maiden".
Ota tulosjoukkoon mukaan albumin nimi, albumin julkaisuvuosi, kappaleen nimi ja kappaleen pituus.
Järjestä tulosjoukko ensisijaisesti albumin nimen ja toissijaisesti kappaleen numeron mukaan.
*/
SELECT al.name AS "album name", al.year, t.name AS "track", t.length FROM track t 
JOIN album al ON t.album_id = al.id JOIN artist art 
ON al.artist_id = art.id WHERE art.id = 1 ORDER BY al.name, t.track_number;