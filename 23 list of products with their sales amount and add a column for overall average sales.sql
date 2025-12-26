-- Display a list of products with their sales amount and add a column for overall average sales.

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO product (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 55000.00),
(2, 'Mouse', 'Electronics', 800.00),
(3, 'Keyboard', 'Electronics', 1500.00),
(4, 'Monitor', 'Electronics', 12000.00),
(5, 'Chair', 'Furniture', 3500.00),
(6, 'Table', 'Furniture', 7000.00),
(7, 'Mobile', 'Electronics', 20000.00),
(8, 'Headphones', 'Accessories', 1800.00),
(9, 'Charger', 'Accessories', 600.00),
(10, 'Pen Drive', 'Storage', 500.00),
(11, 'SSD 1TB', 'Storage', 8500.00),
(12, 'Webcam', 'Accessories', 2500.00),
(13, 'Printer', 'Electronics', 9500.00),
(14, 'Cupboard', 'Furniture', 15000.00),
(15, 'Router', 'Electronics', 2200.00);

INSERT INTO sales (sale_id, product_id, sale_date, quantity, total_amount) VALUES
(101, 1, '2025-11-01', 2, 110000.00),
(102, 2, '2025-11-02', 5, 4000.00),
(103, 3, '2025-11-03', 3, 4500.00),
(104, 4, '2025-11-04', 1, 12000.00),
(105, 5, '2025-11-05', 4, 14000.00),
(106, 6, '2025-11-06', 2, 14000.00),
(107, 7, '2025-11-07', 6, 120000.00),
(108, 8, '2025-11-08', 8, 14400.00),
(109, 9, '2025-11-09', 10, 6000.00),
(110, 10, '2025-11-10', 7, 3500.00),
(111, 11, '2025-11-11', 1, 8500.00),
(112, 12, '2025-11-12', 3, 7500.00),
(113, 13, '2025-11-13', 2, 19000.00),
(114, 14, '2025-11-14', 1, 15000.00),
(115, 15, '2025-11-15', 5, 11000.00);

with cte1 as (
select
  product_name,
  sum(quantity) as total_sold_product,
  sum(total_amount) as total_sales_amt
from product left join sales on product.product_id = sales.product_id
group by product_name
)

select 
  product_name,
  total_sold_product,
  total_sales_amt,
  round(avg(total_sales_amt)over()) as overall_avg_sales
from cte1 ;

