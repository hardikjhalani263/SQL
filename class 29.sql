use sakila ;
select *from payment where staff_id =(select staff_id from payment where payment_id = 8);
select * from payment;
-- get the payment id and payment date where the month of payment should be same as 20 
SELECT payment_id, payment_date
FROM payment
WHERE MONTH(payment_date) = (select month(payment_date ) from payment where payment_id = 22);

-- get the amount and the total no of payment doen where the amount should less than the rental id 1725
select amount , count(*) from payment where amount < (select amount from payment where rental_id = 1725) group by amount ;

-- get the month and total amount spend from the payment table where the month is greater then month of customer id 1 with the payment id 3 
SELECT
    EXTRACT(MONTH FROM payment_date) AS month,
    SUM(amount) AS total_amount_spent
FROM payment
WHERE EXTRACT(MONTH FROM payment_date) >
      (
        SELECT EXTRACT(MONTH FROM payment_date)
        FROM payment
        WHERE customer_id = 1
          AND payment_id = 3
      )
GROUP BY EXTRACT(MONTH FROM payment_date)
ORDER BY month;

-- multi-row sub quary 
select * from payment where amount in (select amount from payment where payment_id = 2 or payment_id = 3);


-- data type in sql 
-- numeric => int,float, decemial 
-- tinyint , medium , big int , small int , int 

use regex1 ;
create table test10 (id tinyint);
insert into test10 values (1) , (-128) , (127);
insert into test10 values (128) ;


create table test11 (id tinyint unsigned);
insert into test11 values (129) , (255);
select * from test11 ;

create table test12 (price float , price2 double);
insert into test12 values (9183.445 , 1982.242) , (10.123456532 , 10.431234234);
select * from test12 ;

create table test15 (name , char(10));
insert into test15 values ('abc') , ('defghi')
