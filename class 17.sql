-- tcl (transaction conyral language)
-- transaction - logical statement
-- control / managment

create database testing12;
use testing12;
create table xyz(id int , name varchar(20));
insert into xyz values(11,'aman') ,( 12,'user') ;
select * from xyz ;

start transaction;
insert into xyz values(99 , 'hardik');
select * from xyz;
commit;

start transaction;
SET sql_safe_updates = 0 ;  -- safe mode disable 
delete from xyz ;
select * from xyz;
rollback; -- revert the transaction 

start transaction;
SET sql_safe_updates = 0 ;  -- safe mode disable 
insert into xyz values(1001, 'adfet');
select * from xyz; 

start transaction;
update xyz set name = "hardik ";
savepoint hardik_savepoint;
insert into xyz values(12391239123 , 'fhwefh');
rollback to hardik_savepoint ;
select * from xyz;

with recursive cte as (
select emp.employeeid , emp.employeename , emp.employeename as managerchain
from employees as emp
where emp.managerid is null 
union 
select emp.employeesid , emp.employeename ,
concat ( mgr.managerchain , '=>', emp.employeename) as managerchain 
from employees as emp 
join cte as mgr on emp.managerid= mgr.employeeid )

select * from cte ;


-- transaction 
/*
transaction start
ddl , dml 
transaction end


1) autocommit => disable/ write (start transaction ) 

3) end (commit ; rollback ; ddl statment )
commit - is the transcation of tcl it pramanently save transation 
rollback - it is use to discrat in the data changes

