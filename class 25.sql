use world ;
select lifeexpectancy , round(lifeexpectancy) from country ;

select 83.62, round(83.687 , 2);

-- 456.23
select (456.23), round (456.23 , -1);

select 456.67 , round(456.67,1) , truncate(456.67,1); 

select 456.67 , round(456.67,1) , truncate(456.67,1) , mod(43,3);

select pow(2,3), ceil(3.000000), floor(3.9999989);

-- date
-- inbult date yh ddate and time print krna 

select now(), curdate(), current_timestamp(),current_time();

-- add date 
select now() , adddate(now() , 2) , adddate(now() , interval 3 month);

select now() , subdate( now() , 2 );

select  now() , data_format( now() , 'Month is %M & year is %W');






use world ;
select * from country ;

select count(indepyear) from country ;

select count(*), count(indepyear) from country ;

select distinct continent , region from country ;

select  count(govermentform ) , ;

select population from country;

select count(name) , sum(population ) from country where continent = 'africa';

get the total surface area ;


select * from country ;

select count(name) , avg(surfaceArea) , sum(population) from country where indepyear in (1947,1998);

-- get the total no. of country and no. of unique continant along with avg population and total no. of capital 
-- for the country starting with 'a' and 'd'

select count(name) , count(distinct continent) , avg (population ) , sum(capital) from country where name like 'A%' or name like 'd%';

select name from country group by name ; 

select indepyear , count(*) from country group by indepeyear;

select continent , count(name) , sum(population) , avg (population) from country group by continent ;


select * from city ;
-- from the city table you have to find total city , total district , unique district , the total population from city table

SELECT 
    COUNT(*) ,COUNT(district) ,COUNT(DISTINCT district) ,SUM(population) 
FROM city;

