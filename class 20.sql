-- use tushar;
-- DELIMITER $$

-- CREATE PROCEDURE GetCustomers()
-- BEGIN
-- 	SELECT * FROM sakila.actor; 
-- END$$
-- DELIMITER ;

-- call GetCustomers();  -- procedure

-- select *from sakila.payment;

-- call GetCustomers();

use tushar ;
DELIMITER // 

CREATE PROCEDURE GetCustomers23()
BEGIN
  select * from sakila.actor where actor_id=1;
  select * from sakila.actor where actor_id= 2;
End// 

DELIMITER // 

Call GetCustomers23();
DELIMITER //
CREATE procedure GetpRO2 (in eid int)
begin 
  select * from sakila.actor where actor_id=eid;
  END//
DELIMITER ;

CALL GetpRO2(2);
CALL GetpRO2(3);

DELIMITER //
CREATE procedure GetP3 (in eid int , out ename varchar(20) ) 
begin 
  select * from sakila.actor where actor_id=eid;
  END//
DELIMITER ;

Call GetP3(5 , @ename);
commit;
select @ename ;

call GetP3 (7 , @ename);
select @ename;

select * from sakila.actor where first_name=@ename;

DELIMITER //
CREATE procedure GetP6 (inout var int ) 
begin 
  select count(*) into var from sakila.actor where actor_id<var and actor_id>2;
  END//
DELIMITER ;

set @var=9;
call GetP6(@var);
select @var;
