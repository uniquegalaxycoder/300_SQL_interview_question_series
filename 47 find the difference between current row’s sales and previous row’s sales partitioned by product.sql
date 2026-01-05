"""
    Q.Use window function to find the difference between current row’s sales and previous row’s sales partitioned by product.
"""

create table product (
  product_id bigint primary key,
  product_name varchar(30)
);

create table sales (
  order_id bigint,
  order_date DATE,
  order_amount decimal(10,2),
  product_id bigint,
  foreign key (product_id) references product(product_id)
);

INSERT INTO product (product_id, product_name) VALUES 
(1, 'Laptop'),
(2, 'Smartphone'),
(3, 'Tablet');

INSERT INTO sales (order_id, order_date, order_amount, product_id) VALUES 
(101, '2026-01-01', 80000.00, 1),
(102, '2026-01-01', 90000.00, 2),
(103, '2026-01-02', 78000.00, 2),
(104, '2026-01-03', 4650.00, 3),
(105, '2026-01-03', 78800.00, 1),
(106, '2026-01-04', 40000.00, 2),
(107, '2026-01-05', 6700.00, 3),
(108, '2026-01-05', 800.00, 2),
(109, '2026-01-06', 85000.00, 1),
(110, '2026-01-06', 700.00, 2);

select * from product;
select * from sales ;

with cte1 as (
select 
  a.product_id,
  a.product_name,
  b.order_date,
  b.order_amount
from 
  product as a 
left join 
  sales as b 
on  
  a.product_id = b.product_id
),

cte2 as (
select 
  *,
  lag(order_amount)over(partition by product_id order by order_date) as last_sales
from cte1
)

select 
  product_id,
  product_name,
  order_amount,
  last_sales,
  (last_sales - order_amount) as sales_diff
from cte2 ;


"""
Output => 
    +------------+--------------+--------------+------------+------------+
    | product_id | product_name | order_amount | last_sales | sales_diff |
    +------------+--------------+--------------+------------+------------+
    |          1 | Laptop       |     80000.00 |       NULL |       NULL |
    |          1 | Laptop       |     78800.00 |   80000.00 |    1200.00 |
    |          1 | Laptop       |     85000.00 |   78800.00 |   -6200.00 |
    |          2 | Smartphone   |     90000.00 |       NULL |       NULL |
    |          2 | Smartphone   |     78000.00 |   90000.00 |   12000.00 |
    |          2 | Smartphone   |     40000.00 |   78000.00 |   38000.00 |
    |          2 | Smartphone   |       800.00 |   40000.00 |   39200.00 |
    |          2 | Smartphone   |       700.00 |     800.00 |     100.00 |
    |          3 | Tablet       |      4650.00 |       NULL |       NULL |
    |          3 | Tablet       |      6700.00 |    4650.00 |   -2050.00 |
    +------------+--------------+--------------+------------+------------+

"""







