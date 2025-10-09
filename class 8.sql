use sakila ;

select * from actor;
select first_name from actor where actor_id=5;

select * from actor where first_name='ED';

select * from actor where first_name=(select first_name from actor where actor_id=5);

select * from payment;

select amount from  payment where payment_id = 3;

select * from payment where amount= (select amount from  payment where payment_id = 3);

select amount from payment  where rental_id = 1476;
select payment_id, amount , payment_date , rental_id from payment where amount = (select amount from payment  where rental_id = 1476);

select month(payment_date) from payment where payment_id = 4 ;

select payment_id , amount , payment_date  from payment where month(payment_date)= (select month(payment_date) from payment where payment_id = 4);

-- > ,< , <= , >= 
-- scalar subquery {when a subquery return only 1 row }

select max(amount) from payment ;
select payment_id , amount from payment where amount = (select max(amount) from payment);


