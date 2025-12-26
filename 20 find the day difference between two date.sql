create table customer (
  cust_id bigint not null,
  cust_name varchar(30) not null,
  app_signup_date date  not null,
  cust_location varchar(80),
  cust_phone_no bigint,
  verfiy_status boolean
);

create table sales (
  sales_id bigint not null,
  product_name varchar(30) not null,
  product_id bigint not null,
  customer_id bigint not null,
  purches_date date not null,
  sales_amount float not null,
  transaction_status boolean
);

insert into customer(cust_id, cust_name, app_signup_date, cust_location, cust_phone_no, verfiy_status) 
values 
(1, 'Joseph', '2020-01-01', 'New York City', 1234567890, 1),
(2, 'Robert', '2019-08-11', 'Los Angeles', 2345678901, 1),
(3, 'Kyle', '2020-11-23', 'Chicago', 1230987654, 0),
(4, 'Antonio', '2019-04-13', 'Houston', 1234098765, 1),
(5, 'Louis', '2019-09-21', 'Philadelphia', 9987654321, 1),
(6, 'Stephan', '2020-12-26', 'New York City', 4567890321, 1 ),
(7, 'Kyle', '2020-11-23', 'Chicago', 0987612345, 1) ;

insert into sales (sales_id, product_name, product_id, customer_id, purches_date, sales_amount, transaction_status)
values 
(106, 'Chai Cup Bulk', 506, 1, '2025-11-29', 500.00, 1),
(107, 'CCD Coffee Pack', 507, 2, '2025-11-30', 750.25, 1),
(108, 'Tapri Startup Guide', 508, 5, '2025-12-01', 1200.00, 0),
(109, 'Red Rooster Exhaust', 509, 5, '2025-12-02', 14000.00, 1),
(110, 'Chaayos Corporate Kit', 510, 6, '2025-12-03', 18000.00, 1),
(101, 'GT 650 Exhaust', 501, 1, '2025-11-24', 12500.75, 1),
(102, 'KP Racing Exhaust', 502, 2, '2025-11-25', 13500.00, 1),
(103, 'JBL Tune 720', 503, 9003, '2025-11-26', 4500.50, 0),
(104, 'Corporate Tea Pack', 504, 4, '2025-11-27', 850.00, 1),
(105, 'CSB Franchise Kit', 505, 4, '2025-11-28', 22000.00, 1);

with cte1 as (
select 
  *
from customer 
left join sales
on customer.cust_id = sales.customer_id
)

select 
  cust_id,
  cust_name,
  app_signup_date,
  cust_location,
  cust_phone_no,
  product_name,
  sales_amount,
  purches_date,
  datediff(purches_date, app_signup_date) as date_diff
from cte1
where sales_id is not null
and transaction_status = 1

;

