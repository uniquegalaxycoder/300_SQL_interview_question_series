"""
  Q74. Find customers who made purchases in every month of the current year.
"""
  
CREATE TABLE customer_purchase (
  purchase_id INT IDENTITY(1,1) PRIMARY KEY,
  customer_id VARCHAR(10),
  customer_name VARCHAR(50),
  purchase_date DATE,
  amount DECIMAL(10,2)
);

INSERT INTO customer_purchase (customer_id, customer_name, purchase_date, amount) VALUES
('C01', 'Alice Smith', '2026-01-15', 50.00),
('C01', 'Alice Smith', '2026-02-20', 30.00),
('C01', 'Alice Smith', '2026-03-05', 45.00),
('C01', 'Alice Smith', '2026-04-12', 60.00),
('C01', 'Alice Smith', '2026-05-18', 25.00),
('C01', 'Alice Smith', '2026-06-22', 70.00),
('C01', 'Alice Smith', '2026-07-04', 15.00),
('C01', 'Alice Smith', '2026-08-19', 85.00),
('C01', 'Alice Smith', '2026-09-30', 40.00),
('C01', 'Alice Smith', '2026-10-14', 55.00),
('C01', 'Alice Smith', '2026-11-25', 90.00),
('C01', 'Alice Smith', '2026-12-05', 120.00),
('C02', 'Bob Jones', '2026-01-10', 100.00),
('C02', 'Bob Jones', '2026-03-15', 150.00),
('C02', 'Bob Jones', '2026-04-20', 200.00),
('C02', 'Bob Jones', '2026-05-25', 50.00),
('C02', 'Bob Jones', '2026-07-12', 75.00),
('C02', 'Bob Jones', '2026-08-22', 90.00),
('C02', 'Bob Jones', '2026-09-05', 110.00),
('C02', 'Bob Jones', '2026-10-18', 30.00),
('C02', 'Bob Jones', '2026-11-11', 45.00),
('C02', 'Bob Jones', '2026-12-28', 65.00),
('C03', 'Charlie Brown', '2026-01-05', 20.00),
('C03', 'Charlie Brown', '2026-02-14', 25.00);


-- create a cte for month table
with months as (
  select 
    cast('2026-01-01' as date ) as month_add
  union all 
    select 
      dateadd(month , 1, month_add)
    from months
    where month_add < '2026-12-01'
) ,

cte1 as (
  select
    customer_name,
    month(purchase_date) as month_number,
    count(purchase_id) total_purchase,
    sum(amount) as total_spend
  from customer_purchase 
  group by 
    customer_name,
    month(purchase_date)
),

cte2 as (
select 
  a.customer_name,
  a.month_number,
  month(b.month_add) as months
from cte1 as a 
left join months as b 
on a.month_number = month(b.month_add)
)

select 
  customer_name,
  count(distinct month_number) as total_unique_months 
from cte2 
group by customer_name
having count(distinct month_number) = 12


"""
  Output =>

  customer_name                     total_unique_months
 ---------------------------------  -------------------
  Alice Smith                               12
  
  """











