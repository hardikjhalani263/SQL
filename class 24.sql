use world ;
select * from country ;
select name , continent from country where name like 'A%';

select name from country where name like '%a_a%';
select name , contains from country where continent = 'asia' and continent = 'africa' ;

select * from country where continent = 'africa' or indepyear = 1901 ;

select name , continent , upper(name) , lower(name) from country;

select name , continent , concat(continent, '-' , code , '-' , 'regex') from country ;

select name ,substr(name,2) from country;

select name  from country where substring(name , 1,1) = substring(continent, 1,1);

select name ,continent from country 
where name like 'ALG%';
select name , trim(both 'a' from name ) from country ;

select name , population ,rpad(population , 9 ,'0') from country ;

