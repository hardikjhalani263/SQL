-- data type 
-- numberic => tinyint , smallint , mediumint ,  bigint 

create table hardik1 (id tinyint ); # id tiny .int  uniqned 
insert into hardik1 values(10), (-0);
insert into hardik1 values (127 ) ; # 128 to 128 (1byte) 2**8

select * from hardik1;

-- smallint , 2 byte 089
create table tushar2(id float , id2 double) ; # id tiny. int unsigned 
insert into tushar2 values (10.12345678 , 10.123456789);
select * from tushar2;

create table tushar3 (id2 double(5,2) );  # id tiny. int unsigned 
insert into tushar3 values (10.123456789);
insert into tushar3 values (178.123456789);
insert into tushar3 values (1876.123456789);
 select * from tushar3 ;
 
 create table hardik2 (grnder char(5) ); # id tiny. id unsigned
 insert into hardik2 values('abc'); 
 insert into hardik2 values('abcde'); 
 insert into hardik2 values('abcvduhdg'); -- error
 insert into hardik2 values('abc'); 
 
 select * from hardik2 ;
 
 select gender , char_length(gender) from hardik2 ;
 
 
 create table hardik3 (grnder varchar(5) ); # id tiny. id unsigned
 insert into hardik2 values('abc'); 
insert into hardik2 values('abc'); 
  select gender , char_length(gender) from hardik3 ;
  
create table dev123(date varchar(10));
insert into dev123 values('YYYY-MM-DD');
select * from dev123;
create table dev1234(time varchar(10));
insert into dev1234 values('HH-MM-SS');
select * from dev1234;
create table 
  