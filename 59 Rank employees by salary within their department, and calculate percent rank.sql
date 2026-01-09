"""
    Q.Rank employees by salary within their department, and calculate percent rank.
"""


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- Insert sample rows
INSERT INTO employees (emp_id, emp_name, department, salary) VALUES
(1, 'Omkar', 'Data', 85000),
(2, 'Amit', 'Data', 90000),
(3, 'Priya', 'Data', 78000),
(4, 'Rahul', 'Product', 95000),
(5, 'Neha', 'Product', 88000),
(6, 'Karan', 'Product', 92000),
(7, 'Sara', 'HR', 60000),
(8, 'John', 'HR', 65000),
(9, 'Meera', 'HR', 62000);

select * from employees ;

with cte1 as (
  select 
    emp_id,
    emp_name,
    department,
    salary,
    sum(salary)over(partition by department) as total_salary,
    dense_rank()over(partition by department order by salary desc) as salary_rank 
  from employees
)

select 
  emp_id,
  emp_name,
  department,
  salary,
  salary_rank,
  round((salary / total_salary),2) as rank_constribution
from cte1 ;

"""
  Output =>
  
    +--------+----------+------------+--------+-------------+--------------------+
    | emp_id | emp_name | department | salary | salary_rank | rank_constribution |
    +--------+----------+------------+--------+-------------+--------------------+
    |      2 | Amit     | Data       |  90000 |           1 |               0.36 |
    |      1 | Omkar    | Data       |  85000 |           2 |               0.34 |
    |      3 | Priya    | Data       |  78000 |           3 |               0.31 |
    |      8 | John     | HR         |  65000 |           1 |               0.35 |
    |      9 | Meera    | HR         |  62000 |           2 |               0.33 |
    |      7 | Sara     | HR         |  60000 |           3 |               0.32 |
    |      4 | Rahul    | Product    |  95000 |           1 |               0.35 |
    |      6 | Karan    | Product    |  92000 |           2 |               0.33 |
    |      5 | Neha     | Product    |  88000 |           3 |               0.32 |
    +--------+----------+------------+--------+-------------+--------------------+
  
  """
