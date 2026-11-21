"""
  Q. Find the TAT to resolve tickets on Business days only. Excluding weekends and holidays 
"""

CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY,
    ticket_name VARCHAR(100),
    create_date DATE,
    resolved_date DATE
);

INSERT INTO Tickets
(ticket_id, ticket_name, create_date, resolved_date)
VALUES
(1, 'Login Issue', '2026-01-05', '2026-01-09'),
(2, 'Payment Failure', '2026-01-06', '2026-01-12'),
(3, 'Dashboard Error', '2026-01-07', '2026-01-15'),
(4, 'Account Access', '2026-01-08', '2026-01-13'),
(5, 'Refund Request', '2026-01-09', '2026-01-16'),
(6, 'Server Issue', '2026-01-10', '2026-01-19'),
(7, 'API Failure', '2026-01-12', '2026-01-20'),
(8, 'Data Mismatch', '2026-01-13', '2026-01-22'),
(9, 'Report Issue', '2026-01-14', '2026-01-23'),
(10, 'Email Notification', '2026-01-15', '2026-01-26'),
(11, 'App Crash', '2026-01-19', '2026-01-27'),
(12, 'Slow Performance', '2026-01-20', '2026-01-30'),
(13, 'Database Issue', '2026-01-22', '2026-02-02'),
(14, 'OTP Failure', '2026-01-23', '2026-02-03'),
(15, 'Order Cancellation', '2026-01-26', '2026-02-05');

CREATE TABLE Public_Holidays (
    holiday_date DATE PRIMARY KEY,
    holiday_name VARCHAR(100)
);

INSERT INTO Public_Holidays
(holiday_date, holiday_name)
VALUES
('2026-01-14', 'Makar Sankranti'),
('2026-01-26', 'Republic Day'),
('2026-02-01', 'Public Holiday'),
('2026-02-19', 'Shivaji Jayanti');

-- select * from Tickets ;
-- select * from Public_Holidays ;

with cte1 as (
select 
    distinct ticket_name,
    create_date,
    resolved_date,
    DATEDIFF(day, create_date, resolved_date) as resloved_tat,
    DATEDIFF(day, create_date, resolved_date) - 2 * DATEDIFF(week, create_date, resolved_date) as resolved_business_tat
    ,(case when holiday_date is null and 
                datename(weekday, holiday_date) not in ('Saturday', 'Sunday')
            then 0 else 1 end ) as holiday
    from Tickets left join 
Public_Holidays on holiday_date between create_date and resolved_date
    )

select 
  ticket_name,
  (resolved_business_tat - holiday) as resolved_tat_business_days
from cte1 ;

