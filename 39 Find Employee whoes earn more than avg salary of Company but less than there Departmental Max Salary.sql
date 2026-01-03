"""
  Find the employee who earn more than the avg salary across the company but, less than the heights salary in their department
"""
create table employee (
  emp_id bigint,
  emp_name varchar(50),
  joining_date DATE,  
  department varchar(50),
  salary float(10,2)
);

insert into employee( emp_id, emp_name, joining_date, department, salary)
values 
(1, 'John Doe', '2022-01-15', 'Tech', 25000),
(2, 'Jane Smith', '2022-02-10', 'Sales', 22000),
(3, 'Michael Brown', '2022-03-05', 'HR', 18000),
(4, 'Emily Davis', '2022-03-20', 'Tech', 27000),
(5, 'Chris Wilson', '2022-04-12', 'Finance', 30000),
(6, 'Anna Taylor', '2022-05-01', 'Marketing', 21000),
(7, 'David Miller', '2022-05-15', 'Tech', 26000),
(8, 'Sarah Moore', '2022-06-10', 'Sales', 23000),
(9, 'James White', '2022-07-01', 'HR', 19000),
(10, 'Laura Hall', '2022-08-15', 'Finance', 31000),
(11, 'Kevin Adams', '2022-09-05', 'Tech', 28000),
(12, 'Linda Scott', '2022-10-10', 'Marketing', 22500),
(13, 'Robert Green', '2022-11-20', 'Sales', 24000),
(14, 'Maria King', '2022-12-01', 'Tech', 29000),
(15, 'Steven Baker', '2023-01-10', 'HR', 20000),
(16, 'Karen Wright', '2023-02-15', 'Finance', 32000),
(17, 'Daniel Hill', '2023-03-01', 'Marketing', 21500),
(18, 'Patricia Lopez', '2023-04-10', 'Tech', 26500),
(19, 'Mark Rivera', '2023-05-20', 'Sales', 23500),
(20, 'Susan Young', '2023-06-05', 'Finance', 33000);

select * from employee;

with cte1 as (
  select 
    *
  from employee as a
  where 
      salary > ( select avg(salary) from employee )
  and 
      salary < ( 
                    select  max(salary) as dept_max 
                    from employee
                    where department = a.department
                )
  ) 

select * from cte1 ;

"""
  Output => 
+--------+----------------+--------------+------------+----------+
| emp_id | emp_name       | joining_date | department | salary   |
+--------+----------------+--------------+------------+----------+
|      4 | Emily Davis    | 2022-03-20   | Tech       | 27000.00 |
|      5 | Chris Wilson   | 2022-04-12   | Finance    | 30000.00 |
|      7 | David Miller   | 2022-05-15   | Tech       | 26000.00 |
|     10 | Laura Hall     | 2022-08-15   | Finance    | 31000.00 |
|     11 | Kevin Adams    | 2022-09-05   | Tech       | 28000.00 |
|     16 | Karen Wright   | 2023-02-15   | Finance    | 32000.00 |
|     18 | Patricia Lopez | 2023-04-10   | Tech       | 26500.00 |
+--------+----------------+--------------+------------+----------+
"""






