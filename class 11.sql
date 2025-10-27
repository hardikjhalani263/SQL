create database corrdb;
use corrdb;

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert data into products
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 1200.00),
(2, 'Phone', 'Electronics', 800.00),
(3, 'Chair', 'Furniture', 150.00),
(4, 'Desk', 'Furniture', 300.00),
(5, 'Monitor', 'Electronics', 250.00);

-- Insert data into sales
INSERT INTO sales (sale_id, product_id, quantity, sale_date) VALUES
(1, 1, 3, '2025-09-10'),
(2, 2, 5, '2025-09-11'),
(3, 1, 2, '2025-09-15'),
(4, 3, 7, '2025-09-1');

select * from products;
select * from sales;
select category , avg(price) from products group by category ;

select product_name
 , product_name ,price from products as p_out where price > 
(select avg (price) from products where category =p_out.category );

select p.product_id, s.quantity from products as p join sales as s 
where p.product_id = s.product_id and  quantity > 3 ;

select product_id , product_name from products as p_out 
where p_out.product_id in 
(select product_id from sales as s_in where s_in.product_id=p_out.product_id and quantity > 3);

-- second higrest salary (price )
select * from products order by price desc limit 1,2 ;

select max(price) from products ;
select * from products salary where price < (select max(price) from products );
-- this is second higest price 
select max(price) from products salary where price < (select max(price) from products );
-- 
select * from products where price = (select max(price) from products salary where price < (select max(price) from products ));

select * from products where price = (select min(price) from products salary where price > (select min(price) from products ));

select min(price) from products salary where price > (select min(price) from products );