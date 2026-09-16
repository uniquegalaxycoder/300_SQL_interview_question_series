"""
8. Running total of salaries by department.
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
INSERT INTO EMPLOYEE VALUES (9,'niek',1234,28000);
INSERT INTO EMPLOYEE VALUES (10,'BOB',1234,31000);
INSERT INTO EMPLOYEE VALUES (11,'Rutu',1235,30000);
INSERT INTO EMPLOYEE VALUES (11,'Max',1231,31000);
INSERT INTO EMPLOYEE VALUES (2,'RAKESH',1235,34000) ;
INSERT INTO EMPLOYEE VALUES (3,'DANIAL',1236,20000) ;
INSERT INTO EMPLOYEE VALUES (12,'Rax',1236,54000) ;
INSERT INTO EMPLOYEE VALUES (13,'Lokesh',1236,64000) ;
INSERT INTO EMPLOYEE VALUES (4,'HARI',1234,50000) ;
INSERT INTO EMPLOYEE VALUES (5,'TOMMY',1231,45000) ;
INSERT INTO EMPLOYEE VALUES (6,'SAINE',1236,67000) ;
INSERT INTO EMPLOYEE VALUES (7,'SOM',1235,98000) ;
INSERT INTO EMPLOYEE VALUES (8,'BARBI',1235,78000);
INSERT INTO EMPLOYEE VALUES (14,'Tom',1235,88000) ;
insert into department values('IT',1234);
insert into department values('Sales',1235);
insert into department values('Customer Support',1236);
insert into department values('HR',1231);
insert into department values('Founder Team',1229);



select 
dept_name,
sum(SALARY)over(partition by DEPARTMENT_id order by SALARY desc) as salary_running
from EMPLOYEE as EMP left join department as dept
on emp.DEPARTMENT_id = dept.dept_id ;



