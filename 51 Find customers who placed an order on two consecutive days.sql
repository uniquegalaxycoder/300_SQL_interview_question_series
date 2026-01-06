"""
    Q.Find customers who placed an order on two consecutive days.
"""
  
create table users (
  user_id bigint primary key,
  user_name varchar(50)
);

create table orders (
  order_id bigint,
  order_date date,
  order_amount decimal(10,2),
  user_id bigint,
  foreign key (user_id) references users(user_id)
);

insert into users ( user_id, user_name)
values 
(10001, 'User 1'),
(10002, 'User 2'),
(10003, 'User 3'),
(10004, 'User 4'),
(10005, 'User 5'),
(10006, 'User 6'),
(10007, 'User 7');

insert into orders( order_id, order_date, order_amount, user_id)
values 
(30301, '2024-02-12', 1230, 10001),
(30302, '2024-02-13', 1030, 10001),
(30303, '2024-02-13', 180, 10001),
(30309, '2024-02-12', 190, 10002),
(30309, '2024-02-14', 130, 10002),
(30314, '2024-03-14', 1630, 10003),
(30315, '2024-03-15', 1245, 10003),
(30318, '2024-02-21', 1800, 10003),
(30325, '2024-02-24', 1230, 10001);

select * from users ;
select * from orders ;




with cte1 as (
  select 
    a.user_id,
    a.user_name,
    b.order_date,
    sum(b.order_amount) as total_order_amount   -- if user place multiple on same date i.e aggregated data
  from
      users as a 
  inner join 
      orders as b 
  on 
    a.user_id = b.user_id
  group by 
    a.user_id,
    a.user_name,
    b.order_date
),

cte2 as (
select 
  user_id,
  user_name,
  order_date as current_order_date,
  lag(order_date) over(partition by user_id order by order_date) as last_order_date
from cte1
)

select 
  *,
  datediff(current_order_date, last_order_date) as day_differ
from
  cte2 
where 
  datediff(current_order_date, last_order_date) =1
  ;

"""
  Output =>
    +---------+-----------+--------------------+-----------------+------------+
    | user_id | user_name | current_order_date | last_order_date | day_differ |
    +---------+-----------+--------------------+-----------------+------------+
    |   10001 | User 1    | 2024-02-13         | 2024-02-12      |          1 |
    |   10003 | User 3    | 2024-03-15         | 2024-03-14      |          1 |
    +---------+-----------+--------------------+-----------------+------------+
  
  """



















