"""
  Q.Find employees who joined in the last 6 months.
  """

CREATE TABLE EMPLOYEE (
    EMP_ID INT,
    EMP_NAME VARCHAR(100),
    DEPARTMENT VARCHAR(100),
    SALARY INT ,
    MANAGER_ID INT,
    joining_date DATE
    );
    

INSERT INTO EMPLOYEE VALUES 
(1, 'RASHI',  'IT',      75000, 9, '2025-01-12'),
(2, 'RAKESH', 'SALES',   95000, 5, '2024-09-23'),
(3, 'DANIAL', 'IT',      85000, 1, '2025-05-12'),   
(4, 'HARI',   'IT',      72000, 1, '2025-07-19'),
(5, 'TOMMY',  'SALES',   65000, 12, '2024-10-12'),
(6, 'SAINE',  'IT',      45000, 1, '2024-06-10'),   
(7, 'SOM',    'IT',      29500, 1, '2024-11-28'),
(8, 'BARBI',  'IT',      23000, 1, '2024-03-10'),
(9, 'ANDREW', 'HR',      90000, NULL, '2024-01-01'), 
(12, 'JOHN',  'SALES',   88000, 9, '2025-01-10');


select 
  emp_id,
  emp_name,
  department,
  salary,
  manager_id,
  joining_date
from employee 
where joining_date >= ( current_date - interval 180 day ) ;
