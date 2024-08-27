create database amazonsales;
use amazonsales;

-- 1.Find the total sales amount
select sum(Amount) as total_amount from amazonreport;

-- 2.Count the number of orders for each status
select status,  count('Order ID') as status_count
from amazonreport
group by status
order by status_count desc;


-- 3.Calculate total sales for each product category.
select Category, sum(Amount) as total_Sales
from amazonreport
group by Category
order by total_Sales desc;


-- 4.Count the number of orders fulfilled by different methods 
SELECT `fulfilled-by`, COUNT(`Order ID`) AS Order_Count
FROM amazonreport
GROUP BY `fulfilled-by`;


-- 5.Calculate the average order value for each product category.
select Category, sum(Amount) as Avg_Order_value
from amazonreport
group by Category
order by Avg_Order_Value desc;


-- 6.Identify the top 5 selling categories based on total sales amount.
select Category, sum(Amount) as Top_Selling
from amazonreport
group by Category
order by Top_Selling desc
limit 5;


-- 7.Calculate the total sales for each state
select `Ship-state`, sum(Amount) AS Total_Sales
from amazonreport
group by `Ship-state`
Order by Total_Sales DESC;


-- 8.Count the number of orders that were fulfilled as B2B (business-to-business).
select B2B, COUNT('Order ID') AS Order_Count
from amazonreport
group BY B2B;


-- 9.Analyze sales trends by month or quarter to identify peak periods.
SELECT  DATE_FORMAT(STR_TO_DATE(Date, '%m/%d/%y'), '%Y-%m') AS Month, 
SUM(Amount)AS Total_Sales,count('Order ID') as Total_Orders,avg(Amount) as avg_sales 
FROM amazonreport
GROUP BY Month
ORDER BY Month;


-- 10.Total Quantity ordred by size and Category
select Category,Size,sum(Quantity) as Quanitity_Ordered
from amazonreport
group by Category,Size
order by 1,2,3;


-- 11.Analyze profitability by combining product size and category
select Category,Size,sum(Amount) as total_sales
from amazonreport
group by Category,Size
order by 1,2,3 desc;


-- 12.Perform a region-wise analysis of sales by state and city.
select `Ship-state`,`Ship-city`, SUM(Amount) AS Total_Sales
from amazonreport
group by `Ship-state`,`Ship-city`
order by 1,2,Total_Sales DESC;


-- 13.compare the average order amount for B2B and B2C transactions:
select `B2B`, `ship-country`, `Sales Channel`, 
sum(Amount) AS Total_Sales, count('Order ID') as Total_Orders,avg(Amount) AS Avg_Order_Value 
from amazonreport
group by `B2B`, `ship-country`, `Sales Channel`
order by Total_Sales desc;
    
    
-- 14.What is the total orders for each product category based on the Courier Status
select `Category`,`Courier Status`,COUNT('Order ID') AS Total_Orders
from amazonreport
group by `Category`, `Courier Status`
order by  Total_Orders desc;
    
    






















