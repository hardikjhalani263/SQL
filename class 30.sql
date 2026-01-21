CREATE TABLE employes (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    last_year_salary DECIMAL(10,2),
    current_salary DECIMAL(10,2)
);

INSERT INTO employes (emp_id, emp_name, last_year_salary, current_salary)
VALUES
(1, 'John',   50000, 60000),
(2, 'Anita',  45000, 54000),
(3, 'Rakesh', 70000, 77000),
(4, 'Suman',  55000, 66000),
(5, 'Raj',    60000, 72000),
(6, 'jay' , 60000 , 66000),
(7 , 'kush', 50000 , 55000);

CREATE TABLE department  (
    dep_id INT PRIMARY KEY,
    dep_name VARCHAR(50),
    dep_last_name DECIMAL(10,2),
    dep_first_name DECIMAL(10,2)
);

INSERT INTO department (dep_id , dep_name , dep_last_name , dep_first_name )
VALUES
(1, 'John',   50000, 60000),
(2, 'Anita',  45000, 54000),
(3, 'Rakesh', 70000, 77000),
(4, 'Suman',  55000, 66000),
(5, 'Raj',    60000, 72000),
(6, 'jay' , 60000 , 66000),
(7 , 'kush', 50000 , 55000);

use employes ; 
select * from employes;

SELECT
    emp_id,d
    emp_name,
    last_year_salary AS old_salary,
    current_salary AS new_salary,
    ROUND(((current_salary - last_year_salary) / last_year_salary) * 100, 2) AS increase_percent
FROM employes
WHERE current_salary = last_year_salary * 1.20;
