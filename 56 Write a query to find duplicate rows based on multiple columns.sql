"""
    Q.Write a query to find duplicate rows based on multiple columns.
"""
  
CREATE TABLE product_inventory (
    entry_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    brand VARCHAR(50),
    model_year INT,
    price DECIMAL(10, 2)
);

INSERT INTO product_inventory (entry_id, product_name, brand, model_year, price) VALUES 
(1, 'iPhone 15', 'Apple', 2023, 799.00),
(2, 'iPhone 15', 'Apple', 2023, 799.00), -- Duplicate of 1
(3, 'Galaxy S23', 'Samsung', 2023, 699.00),
(4, 'Galaxy S23', 'Samsung', 2023, 750.00), -- Duplicate of 3 (even with different price)
(5, 'Pixel 8', 'Google', 2023, 699.00),
(6, 'iPhone 15', 'Apple', 2023, 799.00), -- Another duplicate of 1
(7, 'XPS 13', 'Dell', 2024, 1200.00),
(8, 'XPS 13', 'Dell', 2024, 1200.00), -- Duplicate of 7
(9, 'MacBook Air', 'Apple', 2024, 999.00),
(10, 'Surface Pro', 'Microsoft', 2024, 899.00);

select * from product_inventory ;

with cte1 as (
  select 
    *,
    row_number()over(partition by product_name, brand, model_year, price order by entry_id) as duplicasy
  from product_inventory
)

select
  * 
from cte1
where
  duplicasy > 1 ;

"""
  Output =>
  
      +----------+--------------+-------+------------+---------+-----------+
      | entry_id | product_name | brand | model_year | price   | duplicasy |
      +----------+--------------+-------+------------+---------+-----------+
      |        2 | iPhone 15    | Apple |       2023 |  799.00 |         2 |
      |        6 | iPhone 15    | Apple |       2023 |  799.00 |         3 |
      |        8 | XPS 13       | Dell  |       2024 | 1200.00 |         2 |
      +----------+--------------+-------+------------+---------+-----------+
  
  """
