-- Partition sales by month and show the highest sale of each month using FIRST_VALUE() or MAX() window.

create table sales (
  sales_id bigint,
  sales_date datetime,
  sales_amount float(10,2),
  sales_person varchar(10)
);

INSERT INTO sales (sales_id, sales_date, sales_amount, sales_person) VALUES
(1,'2025-01-02 09:12:15',1200.50,'Omkar'),
(2,'2025-01-10 14:30:45',850.75,'Rohan'),
(3,'2025-01-18 18:15:20',990.00,'Aditi'),
(4,'2025-01-23 11:11:11',4500.25,'Neha'),
(5,'2025-01-28 20:40:55',760.60,'Arjun'),
(6,'2025-02-01 08:08:08',5600.00,'Rohan'),
(7,'2025-02-05 12:25:36',340.40,'Aditi'),
(8,'2025-02-11 17:45:30',2750.25,'Omkar'),
(9,'2025-02-14 10:10:10',4800.80,'Arjun'),
(10,'2025-02-18 21:05:05',7800.00,'Neha'),
(11,'2025-02-22 09:50:50',1100.00,'Arjun'),
(12,'2025-03-02 11:20:11',6300.75,'Aditi'),
(13,'2025-03-06 16:45:33',500.25,'Rohan'),
(14,'2025-03-10 08:25:55',4100.15,'Neha'),
(15,'2025-03-14 20:20:20',920.00,'Arjun'),
(16,'2025-03-18 19:19:19',3400.00,'Omkar'),
(17,'2025-03-21 10:10:10',7600.00,'Rohan'),
(18,'2025-03-25 17:17:17',8200.50,'Neha'),
(19,'2025-03-28 14:14:14',18000.80,'Aditi'),
(20,'2025-04-01 09:15:00',7850.00,'Arjun'),
(21,'2025-04-05 12:12:12',2300.75,'Rohan'),
(22,'2025-04-09 18:40:40',9200.00,'Neha'),
(23,'2025-04-13 14:25:36',650.00,'Aditi'),
(24,'2025-04-17 20:30:30',1100.15,'Arjun'),
(25,'2025-04-21 10:40:40',120.50,'Rohan'),
(26,'2025-04-25 18:20:20',450.25,'Neha'),
(27,'2025-05-01 08:15:15',920.75,'Omkar'),
(28,'2025-05-06 17:48:59',15000.00,'Rohan'),
(29,'2025-05-10 09:09:09',560.56,'Aditi'),
(30,'2025-05-14 19:19:19',8900.00,'Neha'),
(31,'2025-05-18 11:11:11',150.25,'Arjun'),
(32,'2025-05-21 21:21:21',2300.75,'Rohan'),
(33,'2025-06-02 10:15:00',1150.90,'Aditi'),
(34,'2025-06-07 18:45:30',920.92,'Neha'),
(35,'2025-06-11 09:12:45',650.00,'Arjun'),
(36,'2025-06-15 19:50:50',300.15,'Omkar'),
(37,'2025-06-18 14:14:14',6500.00,'Rohan'),
(38,'2025-06-21 20:30:30',560.56,'Aditi'),
(39,'2025-06-25 10:40:40',1200.50,'Neha'),
(40,'2025-06-29 17:17:17',300.00,'Arjun');


-- Solution 1


with cte1 as (
select 
  sales_id,
  cast(sales_date as date) as sales_date,
  date_format(cast(sales_date as date), '%M') as month,
  sales_amount,
  sales_person
from sales 
),

cte2 as (
select
  month,
  round( FIRST_VALUE(sales_amount)over(partition by month order by sales_amount desc), 0) as high_sale
from cte1)

select 
  month,
  high_sale
from (
        select 
            *,
            row_number()over(partition by month) as row_num
        from cte2
) as a
where row_num = 1
;



-- Solution 2

with cte1 as (
select 
  sales_id,
  cast(sales_date as date) as sales_date,
  date_format(cast(sales_date as date), '%M') as month,
  sales_amount,
  sales_person
from sales 
),

cte2 as (
select
  month,
  max(sales_amount)over(partition by month order by sales_amount desc) as max_sales
from cte1
)

select 
  month,
  max_sales 
from (
      select 
        *,
        row_number()over(partition by month) as row_num
      from cte2 
    ) as b
where row_num = 1
;
















