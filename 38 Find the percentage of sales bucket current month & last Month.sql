"""
Q, write a query to find the percentage changed in category wise previous month sales and current month sales.
"""
  
create table product (
  category_id bigint,
  product_id bigint,
  product_category varchar(20),
  product_name varchar(30),
  product_launch date
);

create table orders (
  order_id bigint,
  order_date date,
  quntity_orderd int,
  invoice_amount float(10,2),
  product_id bigint
);

insert into product(category_id, product_id, product_category, product_name, product_launch)
values 
(251, 1, 'Sport','Bat', '2022-01-01'),
(251, 2, 'Sport','Badminton', '2022-01-02'),
(251, 3, 'Sport','Bat', '2022-01-01'),
(251, 4, 'Sport','BasketBall', '2022-02-01'),
(251, 5, 'Sport','FootBall', '2022-03-01'),
(251, 6, 'Sport','Tabletennies Bat', '2022-03-02'),

(99, 7, 'Electronics','Smart Watch', '2022-01-01'),
(99, 8, 'Electronics','I-phone', '2022-02-01'),
(99, 9, 'Electronics','Smart Health Band', '2022-02-02'),
(99, 10, 'Electronics','Mouce', '2022-02-04'),
(99, 11, 'Electronics','Keyboard', '2022-03-01'),
(99, 12, 'Electronics','Laptop', '2022-03-05'),

(150, 13, 'Fashion','Jacket', '2022-01-01'),
(150, 14, 'Fashion','Belt', '2022-02-01'),
(150, 15, 'Fashion','Shooes', '2022-02-05'),
(150, 15, 'Fashion','T-shirt', '2022-01-09'),
(150, 16, 'Fashion','Hat', '2022-02-11'),
(150, 17, 'Fashion','Perfume', '2022-01-12');

insert into orders ( order_id, order_date, quntity_orderd, invoice_amount, product_id)
values
(1, '2025-01-02', 2, 845.50, 1),
(2, '2025-03-05', 1, 120.00, 15),
(3, '2025-01-08', 5, 7800.00, 3),
(4, '2025-03-10', 1, 9745.00, 16),
(5, '2025-01-12', 3, 1100.25, 5),
(6, '2025-03-15', 2, 2300.75, 6),
(7, '2025-01-18', 10, 6500.00, 17),
(8, '2025-01-20', 4, 3200.00, 8),
(9, '2025-03-22', 1, 415.00, 9),
(10, '2025-01-25', 2, 550.00, 10),
(11, '2025-01-28', 1, 899.99, 11),
(12, '2025-03-30', 3, 1450.50, 14),
(13, '2025-01-31', 2, 420.00, 2),
(14, '2025-02-02', 5, 12500.00, 3),
(15, '2025-02-04', 1, 1155.00, 4),
(16, '2025-02-06', 2, 3900.00, 13),
(26, '2025-02-06', 2, 2900.00, 14),
(17, '2025-02-08', 3, 1850.00, 6),
(18, '2025-03-10', 1, 525.00, 7),
(19, '2025-02-12', 4, 10500.00, 8),
(20, '2025-03-14', 2, 2040.00, 12),
(21, '2025-03-16', 1, 985.00, 10),
(22, '2025-02-18', 5, 1299.95, 11),
(23, '2025-03-20', 2, 1700.50, 7),
(24, '2025-02-22', 3, 675.30, 2),
(25, '2025-02-25', 1, 940.00, 3);

select * from product;
select * from orders;

with cte1 as (
  select 
    a.product_category,
    extract(month from b.order_date) as month_no,
    date_format(b.order_date, '%M') as month,
    count(b.order_id) as Total_Orders,
    sum(b.quntity_orderd) as Total_Quntity_Sold,
    round( sum(b.invoice_amount), 0) as Total_Sale
  from 
    product as a
  left join Orders as b 
  on 
    a.product_id = b.product_id
  group by 
    a.product_category, 
    extract(month from b.order_date),
    date_format(b.order_date, '%M')
  order by product_category, extract(month from b.order_date)
),

cte2 as (
select 
  *,
  round(lag(Total_Sale, 1, Total_Sale)over(partition by product_category order by month_no asc),0) as last_month_sales
from cte1
),


cte3 as (
select 
  *,
  coalesce(round(((Total_Sale - last_month_sales)/last_month_sales)*100, 2),0) as Growth
from cte2
)

select 
  product_category,
  month,
  Total_Orders as "Total Orders",
  Total_Quntity_Sold as "Quntity Sold",
  Total_Sale as "Gross Revenue",
  coalesce((case 
    when Growth > last_month_growth or growth is null then "Sale Increased"
    when Growth < last_month_growth then "sale Drop"
  end),"") as growth_bucket
from (
        select 
          *,
          coalesce(lag(Growth, 1, Growth)over(partition by product_category order by month_no),0) as last_month_growth
        from cte3 
) as t ;

































