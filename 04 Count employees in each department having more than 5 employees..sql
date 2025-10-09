"""
Count employees in each department having more than 5 employees.
"""

CREATE TABLE EMPLOYEE (
    EMP_ID INT,
    EMP_NAME VARCHAR(100),
    DEPARTMENT VARCHAR(100),
    SALARY INT,
    MANAGER_ID INT
    );
    

INSERT INTO EMPLOYEE VALUES 
(1, 'RASHI',  'IT',      75000, 9),
(2, 'RAKESH', 'SALES',   95000, 5),
(3, 'DANIAL', 'IT',      85000, 1),   -- earns more than manager RASHI
(4, 'HARI',   'IT',      72000, 1),
(5, 'TOMMY',  'SALES',   65000, 12),
(6, 'SAINE',  'IT',      45000, 1),   -- earns more than manager RASHI
(7, 'SOM',    'IT',      29500, 1),
(8, 'BARBI',  'IT',      23000, 1),
(9, 'ANDREW', 'HR',      90000, NULL), -- top manager (no manager)
(12, 'JOHN',  'SALES',   88000, 9);


select 
  DEPARTMENT,
  count(EMP_ID) as total_emp
from 
  EMPLOYEE
group by 
  DEPARTMENT
having 
  count(EMP_ID) > 5 ;


