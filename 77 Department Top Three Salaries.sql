"""
  A company's executives are interested in seeing who earns the most money in each of the company's departments. 
  A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

- Write a solution to find the employees who are high earners in each of the departments.

- Return the result table in any order.
"""

create table employee (
  id int,
  name varchar(255),
  salary int,
  departmentID int
);

create table department (
  id int,
  name varchar(255)
) ;

insert into employee (id, name, salary, department) values 
('1', 'Joe', '85000', '1'),
('2', 'Henry', '80000', '2'),
('3', 'Sam', '60000', '2'),
('4', 'Max', '90000', '1'),
('5', 'Janet', '69000', '1'),
('6', 'Randy', '85000', '1'),
('7', 'Will', '70000', '1') ;

insert into department (id, name) values 
('1', 'IT'),
('2', 'Sales') ;

with cte1 as (
    select 
        e.name as employee,
        e.salary,
        d.name as department
    from employee as e 
    left join department as d 
    on e.departmentid = d.id
)

select 
    department,
    employee,
    salary
from (
select 
    department,
    employee,
    salary,
    dense_rank()over(partition by department order by salary desc ) as dept_salary_rank 
from cte1 
) as table_1 
where table_1.dept_salary_rank <= 3 ;

"""
  Output =>
  
| Department | Employee | Salary |
| ---------- | -------- | ------ |
| IT         | Joe      | 85000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Will     | 70000  |
  
  """
