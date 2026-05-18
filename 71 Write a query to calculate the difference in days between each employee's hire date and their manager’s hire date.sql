"""
  Q71. Write a query to calculate the difference in days between each employee's hire date and their manager’s hire date.
"""
  
create table employee (
  id varchar(10),
  name varchar(50),
  joining_date date,
  manager_id varchar(10)
)

INSERT INTO employee (id, name, joining_date, manager_id) VALUES
('E001', 'Alice Smith', '2022-01-15', NULL),
('E002', 'Bob Jones', '2022-03-20', 'E001'),
('E003', 'Charlie Brown', '2022-06-10', 'E001'),
('E004', 'Diana Prince', '2023-01-05', 'E002'),
('E005', 'Evan Wright', '2023-04-12', 'E002'),
('E006', 'Fiona Gallagher', '2023-08-19', 'E003'),
('E007', 'George Clark', '2024-02-11', 'E003'),
('E008', 'Hannah Abbott', '2024-05-25', 'E004'),
('E009', 'Ian Malcolm', '2024-09-01', 'E004'),
('E010', 'Julia Roberts', '2025-01-10', 'E005');

-- select * from employee ;

with cte1 as (
  select 
    employe.id,
    employe.name,
    employe.joining_date,
    employe.manager_id,
    manager.joining_date as manager_joining_date
  from employee as employe
  inner join 
    employee as manager 
  on employe.manager_id = manager.id
)

select 
  name as employee_name,
  joining_date as emp_joining_date,
  manager_id,
  manager_joining_date,
  datediff(day, manager_joining_date, joining_date) as joining_day_diff
from cte1 ;

"""
Output =>
  
  employee_name                                      emp_joining_date manager_id manager_joining_date joining_day_diff
-------------------------------------------------- ---------------- ---------- -------------------- ----------------
Bob Jones                                                2022-03-20 E001                 2022-01-15               64
Charlie Brown                                            2022-06-10 E001                 2022-01-15              146
Diana Prince                                             2023-01-05 E002                 2022-03-20              291
Evan Wright                                              2023-04-12 E002                 2022-03-20              388
Fiona Gallagher                                          2023-08-19 E003                 2022-06-10              435
George Clark                                             2024-02-11 E003                 2022-06-10              611
Hannah Abbott                                            2024-05-25 E004                 2023-01-05              506
Ian Malcolm                                              2024-09-01 E004                 2023-01-05              605
Julia Roberts                                            2025-01-10 E005                 2023-04-12              639

  
  """

