"""
    Q. List all departments and their employee counts, including departments with zero employees.
"""

create table departments (
  dept_id bigint primary key,
  dept_name varchar(40)
);

create table employees (
  emp_id bigint,
  emp_joining_date date,
  dept_id bigint,
  foreign key (dept_id) references departments(dept_id)
) ;

INSERT INTO departments (dept_id, dept_name) VALUES 
(1, 'IT'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'HR'),
(5, 'Finance');

INSERT INTO employees (emp_id, emp_joining_date, dept_id) VALUES 
(101, '2025-01-01', 1), 
(102, '2025-01-02', 1), 
(103, '2025-01-03', 1), 
(104, '2025-01-15', 2), 
(105, '2025-01-16', 2), 
(106, '2025-02-01', 3), 
(107, '2025-02-10', 1), 
(108, '2025-02-11', 1), 
(109, '2025-03-01', 4), 
(110, '2025-03-05', 2); 

select * from departments ;
select * from employees ;

with cte1 as (
  select 
    a.dept_id,
    a.dept_name,
    count(b.emp_id) as total_emplyee
  from
    departments as a 
  left join 
    employees as b 
  on 
    a.dept_id = b.dept_id
  group by
    a.dept_id,
    a.dept_name
)

select 
  *
from cte1 ;

"""
  Output =>
    +---------+-----------+---------------+
    | dept_id | dept_name | total_emplyee |
    +---------+-----------+---------------+
    |       1 | IT        |             5 |
    |       2 | Sales     |             3 |
    |       3 | Marketing |             1 |
    |       4 | HR        |             1 |
    |       5 | Finance   |             0 |
    +---------+-----------+---------------+

"""

