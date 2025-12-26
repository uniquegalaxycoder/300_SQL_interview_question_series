create table emp (
  empId bigint,
  empName varchar(20),
  id_Dept bigint,
  joiningDate date,
  manager_id bigint,
  Salary bigint
);

create table deptartment (
  dept_id bigint,
  department_name varchar(30)
);

insert into emp ( empId, empName, id_Dept, joiningDate, manager_id, salary) values
(1, 'Bob', 11, '2024-11-01',5, 65670 ),
(2, 'Charli', 12, '2022-01-01',6, 45000),
(3, 'Mona', 12, '2022-01-10',5, 63000),
(4, 'Robert', 11, '2023-11-20',2, 56890),
(5, 'Louis', 15, '2022-01-20',11, 76000),
(6, 'George', 11, '2024-02-23',11, 45000),
(7, 'Antonia', 15, '2024-01-24',11, 81000),
(8, 'Kyla', 13, '2025-01-01',2, 34000),
(9, 'Brian', 14, '2024-01-23',1, 56000),
(10, 'Stephan', null, '2024-01-12',5, 78000),
(11, 'Oliver', 11, '2024-10-01',5, 23470 ),
(12, 'Noah', 11, '2022-09-01',6, 45800);

insert into deptartment (dept_id, department_name) values
(11,'Analytics'),
(12, 'Finanace'),
(13, 'OPs'),
(14, 'Data Engineering'),
(15, 'Management');

with cte1 as (
select * from emp
left join deptartment
on emp.id_Dept = deptartment.dept_id)

select * from cte1 
where department_name is null
;







