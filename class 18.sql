-- dcl 
-- data control languager 
-- grant and revoke 

create user 'ram' identified by 'ram';
--           ram%ipaddress
select * from mysql.user;

show grants for 'ram'; -- will show privileges

-- grant statment 
grant all privileges on tushar.* to 'ram';


revoke all privileges on tushar.* from 'ram';

-- role 
use sakila ;
select * from actor;
CREATE ROLE actor_role ;

GRANT SELECT ON sakila.customer TO actor_role;
GRANT SELECT ON sakila.rental TO actor_role;
GRANT UPDATE ON sakila.customer TO actor_role;


-- dql (group by , joints , left join , inner , and self )
-- subquary , single , multi-row >,< (in any all)
-- corrlated (cte) 

-- windows
-- over(), particion by
-- running sum (order by )
-- partition by dept order by
-- rank() order by 
-- row number 

 
-- primary vs foriegn key 
-- constraint 
-- function , substr , instr , concat , trim
-- number round , pow , floor 
-- data , adddate , dateediff, extract , month , year , data_format , 
