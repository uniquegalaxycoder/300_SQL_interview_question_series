"""
    Q.Write a query to get the running total of sales per customer, ordered by sale date.

  """
  
CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    sale_date DATE,
    amount DECIMAL(10, 2)
);

INSERT INTO sales_data (sale_id, customer_id, sale_date, amount) VALUES 
(1, 101, '2026-01-01', 150.00),
(2, 101, '2026-01-02', 50.00),
(3, 102, '2026-01-01', 300.00),
(4, 101, '2026-01-05', 100.00),
(5, 102, '2026-01-07', 150.00),
(6, 101, '2026-01-10', 25.00),
(7, 102, '2026-01-12', 50.00),
(8, 101, '2026-01-15', 200.00),
(9, 102, '2026-01-18', 100.00),
(10, 102, '2026-01-20', 25.00);

select * from sales_data ;

with cte1 as (
select 
  customer_id,
  sale_date,
  sum(amount)over(partition by customer_id order by sale_date asc) as running_sum
from sales_data
)

select * from cte1;

"""
  Output =>
    +-------------+------------+-------------+
    | customer_id | sale_date  | running_sum |
    +-------------+------------+-------------+
    |         101 | 2026-01-01 |      150.00 |
    |         101 | 2026-01-02 |      200.00 |
    |         101 | 2026-01-05 |      300.00 |
    |         101 | 2026-01-10 |      325.00 |
    |         101 | 2026-01-15 |      525.00 |
    |         102 | 2026-01-01 |      300.00 |
    |         102 | 2026-01-07 |      450.00 |
    |         102 | 2026-01-12 |      500.00 |
    |         102 | 2026-01-18 |      600.00 |
    |         102 | 2026-01-20 |      625.00 |
    +-------------+------------+-------------+
  
  """
