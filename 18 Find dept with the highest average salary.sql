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
(10, 'Stephan', 'Analytics', '2024-01-12',5, 78000),
(11, 'Oliver', 'Analytics', '2024-10-01',5, 23470 ),
(12, 'Noah', 'Tech', '2022-09-01',6, 45800),
(13, 'Poppy', 'Analytics', '2022-03-10',5, 67500),
(14, 'Phoebe', 'Finance', '2023-10-20',2, 66890),
(15, 'Daisy', 'Data Engineering', '2022-04-20',11, 52000),
(16, 'Rose', 'Tech', '2024-06-23',11, 43000),
(17, 'Daisy', 'Strategy', '2024-05-24',11, 78400),
(18, 'Catherine', 'OPs', '2025-11-21',2, 45780),
(19, 'Elizabeth', 'Marketing', '2024-08-23',1, 66770),
(20, 'Emily', 'Analytics', '2024-05-12',5, 45900);


with cte1 as (
select 
  emp_Dept,
  round(avg(salary),0) as avg_salary
from emp
group by emp_Dept),

cte2 as (
select 
  *,
  dense_rank()over(order by avg_salary desc) as salary_rank
from cte1 
)

select * from cte2 ;






