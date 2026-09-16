-- find those customers who never ordered

Create table Customers (
  id int,
  name varchar(255)
  ) ;

Create table Orders (
  id int,
  customerId int
) ;


insert into Customers (id, name) values 
  ('1', 'Joe'),
  ('2', 'Henry')
  ('3', 'Sam')
  ('4', 'Max') ;

insert into Orders (id, customerId) values
  ('1', '3')
  ('2', '1') ;


-- Solution 1 
with cte1 as (
  select 
      a.name as Customers,
      b.customerId
  from customers as a 
    left join 
      orders as b 
  on a.id = b.customerid 
  where b.id is null 
)

select Customers from cte1 ;


-- solution 2 
select name as customers from customers 
where id not in (select customerid from orders) ;


-- solution 3 
select 
  c.name as customers
from customers as c 
where not exists ( select 1 from orders as o where o.customerid = c.id ); 

-- output 
"""
| Customers |
| --------- |
| Henry     |
| Max       |
  
  """


