show databases;    -- will show database in mysql

use sakila; -- use sakila as a database 

-- show the table to see all table
show tables;

-- select statment (dql) * access all columns
select * from actor;

describe actor;  -- will give table info ( column , datatype , relationships and more

select actor_id,first_name from actor;  -- select statment table it can be any case formate 

select actor_id,first_name,actor_id from actor;

-- don't create new column in original data base  
select actor_id,first_name,actor_id*5 from actor;

-- to filte rowes
select * from actor where actor_id=5;

select * from  actor where first_name='NICK'; -- data should be case sensitive

select * from  actor where last_name='NICK';
-- not equal to 
select * from actor where actor_id!= 5;
select * from actor where actor_id<>5;

select * from actor where first_name='NICK' and actor_id=44;

select * from  actor where first_name='NICK' or actor_id = 46;

select * from  actor where first_name='NICK' or actor_id!=46;

select * from actor where actor_id>=2 and actor_id<=6;
select * from  actor where actor_id not between 2 and 6; -- lower to higher ( not higher to lower)

-- both are same 
select * from actor where actor_id in (2,8,19);
select * from actor where actor_id=2 or actor_id=8 or actor_id=19;

-- FROM THE ACTOR TABLE GET THE FIRST_NAME AND ACTOR_ID WHOES LAST NAME IS GENIUS
SELECT *  FROM ACTOR  WHERE LAST_NAME='GENIUS';

-- GET THE ACTOR_ID AND THE FIRST_NAME WHERE THE ACTOR_ID IS FROM VALUE 3 TO 18 OR THE NAME SHOULD NOT BE ED
SELECT ACTOR_ID, FIRST_NAME FROM ACTOR  WHERE ACTOR_ID BETWEEN 3 AND  18  AND FIRST_NAME!='ED'; 

-- GET THE LAST_NAME ,ACTOR_ID AND FIRST_NAME WHERE THE FIRST_NAME IS EITHER NIK OR GRACE
SELECT LAST_NAME,ACTOR_ID,FIRST_NAME FROM ACTOR WHERE FIRST_NAME='NIK' OR FIRST_NAME='GRACE';

--  GET ALL THE COLUMNS WHERE ACTOR_ID IS FROM 2 TO 6  OR ACTOR ID GRETER THEN 5 

show tables;
select * from actor;
select * from actor where first_name like "N";
select * from actor where first_name like "N%";
SELECT * FROM ACTOR WHERE FIRST_NAME LIKE "%S";
SELECT * FROM ACTOR WHERE FIRST_NAME LIKE "S%";
SELECT * FROM ACTOR WHERE FIRST_NAME LIKE "S%T";
SELECT * FROM ACTOR WHERE FIRST_NAME LIKE "%S%";
SELECT * FROM ACTOR WHERE FIRST_NAME LIKE "%S%T";

-- (_): EXCETLY 1 CHARACTER
SELECT * FROM ACTOR WHERE FIRST_NAME LIKE "E_";
SELECT * FROM ACTOR WHERE FIRST_NAME LIKE "__E%";
SELECT * FROM ACTOR WHERE FIRST_NAME LIKE "__E%%";
SELECT * FROM ACTOR WHERE FIRST_NAME LIKE "%%E_";
-- GET THE ACTOR ID AND FIRST NAME WHERE THE LAST TWO WORD SHOULD BE TE;;
SELECT ACTOR_ID,FIRST_NAME FROM ACTOR WHERE FIRST_NAME LIKE "%TE";

-- GET THE ACTOR ID AND FIRST NAME WHERE THE DOUBLE N SHOULD BE IN THE MIDDLE;;
SELECT ACTOR_ID,FIRST_NAME FROM ACTOR WHERE FIRST_NAME LIKE "%NN%";

-- GET THE FIRST_NAME AND LAST_NAME WHERE THE LAST_NAME COLUMN THE FIRST WORD IS B AND SECOND LAST WORD IN R;
SELECT FIRST_NAME,LAST_NAME FROM ACTOR WHERE LAST_NAME LIKE "B%" AND LAST_NAME LIKE  "%%R";

-- GET  ALL THE USER INFORMATION WHERE THE FIRST NAME WILL HAVE MINIMUM FOUR CHARACTER;
SELECT * FROM ACTOR WHERE FIRST_NAME LIKE "____"; 

-- GET THE ALL THE COLUMNS WHERE THE ACTOR ID IS FROM TWO TO NINTY AND THE FIRST_NAME S SHOULD BE PRESET IN THE MIDDLE AND A SHOULD BE SECOND LAST CHARACTER..
SELECT * FROM ACTOR WHERE ACTOR_ID BETWEEN 2 AND 90 AND  FIRST_NAME LIKE "%S%A_";
SELECT * FROM ACTOR WHERE ACTOR_ID BETWEEN 2 AND 90 AND  FIRST_NAME LIKE "_%S%A_";

-- FUNCTIONS 
 -- INBUILD_FUNCTIONS (ROW_FUNCTION) 
 -- SCALER FUNCTION 1.(ROW_FUNCTION)  2.(MULTI ROW FUNCTION)
 -- APPLY ON EACH ROW AND RETURN THE OUTPUT FOR EACH ROW
 -- TOTAL CHARACTER IN EACH FIRST_NAME
 SELECT FIRST_NAME,CHAR_LENGTH(FIRST_NAME),LOWER(FIRST_NAME) FROM ACTOR;
 SELECT FIRST_NAME,LAST_NAME ,CONCAT(FIRST_NAME,"  ",FIRST_NAME," ",LAST_NAME) FROM ACTOR;
 SELECT FIRST_NAME,LAST_NAME,CONCAT_WS(" ",'MR', FIRST_NAME,LAST_NAME) FROM ACTOR;
 
  -- SUBSTR(TO EXTRACT SOME DATA)
  SELECT FIRST_NAME, SUBSTR(FIRST_NAME,3) FROM ACTOR;
  SELECT FIRST_NAME,SUBSTR(FIRST_NAME,3,2) FROM ACTOR;
  SELECT FIRST_NAME,SUBSTR(FIRST_NAME,-3,-2) FROM ACTOR;

-- trim function
select char_length( trim (     'hey')  )  ;

select  char_length( rtrim('    hey') )  ;
select first_name , replace(first_name,'E','#') from actor;

select first_name , lpad(first_name, 5,'@') from actor;

select first_name , rpad(first_name, 5,'@') from actor;

-- numeric function 
-- round 
select round(11.5);
select round(11.2);

select round (11.6  ,   1 ); -- only the decimal part  

select round (11.68   ,    1 );  -- only the decimal part 

select  round (11.631   , 2 );  -- only the decimal part 

select round (7.627     , 1);

select round (7.627   , -1);    -- only the integer round off

select round (76.627      , -2);

select round(546.274    , -2);

select round(6546.627   , 2),truncate(6546.637 , 2); 

-- other functon
select mod(10,2), floor(6.999999) , ceil(4.00002);

-- data function is (very important )
select current_date() , current_time(),current_timestamp(),now()

-- adddate() 
select now() ,  adddate(    now(), 40);

select now() , adddate( now() , interval 2 month);

select now() , adddate( now() , interval -2 month);

select now() , adddate( now() , '02:00:00');

-- year and month
select now() , year( now() ) , last_day(now());

-- extract
select now(),  extract(QUARTER FROM now());

-- adddate,now , curtime , extact  , year  , month , date_formate
use sakila;

select payment_data,   year(payment_date), extract( month from payment_date),
date_format(payment_date, 'Hour of shopping is %H'),
datediff()