-- DDl and dil statment 
-- DDl : data defication language 
-- language : data defination , table 

-- create 
use regex1 ;

create table (id int ) ; create table -- get table 

-- drop 
drop table - data and table structure both are select (we can,t undo )
create table t5(id int);
drop table t5 ;

create table t5 (name varchar (50));
select * from t5 ;
alter table t5 add column eid int primary key ; -- ddl

desc t5 ;

insert into t5 values ('yash', 11), ('aman', 12) ;

update t5 set name = 'tushar';

SET sql_safe_updates = 0 ;
update t5 set name = 'hardik' ;  -- without condition (all rows are update)
select * from t5 ; 

update t5 set name = 'regex' where eid = 11 ; -- update on condition (use this method )
select * from t5 ;

-- delete
-- delete from t5 ;
delete from t5 where eid = 12 ; # this can unone (we can undo it )
select * from t5 ;

-- truncate(ddl ) -- drop structure + recreate the structure 
truncate t5 ;
 select * from t5 ;
 
-- DDL (create , drop , alter , truncate) 
-- dml : insert , update , delete. , merge 

create table t6(email varchar (20)); -- 1

alter table t6 add column rollno int first;  -- 2

select * from t6 ;
alter table t6 add primary key(rollno) ;  -- 3

alter table t6 add unique key(email); -- 4

alter table t6 add column phone_no varchar (20); -- 5
insert into t6 value (11 ,'wer@.com', 12345 );

ALTER TABLE t6 MODIFY phone_no VARCHAR(25); -- 6
UPDATE t6 SET phone_no = '9876501234' WHERE rollno = 11;
