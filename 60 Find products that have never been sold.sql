"""
    Q.Find products that have never been sold.
"""
  
create table product (
  product_id bigint primary key,
  product_name varchar(50)
);

create table orders (
  order_id bigint,
  order_date date,
  order_amount decimal(10,2),
  product_id bigint,
  foreign key (product_id) references product(product_id)
);

INSERT INTO product (product_id, product_name) VALUES
(101, 'Laptop'),
(102, 'Mobile'),
(103, 'Headphones'),
(104, 'Monitor'),
(105, 'Keyboard');

INSERT INTO orders (order_id, order_date, order_amount, product_id) VALUES
(1, '2025-12-01', 75000.00, 101),
(2, '2025-12-02', 25000.50, 102),
(3, '2025-12-03', 1500.75, 103),
(5, '2025-12-05', 800.00, 105),
(6, '2025-12-06', 78000.99, 101),
(7, '2025-12-07', 26000.00, 102),
(8, '2025-12-08', 1700.00, 103),
(10, '2025-12-10', 950.00, 105),
(11, '2026-01-01', 82000.00, 101),
(12, '2026-01-02', 27000.00, 102),
(13, '2026-01-03', 1800.00, 103),
(15, '2026-01-05', 1100.00, 105);


select * from product;
select * from orders;

with cte1 as (
  select 
    a.product_id,
    a.product_name,
    count(b.order_id) as total_orders,
    sum(order_amount) as total_amount
  from product as a 
  left join 
    orders as b 
  on 
    a.product_id = b.product_id
  group by 
    a.product_id,
    a.product_name
  having count(b.order_id) < 1
)

select 
  *
from cte1 ;

"""
  Output =>
  +------------+--------------+--------------+--------------+
  | product_id | product_name | total_orders | total_amount |
  +------------+--------------+--------------+--------------+
  |        104 | Monitor      |            0 |         NULL |
  +------------+--------------+--------------+--------------+
  
  """




























