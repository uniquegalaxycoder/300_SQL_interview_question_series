"""
     Q.Find orders that contain more than one product

 BUSINESS CASE :
   To find orders containing more than one product, we focus on grouping by the order
   identifier and using a filter on the aggregated results. This is a common task in retail analytics
   to distinguish 'bulk' or 'complex' orders from simple single-item purchases.
"""

CREATE TABLE order_items (
    id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(50),
    quantity INT
);

INSERT INTO order_items (id, order_id, product_name, quantity) VALUES 
(1, 1, 'Laptop', 1),        
(2, 2, 'Mouse', 1),         
(3, 2, 'Keyboard', 1),      
(4, 3, 'Monitor', 1),       
(5, 3, 'HDMI Cable', 2),    
(6, 4, 'USB Drive', 5);   

SELECT * FROM order_items ;

WITH CTE1 AS (
    SELECT 
      order_id,
      COUNT(DISTINCT product_name) AS TOTAL_PRODUCTS 
    FROM order_items 
    GROUP BY order_id
    HAVING COUNT(DISTINCT product_name) > 1 
)

SELECT * FROM CTE1 ;

"""
    Output =>
    +----------+----------------+
    | order_id | TOTAL_PRODUCTS |
    +----------+----------------+
    |        2 |              2 |
    |        3 |              2 |
    +----------+----------------+
  
  """
