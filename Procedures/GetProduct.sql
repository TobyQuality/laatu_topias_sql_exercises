-- Listaa kaikki proseduurit
SHOW PROCEDURE STATUS;

-- Listaa kaikki proseduurit, jotka ovat tietokannassa shop
SHOW PROCEDURE STATUS WHERE db='shop';

-- Proseduuri, joka listaa kaikki tuotteet. HUOM!
-- Rivinlopetusmerkkiä ei ole vaihdettu

CREATE PROCEDURE GetProduct(IN productID INT)
BEGIN
    SELECT name
    FROM products
    WHERE id=productID;
END;

-- Alla toimiva versio samasta proseduurista.
DELIMITER &&
CREATE PROCEDURE GetProduct(IN productID INT)
BEGIN
    SELECT name
    FROM products
    WHERE id=productID;
END &&

DELIMITER ;