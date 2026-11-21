CREATE TABLE Olympics (
    ID INT PRIMARY KEY,
    event VARCHAR(20),
    YEAR INT,
    GOLD VARCHAR(100),
    SILVER VARCHAR(100),
    BRONZE VARCHAR(100)
);

INSERT INTO Olympics (ID, event, YEAR, GOLD, SILVER, BRONZE)
VALUES
(1, '100m', 2016, 'Amtthew Mcgarraw', 'donald', 'barbara'),
(2, '200m', 2016, 'Nichole', 'Alvaro Eaton', 'janet Smith'),
(3, '500m', 2016, 'Charles', 'Nichole', 'Susana'),
(4, '100m', 2016, 'Ronald', 'maria', 'paula'),
(5, '200m', 2016, 'Alfred', 'carol', 'Steven'),
(6, '500m', 2016, 'Nichole', 'Alfred', 'Brandon'),
(7, '100m', 2016, 'Charles', 'Dennis', 'Susana'),
(8, '200m', 2016, 'Thomas', 'Dawn', 'catherine'),
(9, '500m', 2016, 'Thomas', 'Dennis', 'paula'),
(10, '100m', 2016, 'Charles', 'Dennis', 'Susana'),
(11, '200m', 2016, 'jessica', 'Donald', 'Stefeney'),
(12, '500m', 2016, 'Thomas', 'Steven', 'Catherine');

-- select * from Olympics ;

-- Q. Write a query to find the no. of gold madels per swimmer, whoes won only gold madels


with cte1 as (
  select id, event, year, gold as names, "Gold winner" as Meddle from Olympics
    union all 
  select  id, event, year, silver as names, "Silver winner" as Meddle from Olympics
    union all
  select id, event, year, bronze as names, "Bronze winner" as Meddle from Olympics
),

cte2 as (
select 
  distinct names,
  sum(case when Meddle = 'Gold winner' then 1 else 0 end ) as gold_win,
  sum(case when Meddle = 'Silver winner' then 1 else 0 end) as silver_win,
  sum(case when meddle = 'Bronze winner' then 1 else 0  end) as bronz_win
from cte1 
group by names)

select  
  names,
  gold_win
from cte2 
where silver_win = 0 and bronz_win = 0;


