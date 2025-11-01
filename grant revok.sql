-- grant revoke and roles  


-- GRANT is used to give permissions to a user on database objects.

-- SELECT

-- INSERT

-- UPDATE

-- DELETE

-- ALL PRIVILEGES

-- GRANT privilege_name ON object_name TO user_name;

-- REVOKE removes permissions from a user.

-- REVOKE INSERT ON employees FROM rahul;
-- REVOKE ALL PRIVILEGES ON employees FROM rahul;


-- ROLES in SQL
-- ⭐ Grand Example
-- Create role + assign permissions + give role to user
-- Roles are permission groups assigned to users. 


-- CREATE ROLE hr_team;

-- GRANT hr_team TO rahul;
-- REVOKE hr_team FROM rahul;
-- DROP ROLE hr_team;
-- CREATE ROLE sales_team;

-- GRANT SELECT, INSERT ON customers TO sales_team;

-- GRANT sales_team TO mehul;

use cte;
CREATE TABLE employees2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees2 VALUES
(1, 'Amit', 'HR', 30000),
(2, 'Neha', 'Sales', 35000),
(3, 'Raj', 'IT', 50000);

select * from employees2;

-- Give SELECT permission on employees table to user rahul.

grant select,insert on employees2 to rahul; 

CREATE USER 'rahul'@'localhost' IDENTIFIED BY 'rahul123';
GRANT SELECT, INSERT ON cte.employees2 TO 'rahul'@'localhost';
FLUSH PRIVILEGES; 

SELECT user, host FROM mysql.user;


CREATE USER 'rahul'@'localhost' IDENTIFIED BY 'rahul123';
FLUSH PRIVILEGES;
SELECT user, host FROM mysql.user;

INSERT INTO employees2 (emp_id, emp_name) VALUES (10, 'Test User');

select * from employees2;


UPDATE employees2 SET emp_name='New Name' WHERE emp_id=10;

CREATE DATABASE rahul_db;
GRANT ALL PRIVILEGES ON rahul_db.* TO 'rahul'@'localhost';
FLUSH PRIVILEGES;



