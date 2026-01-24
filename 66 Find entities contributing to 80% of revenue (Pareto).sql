"""
    Q.Find entities contributing to 80% of revenue (Pareto).

  This is a classic Pareto Analysis (also known as the 80/20 rule). In a business context, this helps identify the 'Vital Few' 
  the small number of customers or products that drive the majority of your income.

  To solve this in SQL, we need Window Functions to calculate a Running Total and then convert that into a Cumulative Percentage.
  
"""

CREATE TABLE entity_revenue (
    entity_id INT PRIMARY KEY,
    entity_name VARCHAR(100),
    total_revenue DECIMAL(15, 2)
);

INSERT INTO entity_revenue (entity_id, entity_name, total_revenue) VALUES 
(1, 'TechCorp Solutions', 50000.00),
(2, 'Global Retail Inc', 30000.00),
(3, 'Small Shop A', 5000.00),
(4, 'Small Shop B', 4500.00),
(5, 'Local Bistro', 3000.00),
(6, 'City Gym', 2500.00),
(7, 'Corner Bakery', 2000.00),
(8, 'Hair Salon', 1500.00),
(9, 'Nail Spa', 1000.00),
(10, 'Gift Shop', 500.00);

SELECT * FROM entity_revenue ;

WITH CTE1 AS (
    SELECT 
      entity_name,
      total_revenue,
      SUM(total_revenue) OVER(ORDER BY total_revenue DESC) AS RUNNING_REVENUE,
      SUM(total_revenue) OVER() AS OVERALL_REVENUE 
    FROM entity_revenue
)

SELECT 
  * 
FROM (
        SELECT 
          *,
          ROUND((RUNNING_REVENUE*100 / OVERALL_REVENUE),2) AS CONTRIBUTION
        FROM CTE1
    ) AS TABLE_1
WHERE CONTRIBUTION <= 80.00 ;

"""
  Output =>
  +--------------------+---------------+-----------------+-----------------+--------------+
  | entity_name        | total_revenue | RUNNING_REVENUE | OVERALL_REVENUE | CONTRIBUTION |
  +--------------------+---------------+-----------------+-----------------+--------------+
  | TechCorp Solutions |      50000.00 |        50000.00 |       100000.00 |        50.00 |
  | Global Retail Inc  |      30000.00 |        80000.00 |       100000.00 |        80.00 |
  +--------------------+---------------+-----------------+-----------------+--------------+  

  *) Why this matters for the Business :
      - Resource Allocation: You should assign your best Account Managers to the entities in the top 80%.

      - Risk Management: If your top 2 entities contribute 80% of revenue and one leaves, your business is in trouble. This is called 
        'Revenue Concentration Risk.'

      - Marketing: Use the profiles of these top entities to find 'Lookalike' customers.
  

  """



