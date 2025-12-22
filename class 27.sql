use sakila ;
select * from payment ;

select customer_id , count(payment_id)  from payment group by customer_id ;

select customer_id , sum(amount) from payment where amount > 3 group by customer_id ;

-- you need to find total no of transation in the month of may 

select amount, count(*)from payment where month(payment_date) = 5 group by amount ;

-- you need to find out the max amount spend the avg amount spend and min amount spend on each staef only for customer id 1,3,7,11

select staff_id customer_id,max(amount),avg(amount),min(amount ) from payment where customer_id in (1,2,3,7,11) group by staff_id,customer_id;

-- find the total amount spend and the no of coustomer doen payment each month where the amount spend 1 

select month(payment_date) as payment_month,
 sum(amount) ,count(distinct customer_id) from payment where amount > 1 group by payment_month ; 
 
 
 
-- sub quary 
select * from payment ;
select * from country ;

select amount from payment where payment_id = 20;

select amount from payment where amount > 4.99;

select payment_date, month(payment_date) from payment where payment_id = 15;

-- Assuming the subquery returns month numbers, not amounts
SELECT *
FROM payment
WHERE MONTH(payment_date) IN (SELECT MONTH(payment_date) FROM payment WHERE payment_id = 15);


