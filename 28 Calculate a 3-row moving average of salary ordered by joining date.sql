-- Calculate a 3-row moving average of salary ordered by joining date.

create table employee (
  emp_id bigint,
  emp_name varchar(20),
  joining_date date,
  department varchar(20),
  salary float(10,2)
);

insert into employee ( emp_id, emp_name, joining_date, department, salary)
values 
(1, 'Amit', '2024-01-10', 'Analytics', 75000.00),
(2, 'Priya', '2023-12-05', 'Data Engineering', 82000.50),
(3, 'Rahul', '2022-11-20', 'Finance', 61000.75),
(4, 'Neha', '2024-03-15', 'Operations', 54000.25),
(5, 'Omkar', '2024-07-01', 'Product', 68000.00),
(6, 'Rohit', '2023-08-18', 'Analytics', 72000.60),
(7, 'Simran', '2022-09-09', 'Management', 91000.90),
(8, 'Irfan', '2025-01-12', 'Operations', 43000.45),
(9, 'Anjali', '2024-05-22', 'Finance', 65000.30),
(10, 'Kabir', '2023-10-30', 'Product', 70000.00),
(11, 'Meera', '2024-02-14', 'Analytics', 77000.80),
(12, 'Arjun', '2022-06-25', 'Data Engineering', 83000.20),
(13, 'Sanya', '2023-05-05', 'Product', 69000.55),
(14, 'Dev', '2024-09-19', 'Finance', 62000.00),
(15, 'Farah', '2023-11-11', 'Operations', 51000.10),
(16, 'Karan', '2022-12-29', 'Management', 88000.00),
(17, 'Lara', '2024-04-07', 'Product', 73500.25),
(18, 'Manoj', '2023-01-21', 'Analytics', 71000.95),
(19, 'Zoya', '2025-02-01', 'Operations', 45000.00),
(20, 'Vikram', '2024-06-30', 'Data Engineering', 84000.75);


select 
  *,
  round(avg(salary)over(order by joining_date rows between 3 preceding and current row),0) as moving_salary_avg
from employee;
