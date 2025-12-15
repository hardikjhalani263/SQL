USE sakila;
DELIMITER //

CREATE PROCEDURE p5 (IN var INT)
BEGIN
    hardik: LOOP
        SET var = var + 1;
        SELECT * FROM actor WHERE actor_id = var;

        IF var = 14 THEN
            LEAVE hardik;
	END IF;
    END LOOP hardik;
    END//
DELIMITER ;
use cu

-- declare a cursor
DELIMITER $$
-- procedure is created
CREATE PROCEDURE create_email_list (
	in eid int, out email_list TEXT
)
BEGIN
-- variable to access values from cursor to plsql 
	DECLARE done BOOL DEFAULT false;
	DECLARE email_address VARCHAR(100) DEFAULT "";
    
	-- declare cursor for employee email
	DECLARE cur CURSOR FOR SELECT first_name FROM sakila.actor where
    actor_id <eid ;
    -- handler to see cursor have all the elements 
    
    declare continue handler for NOT FOUND SET DONE = TRUE ;
    
    -- OPEN THE CURSOR 
    open cur;
    set  email_list = '';
    payment : loop 
    -- cur will first row and we insert it into the email_address variable (tushar )
    fetch cur into email_address;
    if done = true then 
    leave process_email;
    end if;
    -- concatenate the email into the emaillist 
    set email_list = concat(email_address, "-", email_list );
    -- aman-aditya-tusha 
    end loop;
    
    -- close the curser 
    close cur; 
    
   end $$ 
    
DELIMITER ;   

call creat_email_list (10, email_list);
select @ email_list ; 

DELIMITER $$
-- procedure is created
CREATE PROCEDURE create_payment (
	 out amount_list TEXT
)
BEGIN
-- variable to access values from cursor to plsql 
     declare v_amount decimal(5,2);
	DECLARE amount int DEFAULT 0;
	-- DECLARE payment_id VARCHAR(100) DEFAULT "";
    
	-- declare cursor for employee email
	DECLARE cur CURSOR FOR SELECT first_name FROM sakila.actor where
    payment_id <10 ; 
    -- handler to see cursor have all the elements 
    
    declare continue handler for NOT FOUND SET DONE = true ;
    
    -- OPEN THE CURSOR 
    set amount_list = '';
    open cur;
    payment_loop:loop  
    -- cur will first row and we insert it into the email_address variable (tushar )
    fetch cur into v_amont;
    if done = true then 
    leave payment_loop ;
    end if;
    -- concatenate the email into the emaillist 
    set payment_id = concat(payment, "-", payent_id );
    -- aman-aditya-tusha 
    end loop;
    
    -- close the curser 
    close cur; 
    
   end $$ 
    
DELIMITER ;  


    