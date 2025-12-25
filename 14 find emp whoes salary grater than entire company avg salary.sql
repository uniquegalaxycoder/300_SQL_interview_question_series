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

select 
  empId,
  empName,
  Salary
from emp 
where Salary > ( select avg(salary) from emp)
order by salary desc
 ;
