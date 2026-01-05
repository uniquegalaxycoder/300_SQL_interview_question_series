"""
    Q.Find average order value per month and product category.
"""
  
create table product (
  product_id bigint primary key,
  product_name varchar(30)
);

create table orders (
  order_id bigint,
  order_date date,
  order_amount decimal(10,2),
  product_id bigint,
  foreign key (product_id) references product(product_id)
);

INSERT INTO product (product_id, product_name) VALUES 
(1, 'Organic Milk'),
(2, 'Whole Grain Bread'),
(3, 'Farm Eggs (Dozen)');

INSERT INTO orders (order_id, order_date, order_amount, product_id) VALUES 
(201, '2025-12-05', 150.50, 1),
(202, '2025-12-10', 120.00, 2),
(203, '2025-12-15', 250.00, 3),
(204, '2025-12-20', 150.50, 1),
(205, '2025-12-28', 120.00, 2),
(206, '2026-01-02', 180.00, 1), 
(207, '2026-01-05', 100.00, 2), 
(208, '2026-01-10', 300.00, 3),
(209, '2026-01-12', 180.00, 1),
(210, '2026-01-15', 300.00, 3);

select * from product;
select * from orders ;

with cte1 as (
select 
  a.product_id,
  a.product_name,
  b.order_date,
  b.order_amount
from 
  product as a 
left join
  orders as b 
on 
  a.product_id = b.product_id
)

select 
  product_name,
  date_format(order_date,'%M-%y') as month,
  round(avg(order_amount),2) as avg_amount
from cte1
group by 
  product_name,
  date_format(order_date,'%M-%y') ;

"""
  Output =>

  +-------------------+-------------+------------+
  | product_name      | month       | avg_amount |
  +-------------------+-------------+------------+
  | Organic Milk      | December-25 |     150.50 |
  | Organic Milk      | January-26  |     180.00 |
  | Whole Grain Bread | December-25 |     120.00 |
  | Whole Grain Bread | January-26  |     100.00 |
  | Farm Eggs (Dozen) | December-25 |     250.00 |
  | Farm Eggs (Dozen) | January-26  |     300.00 |
  +-------------------+-------------+------------+
  
  """




