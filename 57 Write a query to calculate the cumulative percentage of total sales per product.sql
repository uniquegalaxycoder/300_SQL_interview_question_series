"""
    Q.Write a query to calculate the cumulative percentage of total sales per product.
"""

CREATE TABLE product_sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    sale_amount DECIMAL(10, 2)
);

INSERT INTO product_sales (sale_id, product_name, sale_amount) VALUES 
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Monitor', 300.00),
(4, 'Headphones', 150.00),
(5, 'Keyboard', 100.00),
(6, 'Mouse', 50.00),
(7, 'Tablet', 450.00),
(8, 'Charger', 30.00),
(9, 'Webcam', 120.00),
(10, 'Desk Lamp', 70.00);

select * from product_sales ;

with cte1 as (
  select
    *,
    sum(sale_amount)over( order by sale_amount ) as total_sales_running,
    sum(sale_amount)over() as total_sale
   from product_sales
)

select 
  *,
  round((total_sales_running*100 / total_sale ),2) as running_percet
from cte1 ;

"""
  Output => 

        +---------+--------------+-------------+---------------------+------------+----------------+
        | sale_id | product_name | sale_amount | total_sales_running | total_sale | running_percet |
        +---------+--------------+-------------+---------------------+------------+----------------+
        |       8 | Charger      |       30.00 |               30.00 |    3270.00 |           0.92 |
        |       6 | Mouse        |       50.00 |               80.00 |    3270.00 |           2.45 |
        |      10 | Desk Lamp    |       70.00 |              150.00 |    3270.00 |           4.59 |
        |       5 | Keyboard     |      100.00 |              250.00 |    3270.00 |           7.65 |
        |       9 | Webcam       |      120.00 |              370.00 |    3270.00 |          11.31 |
        |       4 | Headphones   |      150.00 |              520.00 |    3270.00 |          15.90 |
        |       3 | Monitor      |      300.00 |              820.00 |    3270.00 |          25.08 |
        |       7 | Tablet       |      450.00 |             1270.00 |    3270.00 |          38.84 |
        |       2 | Smartphone   |      800.00 |             2070.00 |    3270.00 |          63.30 |
        |       1 | Laptop       |     1200.00 |             3270.00 |    3270.00 |         100.00 |
        +---------+--------------+-------------+---------------------+------------+----------------+
  
  """


