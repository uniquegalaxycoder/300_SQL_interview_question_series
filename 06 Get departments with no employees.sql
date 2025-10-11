"""
6. Get departments with no employees.
"""

CREATE TABLE EMPLOYEE (
    EMP_ID INT,
    EMP_NAME VARCHAR(100),
    DEPARTMENT_id INT,
    SALARY INT );
    
create table department (
  dept_name VARCHAR(30),
  dept_id INT
);

INSERT INTO EMPLOYEE VALUES (1,'RASHI',1234,25000) ;
INSERT INTO EMPLOYEE VALUES (2,'RAKESH',1235,25000) ;
INSERT INTO EMPLOYEE VALUES (3,'DANIAL',1236,25000) ;
INSERT INTO EMPLOYEE VALUES (4,'HARI',1234,25000) ;
INSERT INTO EMPLOYEE VALUES (5,'TOMMY',1231,25000) ;
INSERT INTO EMPLOYEE VALUES (6,'SAINE',null,25000) ;
INSERT INTO EMPLOYEE VALUES (7,'SOM',1235,25000) ;
INSERT INTO EMPLOYEE VALUES (8,'BARBI',1235,25000) ;
insert into department values('IT',1234);
insert into department values('Sales',1235);
insert into department values('Customer Support',1236);
insert into department values('HR',1231);
insert into department values('Founder Team',1229);


select 
  dept_id,
  dept_name
from (
select 
  dept_id,
  dept_name,
  count(coalesce(emp_id)) as total_emp
from department as dept left join EMPLOYEE as EMP
on dept.dept_id = emp.DEPARTMENT_id
group by dept_id, dept_name
) as sbq
where sbq.total_emp < 1
;

