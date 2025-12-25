create table emp (
  empId bigint,
  empName varchar(20),
  emp_Dept varchar(20),
  joiningDate date,
  Salary bigint
);

insert into emp (empId, empName, emp_Dept, joiningDate, Salary) VALUES
(1, 'Bob', 'IT', '2024-11-01', 25670 ),
(2, 'Charli', 'Tech', '2022-01-01', 65000),
(3, 'Mona', 'Analytics', '2022-01-10', 63000),
(4, 'Robert', 'Finance', '2023-11-20', 56890),
(5, 'Louis', 'Data Engineering', '2022-01-20', 76000),
(6, 'George', 'Tech', '2024-02-23', 45000),
(7, 'Antonia', 'Strategy', '2024-01-24', 81000),
(8, 'Kyla', 'OPs', '2025-01-01', 34000),
(9, 'Brian', 'Marketing', '2024-01-23', 56000),
(10, 'Stephan', 'Analytics', '2024-01-12', 78000);

select * from emp ;



-- Q. write a query to calculate the difference between current row and previous row's salary 

-- Solution 1  ( using lag window function )

select 
  *,
  (salary- lag(salary)over( order by empId asc)) as salary_diff 
from emp;


-- Solution 2  ( using self join )

select 
  empId,
  empName,
  emp_Dept,
  joiningDate,
  salary,
  (current_salary - previous_salary) as salary_diff
from (
select 
  e1.empId,
  e1.empName,
  e1.emp_Dept,
  e1.joiningDate,
  e1.salary,
  e1.salary as current_salary,
  e2.salary as previous_salary
from emp as e1 left join emp as e2 
on e2.empId = ( select max(empId) from emp where e1.empId > empId)
) as t
order by empId ;
