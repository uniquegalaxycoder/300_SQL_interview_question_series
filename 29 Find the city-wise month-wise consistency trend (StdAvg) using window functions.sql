
-- Find the city-wise month-wise consistency trend (Std/Avg) using window functions.

create table revenue (
  sale_id bigint,
  sale_date date,
  sale_amount float(10,2),
  city varchar(10)
);

INSERT INTO revenue (sale_id, sale_date, sale_amount, city) VALUES
(1,  '2025-01-05', 1200.50, 'PUNE'),
(2,  '2025-01-20', 980.00,  'MUMBAI'),
(3,  '2025-02-11', 1500.00, 'PUNE'),
(4,  '2025-02-18', 2300.75, 'NOIDA'),
(5,  '2025-03-03', 875.20,  'CHENNAI'),
(6,  '2025-03-29', 1900.00, 'MUMBAI'),
(7,  '2025-04-10', 2100.40, 'PUNE'),
(8,  '2025-04-22', 670.00,  'GURGAON'),
(9,  '2025-05-14', 2500.00, 'HYD'),
(10, '2025-05-30', 1320.80, 'PUNE'),
(11, '2025-06-06', 980.50,  'CHENNAI'),
(12, '2025-06-27', 1750.25, 'NOIDA'),
(13, '2025-07-04', 1999.99, 'MUMBAI'),
(14, '2025-07-19', 1450.00, 'HYD'),
(15, '2025-08-08', 2250.50, 'PUNE'),
(16, '2025-08-26', 3000.00, 'MUMBAI'),
(17, '2025-09-15', 870.75,  'GURGAON'),
(18, '2025-10-09', 1100.00, 'NOIDA'),
(19, '2025-11-11', 4500.00, 'PUNE'),
(20, '2025-12-24', 2890.60, 'MUMBAI');

-- to calculate consistency we need stadered devation & Avg

-- consistency formula = ( 1- ( stndered deviation / avg ))

with cte1 as (
select 
  sale_id,
  sale_date,
  city,
  date_format(sale_date, '%m-%y') as sales_month_year,
  sale_amount
from revenue),

cte2 as (
select 
  city,
  sales_month_year,
  sum(sale_amount) as total_sales
from cte1
group by city, sales_month_year
),

cte3 as (
select 
  *,
  avg(total_sales)over(partition by city order by sales_month_year) as running_avg_sales,
  round(stddEV(total_sales)over(partition by city order by  sales_month_year),0) as stndered_deviation
from cte2 
)

select 
  *,
  ( case 
        when stndered_deviation = 0 then '' 
        else round( (1- (stndered_deviation / running_avg_sales)), 2) 
    end 
  ) as consistency
from  cte3
;


here stddev() function is used to calculate standered deviation we can use stddev_pop() formpopulation 
if you want to calculate sample standered deviation then use stddev_samp() 
