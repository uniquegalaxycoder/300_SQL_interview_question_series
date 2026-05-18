"""
  Q73. Identify employees who had overlapping project assignments.
"""

  
CREATE TABLE project_assignment (
  emp_id VARCHAR(10),
  project_id VARCHAR(10),
  start_date DATE,
  end_date DATE
);

INSERT INTO project_assignment (emp_id, project_id, start_date, end_date) VALUES
('E002', 'P01', '2024-01-01', '2024-06-30'), 
('E003', 'P01', '2024-03-01', '2024-08-31'), 
('E004', 'P01', '2024-09-01', '2024-12-31'), 
('E002', 'P02', '2024-02-01', '2024-05-31'), 
('E005', 'P02', '2024-04-15', '2024-07-15'), 
('E006', 'P03', '2024-06-01', '2024-12-31'), 
('E007', 'P03', '2024-01-01', '2024-07-01'), 
('E008', 'P04', '2024-01-01', '2024-03-31'), 
('E009', 'P04', '2024-04-01', '2024-06-30'); 

-- select * from project_assignment ;

with cte1 as (
  select 
    a.emp_id as emp_id_1,
    a.project_id as project_id_1,
    a.start_date as start_date_1,
    a.end_date as end_date_1,
    b.emp_id as emp_id_2,
    b.project_id as project_id_2,
    b.start_date as start_date_2,
    b.end_date as end_date_2
  from project_assignment as a 
  left join project_assignment as b 
  on 
    a.project_id = b.project_id 
    and a.emp_id < b.emp_id
  where 
    a.end_date >= b.start_date
    and a.start_date <= b.end_date
)

select * from cte1 ;

"""
  Output =>

  emp_id_1   project_id_1 start_date_1     end_date_1       emp_id_2   project_id_2 start_date_2     end_date_2      
---------- ------------ ---------------- ---------------- ---------- ------------ ---------------- ----------------
E002       P01                2024-01-01       2024-06-30 E003       P01                2024-03-01       2024-08-31
E002       P02                2024-02-01       2024-05-31 E005       P02                2024-04-15       2024-07-15
E006       P03                2024-06-01       2024-12-31 E007       P03                2024-01-01       2024-07-01
  
  """
