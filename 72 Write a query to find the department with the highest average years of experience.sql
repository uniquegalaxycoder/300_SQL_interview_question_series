"""
Q72. Write a query to find the department with the highest average years of experience.
"""

create table employee (
  emp_id varchar(10),
  emp_joining_date date,
  emp_dept_id varchar(20)
) ;

create table dept (
  dept_id varchar(10),
  dept_name varchar(50)
);

insert into employee (emp_id, emp_joining_date, emp_dept_id) values 
('E001', '2022-01-15', 'D01'),
('E002', '2023-08-20', 'D02'),
('E003', '2022-06-10', 'D02'),
('E004', '2021-01-05', 'D03'),
('E005', '2020-04-12', 'D03'),
('E006', '2025-08-19', 'D04'),
('E007', '2024-02-11', 'D01'),
('E008', '2023-05-25', 'D02'),
('E009', '2021-09-01', 'D03'),
('E010', '2020-01-10', 'D04');

insert into dept (dept_id, dept_name) values 
('D01', 'Human Resources'),
('D02', 'Engineering'),
('D03', 'Marketing'),
('D04', 'Finance');

-- select * from employee ;
-- select * from dept ;

with cte1 as (
  select 
    emp_id,
    emp_joining_date,
    dept_name,
    datediff(year, emp_joining_date, GETDATE()) as experience
  from employee as a 
  left join dept as b 
  on a.emp_dept_id = b.dept_id
),

cte2 as (
  select
    dept_name,
    avg(experience) as avg_experience
  from cte1
  group by dept_name
) 

select * from cte2 
order by avg_experience desc 
;

"""
  Output =>

  dept_name                                          avg_experience
-------------------------------------------------- --------------
Marketing                                                       5
Engineering                                                     3
Finance                                                         3
Human Resources                                                 3
  
  
  """















