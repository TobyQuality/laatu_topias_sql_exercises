DROP PROCEDURE IF EXISTS CreateOrder;

DELIMITER //
/*
Parametrit:
- IN productID: INT; tuotteen id
- IN orderAmount: INT; tilattava määrä
- IN customerID: INT; asiakkaan id
- IN sellerID: INT; myyjän id
- OUT orderID: INT; tilauksen id
- OUT exitCode: INT; poistumiskoodi
  - 0: tilaus luotu onnistuneesti
  - -1: tuotetta ei löytynyt
  - -2: tuotetta ei ollut tarpeeksi varastossa
  - -3: asiakasta ei löytynyt
  - -4: myyjää ei löytynyt
  - -5: SQL-poikkeus
*/
CREATE PROCEDURE CreateOrder(
  IN productID INT,
  IN orderAmount INT,
  IN customerID INT,
  IN sellerID INT,
  OUT orderID INT,
  OUT exitCode INT
)
create_proc: BEGIN
  -- Määritetään muuttujat
  DECLARE productsAvailable INT DEFAULT 0;
  DECLARE debug BOOL DEFAULT TRUE;
  DECLARE productExists BOOL DEFAULT FALSE;
  DECLARE customerExists BOOL DEFAULT FALSE;
  DECLARE sellerExists BOOL DEFAULT FALSE;

  -- Virheiden käsittely
  -- https://www.mysqltutorial.org/mysql-error-handling-in-stored-procedures/
  -- https://mariadb.com/ja/resources/blog/improve-your-stored-procedure-error-handling-with-get-diagnostics/
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    SET exitCode = -5;
    ROLLBACK;
  END;

  -- Varsinainen toiminnallisuus alkaa tästä
  -- Varmistetaan, että tuotteuta on tarpeeksi
  -- SELECT INTO asettaa haetun arvon muuttujaan
  SELECT amout INTO productsAvailable
  FROM products
  WHERE id = productID;

  -- Tuotteiden määrä haettu
  CALL debug_msg(debug, "Tuotteiden määrä haettu");

  -- Tarkistetaan, onko tuotetta olemassa
  SELECT EXISTS (SELECT * FROM products WHERE id = productID) INTO productExists;
  IF NOT productExists THEN
    SET exitCode = -1;
    CALL debug_msg(debug, "Tuotetta ei löytynyt");
    LEAVE create_proc; -- Poistutaan proseduurista, joka on merkattu labelilla create_proc
  END IF;

  -- Tarkistetaan, onko asiakasta olemassa
  SELECT EXISTS (SELECT * FROM customers WHERE id = customerID) INTO customerExists;
  IF NOT customerExists THEN
    SET exitCode = -3;
    CALL debug_msg(debug, "Asiakasta ei löytynyt");
    LEAVE create_proc;
  END IF;

  -- Tarkistetaan, onko myyjää olemassa
  SELECT EXISTS (SELECT * FROM employees WHERE id = sellerID) INTO sellerExists;
  IF NOT sellerExists THEN
    SET exitCode = -4;
    CALL debug_msg(debug, "Myyjää ei löytynyt");
    LEAVE create_proc;
  END IF;

  IF productsAvailable >= orderAmount THEN
    -- TODO: Lisää tähän tarkistus, onko asiakas ja myyjä olemassa
    START TRANSACTION;
    
    INSERT INTO orders (customer_id, seller_id) VALUES(customerID, sellerID);
    SET orderID = LAST_INSERT_ID();

    CALL debug_msg(debug, "Tilaus luotu");

    INSERT INTO order_details (order_id, product_id, amount) 
      VALUES(LAST_INSERT_ID(), productID, orderAmount);

    CALL debug_msg(debug, "Tilaustiedot luotu");

    UPDATE products SET amout = amout - orderAmount WHERE id = productID;

    CALL debug_msg(debug, "Tuotteiden määrä päivitetty");

    SET exitCode = 0;

    COMMIT;
  ELSE
    SET exitCode = -2;
    CALL debug_msg(debug, "Tuotteita ei ollut tarpeeksi varastossa");
  END IF;
END //

DELIMITER ;
