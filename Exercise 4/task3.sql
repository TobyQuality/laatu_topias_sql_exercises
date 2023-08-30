/*
Write a stored procedure which adds a comment to an article. Procedure should have error handling implemented.
A comment can be added if the commented article exists and the comment is written by a user who have permissions
to write comments (application user permissions, not database user). Define an out parameter for the procedure 
which describes wether there were errors or not and which type of error occured. Define all possible error codes
as a comment.

Kirjoita tallennettu proseduuri, joka lisää kommentin artikkeliin. Proseduurissa tulee olla määritettynä
virheenhallinta. Kommentti voidaan lisätä, jos kommentoitava artikkeli on olemassa ja kommentin on kirjoittanut käyttäjä,
jolla on oikeudet kommentoida postauksia (sovellustason oikeudet, ei tietokannan käyttäjän). Määritä OUT-tyyppinen parametri,
joka palauttaa virhekoodin. Määritä kaikki mahdolliset virhekoodit kommentissa.
*/


