use sakila;

select customer_id   from payment group by customer_id;

select count(distinct payment_id) from payment where customer_id=3;

select customer_id, sum(amount) , count(customer_id)   from payment group by customer_id;

select payment_id, count(*) from payment group by payment_id;

select customer_id , count(customer_id)   from payment 
where customer_id >3 group by customer_id;

-- firlter on aggregate base 
select customer_id, count(customer_id) from payment 
group by customer_id having count(customer_id)>3;

select amount, count(*), sum(amount) from payment group by amount;

select amount, count(*) from payment where amount>2 group by amount;

select amount, count(*), sum(amount) from payment where amount>2 group by amount
having count(*) > 3000;

select amount, count(*) as totalcount, sum(amount) from payment where amount>2 group by amount
having count(*) > 3000;

select staff_id ,count(customer_id) from payment group by staff_id;

select month (payment_date), sum(amount), count(amount) from payment group by month(payment_date) ;

select amount , count(distinct customer_id) from payment group by amount;

select amount , sum(amount), count(*) from payment where year(payment_date) = 2005 group by amount having count(*)>15;

select * from payment;

select count(customer_id), amount from payment group by amount ;
select customer_id, sum(amount) from payment group by customer_id;

select customer_id, amount, count(amount) from payment group by customer_id,amount;

select year (payment_id) as year, sum (amount) from payment group by year;

select staff_id ,year (payment_date) as year, sum(amount) from payment group by year, staff_id;

select customer_id ,year (payment_date) as year, sum(amount) from payment group by year, customer_id;

-- order by (sort)
select * from payment order by customer_id desc;

select * from payment order by customer_id desc, amount desc;

-- conditional functions
select customer_id , amount, if (amount> 3, "High" , "LOW") from payment ;
select customer_id , amount, if(amount = 2.99 , "High" , if(amount= 5.99,"Avg","Lowe")) from payment ;

select customer_id , amount ,
   case
      when amount = 2.99 then "High"
      when amount = 5.99 then "avg"
      else "low"
  end
from payment;  

select customer_id ,
    case
     when customer_id > 4 then "user"
     when customer_id > 1 then "hello"
     else"REGEX"
  end as status
from payment;  



  