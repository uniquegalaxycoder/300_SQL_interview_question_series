-- Show sales with a cumulative sum of revenue per customer.


create table leads (
  leadId bigint,
  lead_date date,
  lead_campaign varchar(20),
  lead_location varchar(20),
  interest_product varchar(30)
);

create table sales (
  salesDate date,
  salesID bigint,
  salesAmount float(10,2),
  invoiceId bigint,
  lead_Id bigint
);

INSERT INTO leads (leadId, lead_date, lead_campaign, lead_location, interest_product) VALUES
(1,'2025-01-01 08:15:11','Instagram','Bangalore','GT 650 Exhaust'),
(2,'2025-01-02 09:20:45','Google Ads','Mumbai','JBL Tune 720'),
(3,'2025-01-03 10:11:23','YouTube','Chennai','KP Racing Exhaust'),
(4,'2025-01-04 12:40:19','Instagram','Pune','Corporate Tea Pack'),
(5,'2025-01-05 14:05:09','LinkedIn','Noida','CSB Franchise Kit'),
(6,'2025-01-06 16:45:33','Google Ads','Bangalore','Chai Cup Bulk'),
(7,'2025-01-07 11:30:44','Instagram','Hyderabad','GT 650 Exhaust'),
(8,'2025-01-08 19:10:21','Google Ads','Gurgaon','CCD Coffee Pack'),
(9,'2025-01-09 13:25:55','YouTube','Mumbai','Tapri Startup Guide'),
(10,'2025-01-10 10:10:10','Instagram','Pune','Corporate Tea Pack'),
(11,'2025-01-11 17:17:17','Google Ads','Bangalore','Red Rooster Exhaust'),
(12,'2025-01-12 09:05:30','LinkedIn','Mumbai','Chaayos Corporate Kit'),
(13,'2025-01-13 20:55:55','Instagram','Chennai','Chai Cup Bulk'),
(14,'2025-01-14 08:45:10','YouTube','Pune','GT 650 Exhaust'),
(15,'2025-01-15 18:30:30','Instagram','Noida','JBL Tune 720'),
(16,'2025-01-16 11:11:11','Google Ads','Mumbai','KP Racing Exhaust'),
(17,'2025-01-17 16:40:40','Instagram','Hyderabad','Chai Cup Bulk'),
(18,'2025-01-18 09:50:50','Google Ads','Chennai','Corporate Tea Pack'),
(19,'2025-01-19 14:14:14','Instagram','Pune','GT 650 Exhaust'),
(20,'2025-01-20 15:15:15','LinkedIn','Mumbai','CSB Franchise Kit'),
(21,'2025-01-21 10:05:05','Instagram','Chennai','Tapri Startup Guide'),
(22,'2025-01-22 20:20:20','Google Ads','Bangalore','CCD Coffee Pack'),
(23,'2025-01-23 08:08:08','YouTube','Noida','KP Racing Exhaust'),
(24,'2025-01-24 18:18:18','Instagram','Mumbai','Chaayos Corporate Kit'),
(25,'2025-01-25 09:09:09','LinkedIn','Pune','Corporate Tea Pack'),
(26,'2025-01-26 19:19:19','Instagram','Hyderabad','Chai Cup Bulk'),
(27,'2025-01-27 12:12:12','Google Ads','Bangalore','GT 650 Exhaust'),
(28,'2025-01-28 21:21:21','Instagram','Mumbai','JBL Tune 720'),
(29,'2025-01-29 14:25:36','YouTube','Chennai','Tapri Startup Guide'),
(30,'2025-01-30 17:48:59','Google Ads','Pune','Corporate Tea Pack');

INSERT INTO sales (salesID, salesDate, salesAmount, invoiceId, lead_Id) VALUES
(1001,'2025-01-01 10:15:00',1200.50,501,1),
(1002,'2025-01-02 11:20:11',4500.00,502,2),
(1003,'2025-01-03 14:30:23',13500.75,503,3),
(1004,'2025-01-04 09:40:19',850.00,504,4),
(1005,'2025-01-05 16:05:09',22000.00,505,5),
(1006,'2025-01-06 12:45:33',500.25,506,6),
(1007,'2025-01-07 08:25:55',12500.00,507,7),
(1008,'2025-01-08 18:18:18',7800.50,508,8),
(1009,'2025-01-09 13:33:33',120.00,509,9),
(1010,'2025-01-10 15:55:55',14000.00,510,10),
(1011,'2025-01-11 09:09:09',5600.60,511,11),
(1012,'2025-01-12 17:17:17',18000.80,512,12),
(1013,'2025-01-13 14:14:14',750.50,513,13),
(1014,'2025-01-14 20:20:20',920.00,514,14),
(1015,'2025-01-15 11:11:11',1200.00,515,15),
(1016,'2025-01-16 19:19:19',8500.90,516,16),
(1017,'2025-01-17 10:10:10',3400.00,517,17),
(1018,'2025-01-18 18:45:12',56890.75,518,18),
(1019,'2025-01-19 09:12:45',7600.00,519,19),
(1020,'2025-01-20 21:21:21',5600.40,520,20),
(1021,'2025-01-21 12:22:32',500.00,521,21),
(1022,'2025-01-22 16:35:46',2750.25,522,22),
(1023,'2025-01-23 19:50:50',9200.00,523,23),
(1024,'2025-01-24 09:15:15',3100.99,524,24),
(1025,'2025-01-25 17:45:30',7850.00,525,25),
(1026,'2025-01-26 20:30:30',650.00,526,26),
(1027,'2025-01-27 10:40:40',4100.15,527,27),
(1028,'2025-01-28 18:20:20',120.50,528,28),
(1029,'2025-01-29 14:45:54',2300.75,529,29),
(1030,'2025-01-30 08:15:15',450.25,530,30);


with cte1 as (
  select 
    leads.*,
    sales.*
  from leads left join sales
  on leads.leadId = sales.lead_Id 
)

select
  leadId,
  lead_date,
  lead_campaign,
  lead_location,
  interest_product,
  salesDate,
  salesAmount,
  round(sum(salesAmount)over(order by salesDate asc), 0) as cumsum_revenue
from cte1 ;





