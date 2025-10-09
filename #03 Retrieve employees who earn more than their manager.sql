"""
3. Retrieve employees who earn more than their
manager.
"""
-- (MySQL) table & data insertion

CREATE TABLE EMPLOYEE (
    EMP_ID INT,
    EMP_NAME VARCHAR(100),
    DEPARTMENT VARCHAR(100),
    SALARY INT ,
    MANAGER_ID INT
    );
    

INSERT INTO EMPLOYEE VALUES 
(1, 'RASHI',  'IT',      75000, 9),
(2, 'RAKESH', 'SALES',   95000, 5),
(3, 'DANIAL', 'IT',      85000, 1),   
(4, 'HARI',   'IT',      72000, 1),
(5, 'TOMMY',  'SALES',   65000, 12),
(6, 'SAINE',  'IT',      45000, 1),   
(7, 'SOM',    'IT',      29500, 1),
(8, 'BARBI',  'IT',      23000, 1),
(9, 'ANDREW', 'HR',      90000, NULL),
(12, 'JOHN',  'SALES',   88000, 9);


SELECT 
  E.*,
  F.SALARY
FROM 
      EMPLOYEE AS E 
INNER JOIN 
      EMPLOYEE AS F 
ON 
  E.MANAGER_ID = F.EMP_ID 
and E.SALARY > F.SALARY
;

-- in above code i.e line number 33 & 35 we joining sames table ( self join) based on employee as E and employee as f E.Manager_id = F.emp_id 
-- & same time we has applying condtion on join like return those emplyee whoes earn more than their managers.



