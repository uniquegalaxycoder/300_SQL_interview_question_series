"""
    Q.Identify users who completed all required actions.
"""

CREATE TABLE required_actions (
    action_id INT PRIMARY KEY,
    action_name VARCHAR(50)
);


CREATE TABLE user_completions (
    user_id INT,
    action_id INT,
    completion_date DATE,
    PRIMARY KEY (user_id, action_id)
);


INSERT INTO required_actions VALUES 
(1, 'Email Verified'),
(2, 'Profile Picture Set'),
(3, 'First Deposit');

INSERT INTO user_completions VALUES 
(101, 1, '2026-01-01'), (101, 2, '2026-01-01'), (101, 3, '2026-01-02'), 
(102, 1, '2026-01-01'), (102, 2, '2026-01-05'),                         
(103, 1, '2026-01-01'), (103, 2, '2026-01-02'), (103, 3, '2026-01-03'), (103, 99, '2026-01-04'); 

SELECT * FROM required_actions ;
SELECT * FROM user_completions ;

WITH CTE1 AS (
  SELECT 
    A.user_id,
    A.action_id AS USER_ACTION,
    A.completion_date,
    B.action_id AS TOTAL_ACTION,
    B.action_name
  FROM 
    user_completions AS A 
  INNER JOIN required_actions AS B 
  on  
    A.action_id = B.action_id
)


SELECT 
  user_ID,
  COUNT(USER_ACTION) AS USER_ACTION 
FROM CTE1
GROUP BY user_ID 
HAVING COUNT(DISTINCT USER_ACTION) = ( SELECT COUNT(distinct action_id) FROM required_actions )
;

"""
  Output =>
  +---------+-------------+
  | user_id | USER_ACTION |
  +---------+-------------+
  |     101 |           3 |
  |     103 |           3 |
  +---------+-------------+
"""












