-- expression (name on temprorary basic)
-- common table expression 
-- we can reuse again and again 
-- it is a


with abc as (select *,
dense_rank() over (order by sale_amount desc) as totalrank from emp_name) as abc
where totalrank=6 );
select * from abc where totalrank = 2 ;


use sakila;
select * from customer;
select * from payment ;
select * from actor;
select * from film_actor;

with film_cte as
(select * from film_actor where actor_id=1
)
select actor.actor_id , film_id from actor join film_cte on actor.actor_id=film_cte.actor_id ;

WITH customer_cte AS (
    SELECT * FROM customer WHERE customer_id = 1
)
SELECT 
    p.payment_id, c.customer_id, p.amount, p.payment_date FROM payment p JOIN customer_cte c
    ON p.customer_id = c.customer_id;


-- 
select actor_id , first_name ,last_update from actor where actor_id<=3
union all
select first_name , last_update , actor_id from actor where actor_id between 3 and 6 ; 

-- creat a series of number from 1 to 10
with recursive cte as(
select 1 as num   -- base case
union
select num+1 from cte
 where num<10 )       -- end case
select * from cte;