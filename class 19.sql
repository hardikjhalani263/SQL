create database amazon; 
use amazon ;
CREATE TABLE reviews (
    review_id    INTEGER PRIMARY KEY,
    user_id      INTEGER,
    submit_date  TEXT,        -- Using TEXT or DATETIME for date/time
    product_id   INTEGER,
    stars        INTEGER
);

INSERT INTO reviews (review_id, user_id, submit_date, product_id, stars) VALUES 
(6171, 123, '06/08/2022 0:00:00', 50001, 4),
(7802, 265, '06/10/2022 0:00:00', 69852, 4),
(5293, 362, '06/18/2022 0:00:00', 50001, 3),
(6352, 192, '07/26/2022 0:00:00', 69852, 3),
(4517, 981, '07/05/2022 0:00:00', 69852, 2);

select * from reviews;

CREATE TABLE sales_transactions (
    category          VARCHAR(50),
    product           VARCHAR(100),
    user_id           INTEGER,
    spend             NUMERIC(10, 2), -- Use NUMERIC or DECIMAL for currency
    transaction_date  TEXT       -- Use TEXT or DATETIME for the date and time
);


INSERT INTO sales_transactions (category, product, user_id, spend, transaction_date) VALUES 
('appliance', 'refrigerator', 165, 246.00, '12/26/2021 12:00:00'),
('appliance', 'refrigerator', 123, 299.99, '03/02/2022 12:00:00'),
('appliance', 'washing machine', 123, 219.80, '03/02/2022 12:00:00'),
('electronics', 'vacuum', 178, 152.00, '04/05/2022 12:00:00'),
('electronics', 'wireless headset', 156, 249.90, '07/08/2022 12:00:00'),
('electronics', 'vacuum', 145, 189.00, '07/15/2022 12:00:00');

select * from sales_transactions;



select month(submit_date) as months , product_id , round(avg(stars),2) from reviews group by months , product_id order by months,product_id; 

select year(transaction_date) as years , sum(spend) as total_spend,product,category from sales_transactions where years=2022 group by years,product,category having sum(spend)>2;