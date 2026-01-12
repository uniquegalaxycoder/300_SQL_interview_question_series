"""
    Q.Retrieve the Nth highest salary from the employees table.
"""

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees VALUES 
(1, 'Amit', 'IT', 90000),    
(2, 'Priya', 'HR', 85000),   
(3, 'Rahul', 'IT', 75000),   
(4, 'Suman', 'Finance', 75000), 
(5, 'Vikram', 'Sales', 60000), 
(6, 'Neha', 'IT', 55000);    

select * from employees ;

WITH CTE1 AS (
  SELECT 
    *,
    DENSE_RANK()OVER(ORDER BY salary DESC ) AS SALARY_RANK
  FROM employees
)

  --n = 3
SELECT * FROM CTE1
WHERE SALARY_RANK = 3 ;

"""
  Output =>
  +--------+----------+------------+----------+-------------+
  | emp_id | emp_name | department | salary   | SALARY_RANK |
  +--------+----------+------------+----------+-------------+
  |      3 | Rahul    | IT         | 75000.00 |           3 |
  |      4 | Suman    | Finance    | 75000.00 |           3 |
  +--------+----------+------------+----------+-------------+
"""


