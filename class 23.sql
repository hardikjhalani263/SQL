USE sakila;
DELIMITER $$

CREATE PROCEDURE create_payment_id (OUT payment_list TEXT)
BEGIN
    DECLARE done BOOLEAN DEFAULT FALSE;
    DECLARE amount DECIMAL(5,2);
    DECLARE email_list TEXT DEFAULT '';
    
    -- Cursor to get payment amounts less than 10
    DECLARE cur CURSOR FOR 
        SELECT amount FROM payment WHERE amount < 10;
        
    -- Handler when cursor reaches the end
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Open the cursor
    OPEN cur;
    
    payment_loop: LOOP
        FETCH cur INTO amount;
        IF done THEN 
            LEAVE payment_loop;
        END IF;
        
        -- Concatenate amounts
        SET email_list = CONCAT(amount, '-', email_list);
    END LOOP;
    
    -- Close the cursor
    CLOSE cur;
    
    -- Set output
    SET payment_list = email_list;
END$$

DELIMITER ;
