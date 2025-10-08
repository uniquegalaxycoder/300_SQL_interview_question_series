"""
 2. Find duplicate records in a table.
"""

create table student_data (
  roll_no int,
  class varchar(10),
  school_id int,
  center varchar(10)
);

insert into student_data values (11,"jems",2, "Barlin");
insert into student_data values (15,"Thomas",6, "Barlin");
insert into student_data values (10,"Sleva",6, "NY");
insert into student_data values (12,"Rax",8, "Barlin");
insert into student_data values (13,"Roni",10, "NY");
insert into student_data values (11,"jems",2, "Barlin");


with cte1 as (
select 
  * ,
  row_number()over(partition by roll_no ) as duplicasy_check
from student_data 
)

select 
  roll_no,
  class,
  school_id,
  center
from cte1
where duplicasy_check > 1
;
