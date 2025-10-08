"""
  Q. Find the Second highest salary from the Employee Table
  """

CREATE TABLE tb (
    EMP_ID INT,
    EMP_NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    SALARY INT
);

INSERT INTO tb VALUES (1,'RASHI','IT',25000);
INSERT INTO tb VALUES (2,'RAKESH','Analytics',90000);
INSERT INTO tb VALUES (3,'DANIAL','IT',30000);
INSERT INTO tb VALUES (4,'HARI','Sales',56000);
INSERT INTO tb VALUES (5,'TOMMY','Sales',60000);
INSERT INTO tb VALUES (6,'SAINE','Tech',89000);
INSERT INTO tb VALUES (7,'SOM','Tech',45000);
INSERT INTO tb VALUES (8,'BARBI','Tech',79000);


with cte1 as (
select 
  emp_id,
  emp_name,
  DEPARTMENT,
  salary,
  dense_rank()over(order by salary desc) as salary_rank
from tb )

  select 
    salary
  from cte1 
  where salary_rank = 2 ;

