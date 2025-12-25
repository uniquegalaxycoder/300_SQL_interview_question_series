create table employee (
  emp_id bigint not null,
  emp_name varchar(40) not null,
  dept varchar(20),
  gender varchar(5),
  joining_date date
);

INSERT INTO employee (emp_id, emp_name, dept, gender, joining_date)
VALUES
(1001, 'Omkar', 'Analytics', 'M', '2024-01-15'),
(1002, 'Amit Sharma', 'Finance', 'M', '2023-06-10'),
(1003, 'Priya Verma', 'HR', 'F', '2024-03-22'),
(1004, 'Rahul Iyer', 'Tech', 'M', '2022-11-05'),
(1005, 'Sneha Patil', 'Marketing', 'F', '2023-09-18'),
(1006, 'Vikram Singh', 'Operations', 'M', '2021-07-30'),
(1007, 'Neha Kapoor', 'Finance', 'F', '2024-05-14'),
(1008, 'Arjun Mehta', 'Tech', 'M', '2020-02-27'),
(1009, 'Isha Rao', 'HR', 'F', '2023-12-01'),
(1010, 'Kabir Khan', 'Tech', 'M', '2024-07-19'),
(1011, 'Ananya Deshmukh', 'Analytics', 'F', '2022-08-24'),
(1012, 'Rohan Naik', 'Marketing', 'M', '2023-04-12'),
(1013, 'Simran Kaur', 'HR', 'F', '2021-10-03'),
(1014, 'Manoj Kulkarni', 'Operations', 'M', '2019-05-21'),
(1015, 'Farah Ali', 'Marketing', 'F', '2024-02-09'),
(1016, 'Dev Joshi', 'Tech', 'M', '2022-12-28'),
(1017, 'Pooja Nair', 'Analytics', 'F', '2023-07-17'),
(1018, 'Sai Kumar', 'Operations', 'M', '2024-09-04'),
(1019, 'Alia Fernandez', 'Finance', 'F', '2020-10-13'),
(1020, 'Yash Chavan', 'Analytics', 'M', '2024-11-20');

-- Q. Find the total female & male employee count from each department

select 
  dept,
  count(case when gender = 'M' then emp_id end) as total_male,
  count(case when gender = 'F' then emp_id end) as total_female
from employee
group by dept;
