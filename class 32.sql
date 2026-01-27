Create database event;
use event;
-- -------------------------
CREATE TABLE events (
  event_id   INT PRIMARY KEY,
  event_name VARCHAR(100) NOT NULL,
  city       VARCHAR(50)  NOT NULL
);

-- -------------------------
-- Create table: ticket_sales
-- -------------------------
CREATE TABLE ticket_sales (
  sale_id          INT PRIMARY KEY,
  event_id         INT NOT NULL,
  sale_date        DATE NOT NULL,
  ticket_type      VARCHAR(20) NOT NULL,
  qty              INT NOT NULL,
  price_per_ticket INT NOT NULL,
  CONSTRAINT fk_ticket_sales_event
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- -------------------------
-- Insert data: events
-- -------------------------
INSERT INTO events (event_id, event_name, city) VALUES
(1, 'Music Fest', 'Mumbai'),
(2, 'Tech Summit', 'Bengaluru'),
(3, 'Food Carnival', 'Delhi'),
(4, 'Startup Meetup', 'Mumbai');

-- -------------------------
-- Insert data: ticket_sales
-- -------------------------
INSERT INTO ticket_sales (sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
(101, 1, '2025-01-05', 'Regular', 2, 1500),
(102, 1, '2025-01-10', 'VIP',     1, 5000),
(103, 2, '2025-02-03', 'Regular', 3, 2000),
(104, 2, '2025-02-10', 'VIP',     1, 6000),
(105, 3, '2025-03-01', 'Regular', 5,  800),
(106, 3, '2025-03-15', 'VIP',     2, 2500),
(107, 4, '2025-01-20', 'Regular', 4, 1200),
(108, 4, '2025-02-05', 'Regular', 1, 1200);

-- Quick check
SELECT * FROM events ORDER BY event_id;
SELECT * FROM ticket_sales ORDER BY sale_id;

select e.event_id, e.event_name, sum(ts.qty) as total_qty from ticket_sales as ts join events as e on e.event_id = ts.event_id
 group by event_id;
 
select e.event_id, e.event_name, sum(ts.price_per_ticket* ts.qty) as total_revenue from ticket_sales as ts 
join events as e on e.event_id = ts.event_id
 group by event_id; 
 
select extract(month from sale_date) as sale_month, sum(qty *price_per_ticket) as total_revenue from ticket_sales 
group by sale_month order by total_revenue desc;

select e.event_id,e.event_name, max(ts.price_per_ticket) as max_price_ticket from events as e join ticket_sales as ts on e.event_id = ts.event_id 
group by e.event_name , e.event_id;

select extract(month from sale_date) as sale_month , ticket_type , sum(price_per_ticket * qty) as total_revenue from ticket_sales
group by sale_month , ticket_type;

select ts.sale_id , e.event_name , ts.sale_date from events as e join ticket_sales as ts on e.event_id = ts.event_id ;

select e.event_name , ts.ticket_type , ts.qty from events as e join ticket_sales as ts on e.event_id = ts.event_id ;

select ts.sale_id , e.event_name , e.city , ts.sale_date from events as e join ticket_sales as ts on e.event_id = ts.event_id 
where e.city = 'mumbai';

select e.event_name , ts.sale_id , ts.sale_date from events as e join ticket_sales as ts on e.event_id = ts.event_id ;

select distinct e.event_name from events as e join ticket_sales as ts on e.event_id = ts.event_id;


