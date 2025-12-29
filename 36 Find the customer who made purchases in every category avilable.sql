-- Find the customer who made purchases in every category avilable

-- 1. Categories Table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- 2. Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- 3. Sales Items Table
CREATE TABLE sales_items (
    item_id INT PRIMARY KEY, -- Must be unique for every row
    sales_id BIGINT,
    product_id INT,
    user_id BIGINT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 4. Inserts for Categories
INSERT INTO categories (category_id, category_name) VALUES 
(1, 'Electronics'),
(2, 'Software'),
(3, 'Consulting');

-- 5. Inserts for Products
INSERT INTO products (product_id, product_name, category_id) VALUES 
(10, 'Laptop', 1), 
(11, 'Phone', 1), 
(20, 'SaaS Sub', 2),
(21, 'Antivirus', 2),
(30, 'Strategy HR', 3),
(31, 'Tech Support', 3);

-- 6. Corrected Inserts for Sales_items
-- Format: (item_id, sales_id, product_id, user_id)
INSERT INTO sales_items (item_id, sales_id, product_id, user_id) VALUES
(1, 1, 10, 3333),  -- item_id 1
(2, 1, 20, 2222),  -- item_id 2
(3, 1, 30, 4444),  -- item_id 3
(4, 2, 10, 2222),  -- item_id 4
(5, 2, 11, 3333),  -- item_id 5
(6, 2, 20, 4444),  -- item_id 6
(7, 4, 30, 2222),  -- item_id 7
(8, 5, 31, 1111),  -- item_id 8
(9, 3, 10, 3333),  -- item_id 9
(10, 7, 21, 7777), -- item_id 10
(11, 3, 11, 4444), -- item_id 11
(12, 4, 10, 4444); -- item_id 12


with cte1 as (
  select 
    a.user_id,
    a.sales_id,
    a.item_id,
    a.product_id,
    b.product_name,
    b.category_id,
    c.category_name
  from 
    sales_items as a 
  left join products as b 
  on 
    a.product_id = b.product_id
  left join 
    categories as c 
  on 
    b.category_id = c.category_id
)

select 
  user_id,
  count(distinct category_id) as total_category
from  cte1
group by user_id
having total_category = ( select count(*) from categories) ;






