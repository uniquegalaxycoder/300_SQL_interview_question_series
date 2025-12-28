-- Identify sales drop streaks (days where sales kept decreasing) using LAG() and conditions.

create table sales (
  salesId bigint,
  productId bigint,
  salesDate date,
  invoiceId bigint,
  invoiceAmount float(10,2)
);

insert into sales ( salesId, productId, salesDate, invoiceId, invoiceAmount)
values 
(1, 101, '2025-01-01', 5001, 400.50),
(2, 102, '2025-01-02', 5002, 980.00),
(3, 103, '2025-01-03', 5003, 500.75),
(4, 101, '2025-01-04', 5004, 300.00),
(5, 104, '2025-01-05', 5005, 870.25),
(6, 105, '2025-01-01', 5006, 700.90),
(7, 106, '2025-01-01', 5007, 600.00),
(8, 102, '2025-01-02', 5008, 540.00),
(9, 107, '2025-01-06', 5009, 899.99),
(10, 108, '2025-01-03', 5010, 15000.00),
(11, 109, '2025-01-07', 5011, 8900.50),
(12, 110, '2025-01-08', 5012, 720.80),
(13, 103, '2025-01-09', 5013, 3100.00),
(14, 111, '2025-01-02', 5014, 660.00),
(15, 112, '2025-01-10', 5015, 1250.00),
(16, 113, '2025-01-08', 5016, 499.50),
(17, 114, '2025-01-11', 5017, 8600.00),
(18, 102, '2025-01-12', 5018, 770.70),
(19, 115, '2025-01-11', 5019, 2200.00),
(20, 116, '2025-01-01', 5020, 3050.00);

with cte1 as (
select 
  salesDate,
  count(salesId) as total_product_sold,
  sum(invoiceAmount) as total_sales
from sales
group by salesDate
),

cte2 as (
select 
  *,
  lag(total_sales)over(order by salesDate asc) as yesterday_sales
from cte1
),

cte3 as (
select 
  *,
  case 
    when total_sales >= yesterday_sales then 'Salse Increase'
    when total_sales < yesterday_sales then 'Salse Drop'
  end as bucket
from cte2
),

cte4 as (
select 
  *,
  sum( 
      case 
        when bucket = 'Salse Increase' or bucket is null then 0 else 1 end )
  over(partition by salesDate) as sales_strik
from cte3
)

select 
  *
from (
select 
  *,
  row_number()over(partition by sales_strik order by salesDate ) as streak_length
from cte4
) as t ;
where sales_strik = 1;






