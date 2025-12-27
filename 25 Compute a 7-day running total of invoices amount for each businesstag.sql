-- Q.Compute a 7-day running total of invoices amount for each businesstag.

create table invoices (
  invoiceId bigint,
  invoiceDate timestamp,
  invoiceAmount float(10, 2),
  businessTag varchar(20)
);

INSERT INTO invoices (invoiceId, invoiceDate, invoiceAmount, businessTag) VALUES
(1, '2025-01-01 09:15:23', 1200.50, 'Retail'),
(2, '2025-01-02 10:05:11', 850.00, 'Corporate'),
(3, '2025-01-03 14:45:54', 2300.75, 'Retail'),
(4, '2025-01-04 16:20:33', 450.25, 'SME'),
(5, '2025-01-05 11:11:41', 1750.60, 'Corporate'),
(6, '2025-01-06 08:50:19', 990.90, 'Retail'),
(7, '2025-01-07 18:05:09', 5600.00, 'Corporate'),
(8, '2025-01-08 13:30:44', 300.00, 'SME'),
(9, '2025-01-09 12:10:21', 2100.10, 'Retail'),
(10, '2025-01-10 17:41:08', 4700.00, 'Corporate'),
(11, '2025-01-11 10:22:31', 650.00, 'Retail'),
(12, '2025-01-12 15:33:47', 7200.55, 'Corporate'),
(13, '2025-01-13 09:10:14', 1800.80, 'SME'),
(14, '2025-01-14 20:50:59', 220.20, 'Retail'),
(15, '2025-01-15 11:05:35', 5400.40, 'Corporate'),
(16, '2025-01-16 14:15:18', 1300.30, 'Retail'),
(17, '2025-01-17 16:45:28', 600.00, 'SME'),
(18, '2025-01-18 08:25:44', 7500.00, 'Corporate'),
(19, '2025-01-19 19:35:21', 4100.15, 'Corporate'),
(20, '2025-01-20 12:55:49', 925.50, 'Retail'),
(21, '2025-01-21 09:15:00', 1350.75, 'SME'),
(22, '2025-01-22 18:05:12', 250.00, 'Retail'),
(23, '2025-01-23 10:45:27', 7850.40, 'Corporate'),
(24, '2025-01-24 17:30:30', 3100.00, 'Corporate'),
(25, '2025-01-25 11:15:44', 475.25, 'SME'),
(26, '2025-01-26 14:05:55', 1900.10, 'Retail'),
(27, '2025-01-27 20:15:20', 9000.00, 'Corporate'),
(28, '2025-01-28 09:45:10', 650.60, 'SME'),
(29, '2025-01-29 18:20:30', 120.00, 'Retail'),
(30, '2025-01-30 10:10:10', 5100.99, 'Corporate'),
(31, '2025-01-31 16:05:00', 720.50, 'Retail'),
(32, '2025-02-01 08:15:15', 8200.00, 'Corporate'),
(33, '2025-02-02 19:50:50', 340.40, 'SME'),
(34, '2025-02-03 12:30:00', 2750.25, 'Retail'),
(35, '2025-02-04 15:15:15', 4800.80, 'Corporate'),
(36, '2025-02-05 09:10:09', 560.56, 'SME'),
(37, '2025-02-06 21:05:05', 7800.00, 'Corporate'),
(38, '2025-02-07 10:55:55', 1100.00, 'Retail'),
(39, '2025-02-08 18:40:40', 920.92, 'Corporate'),
(40, '2025-02-09 11:11:11', 230.00, 'Retail');

with cte1 as (
select 
  invoiceId,
  cast(invoiceDate as date) as invoiceDate,
  invoiceAmount,
  businessTag
from invoices)

select 
  invoiceId,
  invoiceDate,
  invoiceAmount,
  businessTag,
  sum(invoiceAmount)over(partition by businessTag order by invoiceDate asc
                          rows between 7 preceding and current row) as last_7days_running_sum
from cte1;







































































































