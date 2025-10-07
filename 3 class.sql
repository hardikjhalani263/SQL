use sakila;

select amount, round (amount) from payment;

select sum(amount) from payment;

select sum(amount), sum(round(amount)) from payment;

select sum(amount), count(amount) from payment;

select count(amount) from payment where amount>5;
select count(address_id), count(address2), count(*) from address;

select * from payment;

select max(amount) , min(amount), sum(amount), count(amount), avg(amount) from payment;

select distinct amount from payment;

select distinct payment_id,amount from payment;
select distinct amount,customer_id from payment;

select count(distinct amount), count(amount)  from payment; 

select payment_id, amount ,payment_date from payment where year(payment_date)=2005;

select count(distinct customer_id) from payment where month (payment_date) = 6;

select max(amount), avg(amount), max(amount)-avg(amount)
from payment where amount >2 and year(payment_date) = 2006;

--  group by statment ( grouping similar values)

-- what is difference between distinct and group by		
select * from payment where customer_id=2;
select count(distinct payment_id) from payment where customer_id=2;
select * from payment;
select customer_id,count(customer_id),sum(amount),avg(amount),max(amount),min(amount) from payment group by (customer_id);
 


