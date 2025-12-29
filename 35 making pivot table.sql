"""
Q. Find the project wise total department wise employee count
Requirement: 
A service-based company has started hiring for multiple roles across ongoing projects. 
They need an employee-level pivot view to analyze the current workforce count mapped to each project, 
for better project planning and resource allocation.  
"""

create table employee (
  emp_id bigint,
  emp_designation varchar(30),
  project varchar(100),
  joining_date date 
);

insert into employee ( emp_id, emp_designation, project, joining_date)
values
(1, 'Devloper', "Developed India Passport Seva platform", '2023-01-11' ),
(2, 'Tester', "Developed India Passport Seva platform", '2023-01-12' ),
(3, 'Analyst', "Risk advisory for Indian energy sector", '2023-04-21' ),
(4, 'Tester', "AI-led finance transformation for global banks", '2023-05-13' ),
(5, 'Devloper', "Developed India Passport Seva platform", '2023-07-01' ),
(6, 'Analyst', "Risk advisory for Indian energy sector", '2023-01-14' ),
(7, 'Tester', "AI-led finance transformation for global banks", '2023-04-10' ),
(8, 'Analyst', "Developed India Passport Seva platform", '2023-04-11' ),
(9, 'Devloper', "AI-led finance transformation for global banks", '2023-09-21' ),
(10, 'Tester', "Risk advisory for Indian energy sector", '2023-11-01' ),
(12, 'Devloper', "Risk advisory for Indian energy sector", '2023-11-23' ),
(11, 'Tester', "AI-led finance transformation for global banks", '2023-01-22' ),
(13, 'Devloper', "Risk advisory for Indian energy sector", '2023-06-01' ),
(14, 'Tester', "Developed India Passport Seva platform", '2023-07-11' ),
(15, 'Analyst', "Developed India Passport Seva platform", '2023-08-13' ),
(16, 'Devloper', "Developed India Passport Seva platform", '2023-09-21' ),
(17, 'Analyst', "Risk advisory for Indian energy sector", '2023-03-12' ),
(18, 'Devloper', "Developed India Passport Seva platform", '2023-04-11' );

select * from employee ;

-- Q. find the project wise total developers, analyst, tester

with cte1 as (
  select 
    project,
    sum( case when emp_designation = 'Devloper' then 1 else 0 end ) as total_devloper,
    sum( case when emp_designation = 'tester' then 1 else 0 end ) as total_testers,
    sum( case when emp_designation = 'Analyst' then 1 else 0 end ) as total_analyst
  from employee
  group by project  
)

select * from cte1 ;

