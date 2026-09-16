"""
Write a solution to find employees who have the highest salary in each of the departments.
"""

create table Employee (
  id int,
  name varchar(255),
  salary int,
  departmentId int
);

create table Department (
  id int,
  name varchar(255)
)

insert into Employee (id, name, salary, departmentId) values 
('1', 'Joe', '70000', '1'),
('2', 'Jim', '90000', '1'),
('3', 'Henry', '80000', '2'),
('4', 'Sam', '60000', '2'),
('5', 'Max', '90000', '1');

insert into Department (id, name) values 
('1', 'IT'),
('2', 'Sales') ;

with cte1 as (
    select 
        e.name as employee,
        e.salary,
        d.name as Department
    from employee as e  
    left join department as d 
    on e.departmentid = d.id
)

select 
    Department,
    Employee,
    salary
 from (
    select 
        *,
        rank()over(partition by department order by salary desc ) as dept_salary_rank 
    from cte1
 ) as table1
 where table1.dept_salary_rank = 1 ;

"""
  Output =>
| Department | Employee | salary |
| ---------- | -------- | ------ |
| IT         | Jim      | 90000  |
| IT         | Max      | 90000  |
| Sales      | Henry    | 80000  |
  
  """
