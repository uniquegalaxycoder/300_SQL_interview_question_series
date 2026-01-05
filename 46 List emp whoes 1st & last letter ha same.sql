"""
    Q.List employees whose names start and end with the same letter.
"""


create table employee (
  employee_ID bigint,
  emplyee_name varchar(30)
);

insert into employee ( employee_ID, emplyee_name)
values
(111, 'Anna'),    
(112, 'Naman'),   
(113, 'Bob'), 
(114, 'David'),
(115, 'Dyani'),
(116, 'Rexa');

select * from employee ;

select * 
from employee 
where right(emplyee_name, 1) = left(emplyee_name, 1)


