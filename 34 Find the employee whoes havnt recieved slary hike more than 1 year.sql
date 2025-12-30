CREATE TABLE EMPLOYEE (
  empId int,
  name varchar(15),
  dept_id varchar(10)
);

create table salary (
  emp_id bigint,
  salary float(10,2),
  salary_increased_date date
);

INSERT INTO EMPLOYEE (empId, name, dept_id) VALUES 
(101, 'Amit Sharma', 'IT_01'),
(102, 'Sana Khan', 'HR_02'),
(103, 'John Doe', 'IT_01'),
(104, 'Riya Gupta', 'SALES_03'),
(105, 'Vikram Singh', 'IT_01'),
(106, 'Ananya Iyer', 'HR_02'),
(107, 'Liam Wilson', 'SALES_03'),
(108, 'Meera Reddy', 'IT_01'),
(109, 'Rahul Verma', 'FIN_04'),
(110, 'Sara Taylor', 'SALES_03');


INSERT INTO salary (emp_id, salary, salary_increased_date) VALUES 
(101, 50000.00, '2023-01-01'), 
(101, 56000.00, '2024-01-01'), 
(101, 61000.00, '2025-01-01'), 

(102, 45000.00, '2023-02-15'),
(102, 50000.00, '2024-02-13'),
(102, 50000.00, '2025-02-10'),

(103, 68000.00, '2023-02-10'),
(103, 68000.00, '2024-02-10'),
(103, 69000.00, '2025-02-10'),

(104, 40000.00, '2023-06-01'),
(104, 40000.00, '2024-06-01'),
(104, 45000.00, '2025-06-01'),

(105, 52000.00, '2023-01-20'),
(105, 53000.00, '2024-01-20'),
(105, 53000.00, '2025-01-20'),

(106, 48000.00, '2023-04-12'),
(106, 48000.00, '2024-04-12'),
(106, 51000.00, '2025-04-12'),

(107, 38000.00, '2023-07-01'),
(107, 40000.00, '2024-07-01'),
(107, 48000.00, '2025-07-01'),

(108, 59000.00, '2023-01-05'),
(108, 61000.00, '2024-01-05'),
(108, 63000.00, '2025-01-05'),

(109, 70000.00, '2023-05-20'),
(109, 70000.00, '2024-05-20'),
(109, 71000.00, '2025-05-20'),

(110, 42000.00, '2023-08-15'),
(110, 44000.00, '2024-08-15'),
(110, 50000.00, '2025-08-15');


select * from EMPLOYEE ;
select * from salary ;


WITH SalaryHistory AS (
    SELECT 
        e.empId, 
        e.name, 
        s.salary,
        EXTRACT(YEAR FROM s.salary_increased_date) AS s_year,
        LAG(s.salary) OVER (PARTITION BY e.empId ORDER BY s.salary_increased_date) AS prev_salary
    FROM EMPLOYEE e
    JOIN salary s ON e.empId = s.emp_id
)
SELECT DISTINCT 
    empId, 
    name
FROM SalaryHistory
WHERE salary = prev_salary;
