"""
    Q.Find customer who have never made a sale
"""

create table customer (
  cust_id bigint primary key ,
  app_signup_date date,
  cust_location varchar(30),
  cust_mobile_no int
);

create table orders (
  order_id bigint primary key,
  order_date date,
  food varchar(50),
  order_amount decimal(10,2),
  cust_id bigint ,
  foreign key (cust_id) references customer(cust_id)
);

INSERT INTO customer (cust_id, app_signup_date, cust_location, cust_mobile_no) VALUES 
(101, '2025-12-01', 'Mumbai', 987654321),
(102, '2025-12-05', 'Delhi', 987654322),
(103, '2025-12-10', 'Bangalore', 987654323),
(104, '2025-12-15', 'Pune', 987654324),
(105, '2025-12-20', 'Hyderabad', 987654325),
(106, '2025-12-21', 'Mumbai', 987654321),
(107, '2025-12-26', 'Hyderabad', 987654322);

INSERT INTO orders (order_id, order_date, food, order_amount, cust_id) VALUES 
(1, '2025-12-02', 'Paneer Tikka', 350.00, 101),
(2, '2025-12-05', 'Butter Chicken', 450.00, 101),
(4, '2025-12-25', 'Naan Basket', 150.00, 101),
(5, '2025-12-06', 'Margherita Pizza', 499.00, 102),
(6, '2025-12-08', 'Garlic Bread', 199.00, 102),
(7, '2025-12-15', 'Pasta Alfredo', 399.00, 102),
(8, '2025-12-22', 'Coke 1L', 90.00, 102),
(9, '2025-12-11', 'Chicken Biryani', 320.00, 103),
(10, '2025-12-14', 'Raita', 60.00, 103),
(11, '2025-12-18', 'Chicken Biryani', 320.00, 103),
(13, '2025-12-16', 'Veg Burger', 180.00, 104),
(14, '2025-12-19', 'French Fries', 120.00, 104),
(15, '2025-12-23', 'Veg Burger', 180.00, 104),
(16, '2025-12-28', 'Chocolate Shake', 220.00, 104),
(17, '2025-12-21', 'Masala Dosa', 150.00, 105),
(18, '2025-12-24', 'Idli Sambar', 100.00, 105),
(19, '2025-12-27', 'Filter Coffee', 60.00, 105),
(20, '2025-12-30', 'Masala Dosa', 150.00, 105);



select * from customer ;
select * from orders ;

with cte1 as (
  select 
    a.cust_id,
    a.app_signup_date,
    a.cust_location,
    a.cust_mobile_no,
    count(b.order_id) as total_orders
  from 
    customer as a 
  left join 
    orders as b 
  on a.cust_id = b.cust_id
  group by 
    a.cust_id,
    a.app_signup_date,
    a.cust_location,
    a.cust_mobile_no
  having count(b.order_id) = 0 
)

select * from cte1


"""
  Output => 

    +---------+-----------------+---------------+----------------+--------------+
    | cust_id | app_signup_date | cust_location | cust_mobile_no | total_orders |
    +---------+-----------------+---------------+----------------+--------------+
    |     106 | 2025-12-21      | Mumbai        |      987654321 |            0 |
    |     107 | 2025-12-26      | Hyderabad     |      987654322 |            0 |
    +---------+-----------------+---------------+----------------+--------------+

  """













































