"""
Find employees with no corresponding entries in the salary_history table.
"""


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50)
);

CREATE TABLE salary_history (
    history_id INT PRIMARY KEY,
    emp_id INT,
    salary_amount DECIMAL(10, 2),
    change_date DATE
);

INSERT INTO employees VALUES 
(1, 'Alice'), 
(2, 'Bob'), 
(3, 'Charlie');

INSERT INTO salary_history VALUES 
(101, 1, 50000, '2025-01-01'),
(102, 2, 60000, '2025-01-01');

SELECT * FROM employees;
SELECT * FROM salary_history ;

WITH CTE1 AS (
  SELECT 
    A.emp_id,
    A.emp_name,
    B.history_id,
    B.salary_amount,
    B.change_date
  FROM employees AS A 
  LEFT JOIN 
    salary_history AS B 
  ON 
    A.emp_id = B.emp_id
  WHERE B.history_id IS NULL
)

SELECT * FROM CTE1 ;

"""
  Output =>
  +--------+----------+------------+---------------+-------------+
  | emp_id | emp_name | history_id | salary_amount | change_date |
  +--------+----------+------------+---------------+-------------+
  |      3 | Charlie  |       NULL |          NULL | NULL        |
  +--------+----------+------------+---------------+-------------+
"""
