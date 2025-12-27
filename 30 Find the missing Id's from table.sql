
create table numbers_table (
  id int 
);

insert into numbers_table (id) values
(1),
(2),
(3),
(4),
(6),
(7),
(10);

-- Approach 1 [ Using union all ]
with cte1 as (
select 
  num as sequence_num 
from (
    select 1 as num 
  union all select 2 
  union all select 3
  union all select 4
  union all select 5
  union all select 6
  union all select 7
  union all select 8
  union all select 9 
  union all select 10)   
 )   

select 
  a.sequence_num
from 
    cte1 as a 
left join 
    numbers_table as b 
on 
    a.sequence_num = b.id
where 
    b.id is null ;


"""
-- explain ->
  
1) Here in CTE1 we have created a new table with the help of union all operator 
  - Union all help to stack the number in single row one below one in table
  - Here we can also use union but union remove duplicates & slow process for n number. So Union all used its faster than union
2) Then we join the both table with the left join where all rows from left table (cte1) and only matched rows from right side table(numbers_table). 
   If data has not matching from right table then it will show Null 
3) Then we filter the rows where right table(numbers_table) column id is null.

Note : Also we can solve this Question with recursive Methods.
"""

  
  -- Approach 1 [ Using Recursion methide ]

with recursive sequence as (
  select 
    1 as num
  union all
  select num + 1 from sequence where num < 10 )

select 
  a.num as missing_num
from 
    sequence as a 
left join 
    numbers_table as b 
on 
  a.num = b.id
where b.id is null ;

