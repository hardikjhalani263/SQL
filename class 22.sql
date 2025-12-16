CREATE DATABASE ProductStore;
USE ProductStore;

-- Create table for products
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(30),
    Price DECIMAL(10,2),
    Stock INT
);

-- Create table for sales
CREATE TABLE ProductSales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleAmount DECIMAL(10,2),
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



INSERT INTO Products (ProductName, Category, Price, Stock) VALUES
('Laptop', 'Electronics', 60000, 25),
('Smartphone', 'Electronics', 30000, 40),
('Headphones', 'Accessories', 2000, 100),
('Smartwatch', 'Electronics', 10000, 50),
('T-Shirt', 'Clothing', 800, 200),
('Shoes', 'Footwear', 2500, 150);

INSERT INTO ProductSales (ProductID, Quantity, SaleAmount, SaleDate) VALUES
(1, 3, 180000, '2025-11-01'),
(2, 5, 150000, '2025-11-02'),
(3, 10, 20000, '2025-11-03'),
(1, 2, 120000, '2025-11-04'),
(4, 4, 40000, '2025-11-05'),
(6, 6, 15000, '2025-11-06'),
(5, 8, 6400, '2025-11-07');

select productname , price , stock from products;

select productname , price , stock from products where category < 'Elechtronics';