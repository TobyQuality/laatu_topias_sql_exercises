/* 
Write a stored procedure TransferMoney which implements the first task's functionality.
The procedure takes three parameters: source_account_id, destination_account_id, and transfer_amount.
All of the parameters are IN type. transfer_amount should be type DECIMAL and other parameter should be type INT.
The transfer has to be implemented as a transaction which is
rolled back in a case of an error. If the transaction succeeds the money has been deducted from the source
account and is added to the destination account. Define an OUT parameter exitValue as well and define
all possible error codes.

Kirjoita tallennettu proseduuri TransferMoney, joka toteuttaa tehtävä 1:n toiminnallisuuden. 
Proseduuri ottaa kolme parametria, source_account_id, destination_account_id ja transfer_amount. 
Kaikki parametrit ovat tyypiltään IN. transfer_amount on tyyppiä DECIMAL ja muut parametrit ovat
tyyppiä INT. Siirron tulee tapahtua transaktiona, joka perutaan virheen sattuessa. 
Onnistuneessa tapauksessa transfer_amount -määrä rahaa on siirtynyt tililtä id:llä source_account_id 
tilille id:llä destination_account_id. Määritä OUT tyyppinen parametri exitValue, joka palauttaa koodin sen perusteella,
onnistuuko transaktio vai ei. Määritä virhekoodit kommenttina.
*/

/*
Parameters:
source_account_id: The id of the account from which the money is transferred
destination_account_id: The id of the account to which the money is transferred
transfer_amount: The amount of money to be transferred

Return values/Exit codes:
-1: SQL error
0: Success
1: Not enough money in the source account
*/

DELIMITER //

CREATE PROCEDURE TransferMoney(
    IN source_account_id INT,
    IN destination_account_id INT,
    IN transfer_amount DECIMAL,
    OUT exitCode INT
)
BEGIN
    
    DECLARE moneyAvailable DECIMAL DEFAULT 0.00;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET exitCode = -1;
        ROLLBACK;
    END;

    SELECT amount INTO moneyAvailable
    FROM account
    WHERE id = source_account_id;

    IF moneyAvailable >= transfer_amount THEN
        START TRANSACTION;
        UPDATE account SET amount = amount - transfer_amount WHERE id = source_account_id;
        UPDATE account SET amount = amount + transfer_amount WHERE id = destination_account_id;

        SET exitcode = 0;

        COMMIT;
    ELSE
        SET exitCode = 1;
    END IF;
END //

DELIMITER ;