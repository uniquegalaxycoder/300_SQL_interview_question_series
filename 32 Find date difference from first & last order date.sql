"""
 Q.write a query to find the days difference between the first order & last order date difference by each users
"""

CREATE TABLE users (
  user_id BIGINT PRIMARY KEY,
  user_name VARCHAR(30)
);

CREATE TABLE orders (
  order_id BIGINT PRIMARY KEY,
  user_id BIGINT,
  order_date DATE,
  order_amount FLOAT(10,2)
);

INSERT INTO users (user_id, user_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eve'),
(6, 'Alie');

INSERT INTO orders (order_id, user_id, order_date, order_amount) VALUES
(101, 1, '2025-01-01', 500.00),
(102, 1, '2025-01-05', 4150.00),
(103, 1, '2025-01-10', 3010.00),  

(201, 2, '2025-02-02', 800.00),
(202, 2, '2025-02-04', 1100.00),
(203, 2, '2025-02-10', 510.00),  

(301, 3, '2025-03-01', 2200.00),
(302, 3, '2025-03-02', 180.00),
(303, 3, '2025-03-08', 1150.00),  

(401, 4, '2025-04-10', 1000.00),
(402, 4, '2025-04-12', 9999.00),  

(501, 5, '2025-05-01', 300.00),
(502, 5, '2025-05-03', 4600.00),
(503, 5, '2025-05-05', 350.00);  


select * from users ;
select * from orders;

with cte1 as (
  select 
    a.user_id,
    a.user_name,
    b.order_date
  from users as a 
  inner join 
    orders as b 
  on 
    a.user_id = b.user_id
),

cte2 as (
select 
  user_id,
  user_name,
  min(order_date) as first_ordered_date,
  max(order_date) as last_order_date
from cte1
group by user_id, user_name
)

select 
  user_id,
  user_name,
  datediff(last_order_date, first_ordered_date) as day_diff
from cte2
