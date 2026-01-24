"""
    Q.Find overlapping date ranges.
"""

CREATE TABLE room_bookings (
    booking_id INT PRIMARY KEY,
    room_id INT,
    start_date DATE,
    end_date DATE
);

INSERT INTO room_bookings VALUES 
(1, 101, '2026-01-01', '2026-01-10'), 
(2, 101, '2026-01-08', '2026-01-15'), 
(3, 101, '2026-01-03', '2026-01-05'), 
(4, 101, '2026-01-10', '2026-01-12'), 
(5, 101, '2026-01-20', '2026-01-25'); 

SELECT * FROM room_bookings ;

SELECT 
  A.room_id,
  A.start_date AS START_DATE_1 ,
  A.end_date AS END_DATE_1,
  B.start_date AS START_DATE_2,
  B.end_date AS END_DATE_2
FROM 
  room_bookings AS A 
INNER JOIN room_bookings AS B 
ON 
  A.room_id = B.room_id 
AND
  A.START_DATE < B.END_DATE 
AND 
  B.START_DATE < A.END_DATE
AND 
  A.START_DATE < B.START_DATE;

"""
  Output =>
    +---------+--------------+------------+--------------+------------+
    | room_id | START_DATE_1 | END_DATE_1 | START_DATE_2 | END_DATE_2 |
    +---------+--------------+------------+--------------+------------+
    |     101 | 2026-01-01   | 2026-01-10 | 2026-01-08   | 2026-01-15 |
    |     101 | 2026-01-01   | 2026-01-10 | 2026-01-03   | 2026-01-05 |
    |     101 | 2026-01-08   | 2026-01-15 | 2026-01-10   | 2026-01-12 |
    +---------+--------------+------------+--------------+------------+

"""

