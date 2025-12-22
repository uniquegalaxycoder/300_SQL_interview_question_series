CREATE TABLE numbers (
    id INT
);

INSERT INTO numbers (id) VALUES
(1),
(2),
(3),
(5),
(6),
(9),
(10);

select 
  id,
  next_id ,
  id + 1 as gap_start,
  next_id - 1 as gap_end,
  (next_id - id ) as num
from (
select 
  id,
  lead(id)over(order by id) as next_id
from numbers 
) as t 
where next_id - id > 1
