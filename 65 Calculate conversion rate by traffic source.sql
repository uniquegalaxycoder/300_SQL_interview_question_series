"""
    Q.Calculate conversion rate by traffic source.
"""
  
CREATE TABLE web_traffic (
    session_id INT PRIMARY KEY,
    user_id INT,
    traffic_source VARCHAR(50), -- e.g., 'Google', 'Facebook', 'Email'
    is_converted BOOLEAN,      -- TRUE if they bought something, FALSE if not
    visit_date DATE
);

INSERT INTO web_traffic (session_id, user_id, traffic_source, is_converted, visit_date) VALUES 
(1, 101, 'Google', TRUE,  '2026-01-01'),
(2, 102, 'Google', FALSE, '2026-01-01'),
(3, 103, 'Google', TRUE,  '2026-01-02'),
(4, 104, 'Google', FALSE, '2026-01-02'),
(5, 105, 'Google', FALSE, '2026-01-03'),
(6, 106, 'Email',  TRUE,  '2026-01-01'),
(7, 107, 'Email',  FALSE, '2026-01-02'),
(8, 108, 'Facebook', FALSE, '2026-01-01'),
(9, 109, 'Facebook', FALSE, '2026-01-02'),
(10, 110, 'Facebook', FALSE, '2026-01-03');

SELECT * FROM web_traffic ;

WITH CTE1 AS (
    SELECT 
      traffic_source,
      COUNT(distinct user_id) AS TOTAL_USERS,
      SUM(CASE WHEN is_converted = 1 THEN 1 ELSE 0 END) AS TOTAL_CONVERTED
    FROM web_traffic
    GROUP BY traffic_source
)

SELECT 
  traffic_source,
  ROUND((TOTAL_CONVERTED / TOTAL_USERS )* 100,2) AS CONVERSION_RATE 
FROM CTE1  ;

"""
  Output =>
  +----------------+-----------------+
  | traffic_source | CONVERSION_RATE |
  +----------------+-----------------+
  | Email          |           50.00 |
  | Google         |           40.00 |
  | Facebook       |            0.00 |
  +----------------+-----------------+
"""


ORDER BY ROUND((TOTAL_CONVERTED / TOTAL_USERS )* 100,2) DESC;
