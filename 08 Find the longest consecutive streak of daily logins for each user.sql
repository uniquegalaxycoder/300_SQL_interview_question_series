create table users (
  user_id integer,
  login_date date
);

insert into users(user_id, login_date) values 
(1, '2025-01-01'),
(1, '2025-01-02'),
(1, '2025-01-03'),
(1, '2025-01-05'),
(1, '2025-01-06'),
(2, '2025-02-10'),
(2, '2025-02-12'),
(2, '2025-02-13'),
(2, '2025-02-14'),
(3, '2025-03-01'),
(3, '2025-03-02'),
(3, '2025-03-05'),
(3, '2025-03-06'),
(3, '2025-03-07'),
(4, '2025-04-10'),
(4, '2025-04-11'),
(4, '2025-04-12'),
(4, '2025-04-13'),
(4, '2025-04-14'),
(4, '2025-04-20'),
(5, '2025-05-01'),
(5, '2025-05-02');

with cte1 as (
select 
  user_id,
  login_date,
  row_number()over(partition by user_id order by login_date) as rn
from users
)

,cte2 as (
  select 
    user_id,
    login_date,
    date_sub(login_date, interval rn day) as days
  from cte1
)

select 
  user_id,
  max(counts) as longest_strik
from (
select 
  user_id,
  days,
  count(user_id) as counts
from cte2
group by user_id, days
) as a 
group by user_id
order by user_id









