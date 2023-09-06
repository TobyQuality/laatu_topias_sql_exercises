/*
Fetch all the tracks which length is less than one minute or more than five minutes.
Order the results in ascending order based on the length.

Hae kaikki kappaleet, joiden pituus on vähemmän kuin yhden minuutin tai enemmän kuin viisi minuuttia. 
Järjestä kappaleet nousevaan järjestykseen pituuden perusteella.
*/
SELECT * FROM track WHERE length <= "00:01" OR length > "00:04:59" ORDER BY length asc;
