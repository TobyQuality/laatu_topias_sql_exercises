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

DELIMITER //
CREATE PROCEDURE AddComment(
    IN article_id INT,
    IN user_id INT,
    IN comment TEXT,
    OUT exitCode INT
)
BEGIN

    DECLARE canComment INT DEFAULT 0;
    DECLARE articleExists INT DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET exitCode = -1;
        ROLLBACK;
    END;

    SELECT COUNT(*) INTO canComment
    FROM user
    WHERE id = user_id;

    SELECT COUNT(*) INTO articleExists
    FROM article
    WHERE id = article_id;

    IF canComment = 1 AND articleExists = 1 THEN
        START TRANSACTION;
        INSERT INTO comment (content, user_id, article_id) VALUES (comment, user_id, article_id);
        SET exitCode = 0;
        COMMIT;
    ELSEIF canComment = 0 THEN
        SET exitCode = 1;
    ELSE
        SET exitCode = 2;
    END IF;

END //

DELIMITER ;
    


