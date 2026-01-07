"""
    Find customers who purchased more than once in the same day.
"""

  
CREATE TABLE orders (
    order_id bigint PRIMARY KEY,
    order_date DATE,
    food varchar(50),
    order_amount decimal(10,2),
    cust_id bigint
);

INSERT INTO orders (order_id, order_date, food, order_amount, cust_id) VALUES 
(1, '2026-01-01', 'Burger', 150.00, 101),
(2, '2026-01-01', 'Fries', 80.00, 101),
(3, '2026-01-01', 'Pizza', 500.00, 102),
(4, '2026-01-02', 'Coke', 40.00, 102),
(5, '2026-01-03', 'Biryani', 300.00, 103),
(6, '2026-01-03', 'Raita', 50.00, 103),
(7, '2026-01-03', 'Gulab Jamun', 60.00, 103),
(8, '2026-01-04', 'Sandwich', 120.00, 104),
(9, '2026-01-05', 'Dosa', 100.00, 105),
(10, '2026-01-05', 'Coffee', 40.00, 105);


select * from orders ;

with cte1 as (
  select 
    cust_id,
    order_date,
    count(order_id) as total_orders 
  from orders
  group by 
    cust_id,
    order_date
  having count(order_id) > 1
) 
select 
  *
from cte1 ;


"""
  Output =>

      +---------+------------+--------------+
      | cust_id | order_date | total_orders |
      +---------+------------+--------------+
      |     101 | 2026-01-01 |            2 |
      |     103 | 2026-01-03 |            3 |
      |     105 | 2026-01-05 |            2 |
      +---------+------------+--------------+
  """



