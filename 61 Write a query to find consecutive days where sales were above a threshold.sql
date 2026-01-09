"""
      Q.Write a query to find consecutive days where sales were above a threshold.
        Note : threshold > 1500
"""

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    sales_amount DECIMAL(10,2)
);

INSERT INTO sales (sale_id, sale_date, sales_amount) VALUES
(1,  '2026-01-01', 1200.00),
(2,  '2026-01-02', 1500.00),
(3,  '2026-01-03', 900.00),
(4,  '2026-01-04', 1800.00),
(5,  '2026-01-05', 2000.00),
(6,  '2026-01-06', 2100.00),
(7,  '2026-01-07', 800.00),
(8,  '2026-01-08', 2500.00),
(9,  '2026-01-09', 2600.00),
(10, '2026-01-10', 2700.00),
(11, '2026-01-11', 1100.00),
(12, '2026-01-12', 3000.00),
(13, '2026-01-13', 3100.00),
(14, '2026-01-14', 700.00),
(15, '2026-01-15', 3300.00),
(16, '2026-01-16', 3400.00);

select * from sales ;
-- threshold > 1500

with cte1 as (
  select 
    sale_id,
    sales_amount,
    sale_date,
    lag(sale_date)over(order by sale_date) as yesterday,
    datediff(sale_date, lag(sale_date)over(order by sale_date)) as days_diff
  from sales
  where sales_amount > 1500
)

, cte2 as (
select 
  *,
  case when days_diff = 1 or days_diff is null 
    then 0 
    else 1 
  end as lenghts
from cte1
)

, cte3 as (
select 
  *,
  sum(lenghts)over(order by sale_date) as streaks_id
from cte2 
)

select 
  min(sale_date) as "start date",
  max(sale_date) as "end date" ,
  count(*) as "Total Consicutive Day",
  avg(sales_amount) as "Avg Sales"
from
  cte3 
group by 
  streaks_id ;

"""
  Output =>
    +------------+------------+-----------------------+-------------+
    | start date | end date   | Total Consicutive Day | Avg Sales   |
    +------------+------------+-----------------------+-------------+
    | 2026-01-04 | 2026-01-06 |                     3 | 1966.666667 |
    | 2026-01-08 | 2026-01-10 |                     3 | 2600.000000 |
    | 2026-01-12 | 2026-01-13 |                     2 | 3050.000000 |
    | 2026-01-15 | 2026-01-16 |                     2 | 3350.000000 |
    +------------+------------+-----------------------+-------------+
"""










