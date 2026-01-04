"""
    Q.write a query to perform a self join to find the pairs of employees in the same department
"""

create table employee (
  emp_id bigint,
  emp_name varchar(20),
  depart_id bigint,
  joining_date date
);

insert into employee ( emp_id, emp_name, depart_id, joining_date)
values 
(101, 'Omkar', 1, '2025-08-01'),
(102, 'Amit', 2, '2025-08-02'),
(103, 'Priya', 1, '2025-08-03'),
(104, 'Rahul', 3, '2025-08-04'),
(105, 'Sneha', 2, '2025-08-05'),
(106, 'Vikram', 1, '2025-08-06'),
(107, 'Neha', 4, '2025-08-07'),
(108, 'Arjun', 3, '2025-08-08'),
(109, 'Isha', 2, '2025-08-09'),
(110, 'Kabir', 1, '2025-08-10'),
(111, 'Rohan', 3, '2025-08-11'),
(112, 'Meera', 2, '2025-08-12');


select 
  e1.emp_id,
  e1.emp_name,
  e1.depart_id,
  e2.emp_id,
  e2.emp_name,
  e2.depart_id
from 
    employee as e1 
inner join 
    employee as e2 
on 
    e1.depart_id = e2.depart_id
and 
    e1.emp_id < e2.emp_id
order by
  e1.emp_id;


