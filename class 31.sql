use regex;
-- window function is used to perform calculation on setof rows with refernce to current rows .

-- window function are major in 3 parts

-- over() - it apply on windows in over()

--  partition by - divide the dat ON THE GROUP  and apply on logic

-- rank() - it give the rank to the 

-- dense-rank() - it skip the rank which is duplicket values


-- find out running sum and cumulative sum 
-- use order by


use world ;

select code ,name , population  from country;
select code , name , sum(population) over() from country ; 

SELECT code,name,continent,population,SUM(population) OVER() AS total_world_population,
    SUM(population) OVER(PARTITION BY continent) AS total_continent_population FROM country;

 

SHOW DATABASES;

create database person ;
use person;
CREATE TABLE persons (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);


INSERT INTO persons (name, age) VALUES
('Amit', 25),
('Rohit', 30),
('Neha', 22),
('Priya', 28),
('Karan', 35);

select * from persons;

with cte as 
(select name , age , rank() over(order by age asc) as rnk from persons)

select name from cte limit 1 offset 4;


select name from persons order by age desc limit 1 offset 1 ;

select name from persons where age = (  select min(age) from persons where age > (select min(age) from persons  )  ) ;
 
 select min(age) from persons where age>(select min(age) from persons);
 select min(age) from persons;
--------------------------------------------------------------------------------------------------------------------
 
 CREATE DATABASE IF NOT EXISTS window_fn_practice;
USE window_fn_practice;
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
department VARCHAR(50) NOT NULL,
city VARCHAR(50) NOT NULL,
salary INT NOT NULL,
hire_date DATE NOT NULL
);
CREATE TABLE sales (
sale_id INT PRIMARY KEY,
emp_id INT NOT NULL,
sale_date DATE NOT NULL,
amount DECIMAL(10,2) NOT NULL,
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO employees (emp_id, full_name, department, city, salary, hire_date) VALUES
(101, 'Asha Nair', 'Sales', 'Mumbai', 65000, '2022-04-10'),
(102, 'Rohan Mehta', 'Sales', 'Pune', 72000, '2021-07-05'),
(103, 'Neha Singh', 'Sales', 'Delhi', 68000, '2023-01-15'),
(104, 'Kabir Rao', 'Engineering', 'Bengaluru', 120000, '2020-09-20'),
(105, 'Isha Verma', 'Engineering', 'Hyderabad', 110000, '2021-11-12'),
(106, 'Vikram Das', 'Engineering', 'Bengaluru', 125000, '2019-03-08'),
(107, 'Pooja Shah', 'HR', 'Mumbai', 60000, '2020-02-01'),
(108, 'Arjun Iyer', 'HR', 'Chennai', 58000, '2022-06-18');
INSERT INTO sales (sale_id, emp_id, sale_date, amount) VALUES
(1, 101, '2026-01-02', 12000.00),
(2, 101, '2026-01-05', 8000.00),
(3, 102, '2026-01-03', 15000.00),
(4, 102, '2026-01-09', 5000.00),
(5, 103, '2026-01-04', 7000.00),
(6, 103, '2026-01-10', 11000.00),
(7, 101, '2026-02-02', 14000.00),
(8, 102, '2026-02-03', 9000.00),
(9, 103, '2026-02-05', 13000.00),
(10, 101, '2026-02-08', 6000.00),
(11, 102, '2026-02-10', 16000.00),
(12, 103, '2026-02-12', 4000.00);

select * from employees ;

SELECT *,
       SUM(salary) OVER () AS total_salary,
       SUM(salary) OVER (PARTITION BY department) AS dept_salary,
       SUM(salary) OVER (PARTITION BY department, city) AS dept_city_salary
FROM employees;

-- over () => asending order mai arrange kar lena 
-- running sum / cumulative sum of salary

 
 select *,
 sum(salary ) over ( order by salary ) from employees ;
 
select *, 
sum(salary ) over ( order by city ) from employees ;

-- i need to get runnig sum of each department 
select *, sum(salary) over (partition by department order by salary) from employees ;

-- row number() => to defined unique no values
select *, row_number() over (partition by department order by hire_date) from employees ;

-- important  question interview rank() , dense_rank() , row_number()

-- rank () => it skip values which is same and similer values 
select *, rank() over(order by city) from employees ; 

select *, rank() over (partition by department order by salary)
 from employees ;
 
select *, rank() over(order by city ) from employees ;

select * , rank() over(order by salary) from employees;

select * , dense_rank() over(order by salary) from employees;

select *, row_number() over(partition by department order by salary) from employees ;

select *, rank() over(partition by department order by salary) from employees ;

SELECT*,LEAD(salary) OVER (ORDER BY salary DESC) AS next_salary
FROM employees;

SELECT
    LAG(salary)  OVER (ORDER BY salary DESC) AS previous_salary
FROM employees;

 select *,
 sum(amount ) over ( order by sale_date ) from sales ;
 
 select emp_id, sum(amount) over( partition by emp_id order by sale_date ) as rumnning_sum from sales order by emp_id,sale_date ;
 
 SELECT *,
    SUM(amount) OVER () AS total_sales
FROM sales;

select *,  avg(salary) over(partition by department) as each_department from employees;

select salary, department from employees order by salary desc limit 2 offset 1 ;

SELECT *FROM (
    SELECT*,
        ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk FROM employees) t
WHERE rnk <= 2;

select *, avg(salary) over(partition by department ) as diffrence from employees ;

select *, sum(salary) over(), rank() over(order by salary ),
percent_rank() over(order by salary ) as percentage_rank from employees ;

SELECT *,NTILE(4) OVER (ORDER BY salary DESC) AS salary_bucket FROM employees;

