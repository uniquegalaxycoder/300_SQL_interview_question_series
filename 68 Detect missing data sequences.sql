"""
    Q.Detect missing data sequences.
"""

create table table1 (
  id int 
);

insert into table1 values 
(1),
(2),
(4),
(5),
(7),
(9),
(10)
;

select * from table1 ; 

with recursive cte1 as (
    select 
      1 as num 
      union all 
      select 
        num + 1 
      from cte1 
      where num < 10
)

select 
  cte1.num,
  table1.id 
from 
    cte1 as cte1 
left join 
    table1 as table1 
on 
    cte1.num  = table1.id
where 
  table1.id is null 
;

"""
    Output =>
    +------+------+
    | num  | id   |
    +------+------+
    |    3 | NULL |
    |    6 | NULL |
    |    8 | NULL |
    +------+------+
"""



