create table emp (
  empId bigint,
  empName varchar(20),
  emp_Dept varchar(20),
  joiningDate date,
  manager_id bigint,
  Salary int
);



insert into emp (empId, empName, emp_Dept, joiningDate,manager_id, Salary) VALUES
(1, 'Bob', 'IT', '2024-11-01',5, 65670 ),
(2, 'Charli', 'Tech', '2022-01-01',6, 45000),
(3, 'Mona', 'Analytics', '2022-01-10',5, 63000),
(4, 'Robert', 'Finance', '2023-11-20',2, 56890),
(5, 'Louis', 'Data Engineering', '2022-01-20',11, 76000),
(6, 'George', 'Tech', '2024-02-23',11, 45000),
(7, 'Antonia', 'Strategy', '2024-01-24',11, 81000),
(8, 'Kyla', 'OPs', '2025-01-01',2, 34000),
(9, 'Brian', 'Marketing', '2024-01-23',1, 56000),
(10, 'Stephan', 'Analytics', '2024-01-12',5, 78000);

-- Q. Find employees who have the same salary or more than managers salary

--( solved using self join ) 
select 
  e1.*,
  e2.empId as managerid,
  e2.Salary as manager_salary
from 
  emp as e1 
left join 
  emp as e2
on 
  e1.manager_id = e2.empId
where 
  e1.Salary >= e2.Salary
order by empId;


