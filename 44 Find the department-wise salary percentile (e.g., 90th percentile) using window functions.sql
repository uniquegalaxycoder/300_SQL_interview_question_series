"""
    Q.Find the department-wise salary percentile (e.g., 90th percentile) using window functions.
"""
  
create table employee (
  emp_id bigint,
  emp_name varchar(30),
  department varchar(30),
  salary decimal(10,2)
);

INSERT INTO employee (emp_id, emp_name, department, salary) VALUES 
(1, 'Arjun Mehta', 'IT', 85000.00),
(2, 'Anjali Sharma', 'IT', 92000.00),
(3, 'Abhishek Singh', 'Sales', 55000.00),
(4, 'Aditi Rao', 'Marketing', 62000.00),
(5, 'Akash Verma', 'IT', 78000.00),
(6, 'Amit Patel', 'Sales', 58000.00),
(7, 'Aishwarya Iyer', 'HR', 60000.00),
(8, 'Aniket Deshmukh', 'Marketing', 65000.00),
(9, 'Bhavna Joshi', 'IT', 95000.00),
(10, 'Chirag Reddy', 'Sales', 52000.00),
(11, 'Deepak Gupta', 'HR', 59000.00),
(12, 'Esha Gupta', 'Marketing', 68000.00),
(13, 'Farhan Khan', 'IT', 110000.00),
(14, 'Gita Kumari', 'Sales', 54000.00),
(15, 'Harish Bakshi', 'IT', 82000.00),
(16, 'Ishani Shah', 'HR', 61000.00),
(17, 'Jatin Wardhan', 'Marketing', 72000.00),
(18, 'Kavita Pillai', 'Sales', 57000.00),
(19, 'Lokesh Yadav', 'IT', 88000.00),
(20, 'Megha Bansal', 'Marketing', 75000.00);

select * from employee ;


with cte1 as (
  select 
    department,
    salary,
    round(percent_rank() over(partition by department order by salary),2) as prcents
  from employee
)

select 
  department,
  min(salary) as saalry
from 
    cte1
where
  prcents >= 0.9
group by 
  department ;

"""
  Output => 
    +------------+-----------+
    | department | saalry    |
    +------------+-----------+
    | HR         |  61000.00 |
    | IT         | 110000.00 |
    | Marketing  |  75000.00 |
    | Sales      |  58000.00 |
    +------------+-----------+
  
  """



