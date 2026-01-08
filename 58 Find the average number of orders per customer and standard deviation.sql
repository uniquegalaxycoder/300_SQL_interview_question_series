"""
      Q.Find the average number of orders per customer and standard deviation.
"""

CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    cust_id INT,
    order_date DATE,
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);

INSERT INTO customer VALUES (1, 'Amit'), (2, 'Priya'), (3, 'Rahul'), (4, 'Suman'), (5, 'Vikram');

INSERT INTO orders (order_id, cust_id, order_date) VALUES 
(1, 1, '2026-01-01'), (2, 1, '2026-01-02'),
(3, 1, '2026-01-03'), (4, 1, '2026-01-04'),
(5, 1, '2026-01-05'), (6, 1, '2026-01-06'),
(7, 2, '2026-01-01'), (8, 2, '2026-01-03'), 
(10, 2, '2026-01-07'), (11, 2, '2026-01-09'),
(12, 3, '2025-12-30'), (13, 3, '2026-01-02'), 
(14, 3, '2026-01-04'), (15, 3, '2026-01-06'),
(16, 4, '2026-01-01'), (17, 4, '2026-01-10'), 
(18, 4, '2026-01-15'), (9, 2, '2026-01-05'), 
(19, 5, '2026-01-05'), (20, 5, '2026-01-20');

select * from customer;
select * from orders ;

with cte1 as (
select 
  a.cust_id,
  a.cust_name,
  round(count(b.order_id)) as total_orders
from customer as a 
left join orders as b 
on    
  a.cust_id = b.cust_id
group by 
  a.cust_id,
  a.cust_name
)

select 
  round(avg(total_orders)) as avg_orders,
  round(stddev(total_orders),4) as std_orders
from cte1;

"""
  Output =.

    +------------+------------+
    | avg_orders | std_orders |
    +------------+------------+
    |          4 |     1.4142 |
    +------------+------------+
"""








