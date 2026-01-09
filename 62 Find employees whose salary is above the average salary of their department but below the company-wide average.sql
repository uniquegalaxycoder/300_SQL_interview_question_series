"""
    Q.Find employees whose salary is above the average salary of their department but below the company-wide average.
"""

create table employee (
  emp_id bigint,
  salary decimal(10,2),
  department varchar(50)
);

INSERT INTO employee (emp_id, salary, department) VALUES
(1,  95000.00, 'Data Science'),
(2,  87000.50, 'Data Science'),
(3,  92000.75, 'Data Science'),

(4, 110000.00, 'AI Engineering'),
(5, 105500.25, 'AI Engineering'),

(6, 102000.00, 'ML Engineering'),
(7,  99000.00, 'ML Engineering'),
(8,  97000.80, 'ML Engineering'),

(9,  78000.00, 'Data Analyst'),
(10, 72000.40, 'Data Analyst'),
(11, 76000.00, 'Data Analyst'),

(12, 68000.00, 'Strategy'),
(13, 71000.00, 'Strategy');

select * from employee ;

with cte1 as (
  select 
    emp_id,
    department,
    salary,
    round(avg(salary)over(partition by department)) as dept_avg_salary,
    round(avg(salary)over()) as total_company_salary
  from employee
)

select 
  * 
from cte1
where 
      salary > dept_avg_salary 
  and salary < total_company_salary ;


"""
  Output =>
    +--------+--------------+----------+-----------------+----------------------+
    | emp_id | department   | salary   | dept_avg_salary | total_company_salary |
    +--------+--------------+----------+-----------------+----------------------+
    |      9 | Data Analyst | 78000.00 |           75333 |                88654 |
    |     11 | Data Analyst | 76000.00 |           75333 |                88654 |
    |     13 | Strategy     | 71000.00 |           69500 |                88654 |
    +--------+--------------+----------+-----------------+----------------------+
  
  """




