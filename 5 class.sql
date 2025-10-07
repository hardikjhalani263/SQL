
create database  regex123;
use regex123;
create table product(pid  int,  pname  varchar(20), price int);
insert into product values(100,'iphone',4000), (101,'mi tv', 3000),
(102,'fridge',5000), (103,'cover',500);


create table orders( orderid int, city varchar(20), productid int);
insert into orders values(994,'jaipur', 100),(995,'goa',102), (996,'J&K', 100), (997,'japan',102),
(998,'bhutan', 110);

select * from product;
select prd.pid , prd.pname from product as prd; 

select ord.productid , ord.city from orders as ord;

select prd.pid, prd.pname, ord.productid , ord.city 
   from product as prd join orders as ord
   where  prd.pid=ord.productid;
   
-- orderid is primary key, productid is foreign key that refer to primary key of product  table(pip)
select * from orders;

select product.pid, product.pname, product.price, orders.city from product 
join
orders where product.pid=orders.productid  and pname='iphone';  

-- update order set productid = 101  where orderid = 995;

select product.pid , product.pname , product.price, orders.city from product
join orders where product.pid=orders.productid;

select product.pid , product.pname , product.price, orders.productid, orders.city from product
left join orders on product.pid=orders.productid;

select product.pid , product.pname , product.price, orders.productid, orders.city from product
right join orders on product.pid=orders.productid;

use sakila;
select * from actor;

desc actor;

select count(actor_id), count(distinct actor_id) from actor;

desc film_actor;

select actor.actor_id, actor.first_name , flim_actor.actor_id , 
  flim_actor.flim_id from actor
   join flim_actor  where actor.actor_id=flim_actor.actor_id;

