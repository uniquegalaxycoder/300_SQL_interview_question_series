"""
  Q. Find the department with the lowest average salary
"""
create table employee(
  emp_id bigint,
  emp_department varchar(30),
  salary float(10,2)
);

insert into employee( emp_id, emp_department, salary)
values 
(10001, 'Tech', 22000),
(10002, 'Analytics', 42000),
(10003, 'Tech', 25000),
(10004, 'Tech', 31000),
(10005, 'Analytics', 36500),
(10006, 'Tech', 29000),
(10007, 'Finance', 22000),
(10008, 'Analytics', 41300),
(10009, 'Tech', 30000),
(10010, 'Analytics', 44000),
(10011, 'Tech', 29000),
(10012, 'Finance', 34500),
(10013, 'Analytics', 22000);

select 
  emp_department,
  round( avg(salary) ) as avg_salary  
from employee
group by 
   emp_department
order by 
   avg(salary) asc ;



