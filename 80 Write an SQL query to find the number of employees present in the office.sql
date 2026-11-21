"""    Q. Write an SQL query to find the number of employees present in the office.
"""

CREATE TABLE attendance (
    emp_id INT,
    action VARCHAR(10),
    time DATETIME
);

INSERT INTO attendance (emp_id, action, time) VALUES
(1, 'in',  '2019-12-22 09:00:00.000'),
(1, 'out', '2019-12-22 09:15:00.000'),
(2, 'in',  '2019-12-22 09:00:00.000'),
(2, 'out', '2019-12-22 09:15:00.000'),
(2, 'in',  '2019-12-22 09:30:00.000'),
(3, 'out', '2019-12-22 09:00:00.000'),
(3, 'in',  '2019-12-22 09:15:00.000'),
(3, 'out', '2019-12-22 09:30:00.000'),
(3, 'in',  '2019-12-22 09:45:00.000'),
(4, 'in',  '2019-12-22 09:45:00.000'),
(5, 'out', '2019-12-22 09:40:00.000');

select * from attendance ;

with cte1 as (
    select
      emp_id,
      action,
      time,
      cast(time as date) as dates
    from attendance
),

cte2 as (
select 
  emp_id,
  action,
  time,
  row_number()over(partition by emp_id order by time desc) as action_count 
from cte1)

select 
  emp_id
from cte2 
where action_count = 1 and action = 'in'; 

-- solution 2
with cte11 as (
select 
  emp_id,
  max(case when action = 'in' then time end) as in_time,
  max(case when action = 'out' then time end) as out_time
from attendance 
group by emp_id)

select emp_id 
from cte11 
where in_time >= out_time or out_time is null;
