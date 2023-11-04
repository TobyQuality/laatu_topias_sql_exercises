DROP PROCEDURE IF EXISTS CreateOrder;

DELIMITER //
/*
Parametrit:
-- IN productID: INT; tuotteen id
-- IN amount: INT; tilattava määrä
-- IN customerID: INT; asiakkaan id
-- IN sellerID: INT; myyjän id
-- OUT orderID; INT; tilauksen id
-- OUT exitCode: INT; poistumiskooodi
    --0: tilaus luoto onnistuneesti
    --1: tuotetta ei löytynyt
    --2: tuotetta ei ollut tarpeeksi varastossa
    --3: asiakasta ei löytynyt
    --4: myyjää ei löytynyt
    --5: SQL-poikkeus
*/
CREATE PROCEDURE CreateOrder(
    IN productID INT,
    IN count INT,
    IN customerID INT,
    IN sellerID INT,
    OUT orderID INT,
    OUT exitCode INT
)
BEGIN
    -- Määritetään muuttujat
    DECLARE productsAvailable INT DEFAULT 0;

    -- Virheiden käsittely
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET exitCode = -5;
        ROLLBACK;
    END;

    -- Varsinainen toiminnallisuus alkaa tästä
    -- Varmistetaan, että tuotteita on tarpeeksi
    -- SELECT INTO asettaa haetun arvon muuttujaan
    SELECT amount INTO productsAvailable
    FROM productsAvailable
    WHERE id = productID;

    IF productsAvailable >== orderAmount THEN
        START TRANSACTION;
        INSERT INTO orders (customer_id, seller_id) VALUES(customer_id, seller_id);
        SET orderID = LAST_INSERT_ID();

        INSERT INTO orders (order.id, product_id, amount)
            VALUES(LAST_INSERT_ID(), productID, orderAmount);
        UPDATE products SET amount = amount - orderAmount WHERE id = productID;

        SET exitCode = 0;

        COMMIT;
    ELSE
        SET exitCode = -2;
    END IF;
END //

DELIMITER ;
