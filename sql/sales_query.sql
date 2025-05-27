create database Blinkit
USE Blinkit
SELECT * FROM Blinkit_Data

SELECT COUNT(*) from Blinkit_Data

UPDATE Blinkit_Data
SET Item_Fat_Content =
CASE
WHEN Item_Fat_Content IN ('LF', 'low fat') THEN 'Low Fat'
WHEN Item_Fat_Content = 'reg' THEN 'Regular'
ELSE Item_Fat_Content
END

SELECT DISTINCT(Item_Fat_Content) FROM Blinkit_Data

1. Total sales

SELECT SUM(Sales) as Total_Sales
FROM Blinkit_Data

SELECt CAST (SUM(Sales)/1000000 AS DECIMAL (10,2)) as Total_Sales_Millions
FROM Blinkit_Data

2. Average

select CAST(AVg(Sales) AS DECIMAL(10,0)) AS average_sales_decimal
FROM Blinkit_Data

3. number of items

SELECT COUNT(*) AS no_of_Items FROM Blinkit_Data


4. Average Ratings

SELECT CAST(AVG(Rating) AS DECIMAL (10,2)) AS average_rating
FROM Blinkit_Data


Granular requirement

1. Total sales by Fat content

	SELECT Item_Fat_Content,
	CAST(SUM(Sales) AS DECIMAL (10,2)) AS total_sales,
	CAST(AVG(Sales) AS DECIMAL (10,1)) AS average_sales,
	COUNT(*) AS no_of_Items,
	CAST(AVG(Rating) AS DECIMAL (10,2)) AS average_rating
	FROM Blinkit_Data
	GROUP BY Item_Fat_Content
	ORDER BY total_sales DESC


2.  Total sales by item type

SELECT Item_Type, 
CAST(SUM(Sales) AS DECIMAL (10,2)) AS total_sales,
CAST(AVG(Sales) AS DECIMAL (10,1)) AS avg_sales,
COUNT(*) AS no_of_items,
CAST(AVG(Rating) AS DECIMAL (10,2)) AS average_rating
FROM Blinkit_Data
GROUP BY Item_Type
ORDER BY total_sales DESC

3. Fat content by outlet_location_type for total sales

SELECT Outlet_Location_Type, Item_Fat_Content,
CAST(SUM(Sales) AS DECIMAL (10,2)) AS total_sales,
CAST(AVG(Sales) AS DECIMAL (10,1)) AS avg_sales,
COUNT(*) AS no_of_items,
CAST(AVG(Rating) AS DECIMAL (10,2)) AS average_rating
FROM Blinkit_Data
GROUP BY Outlet_Location_Type, Item_Fat_Content
ORDER BY total_sales ASC

4. Total sales by outlet Establishment

SELECT Outlet_Establishment_Year,
CAST(SUM(Sales) AS DECIMAL (10,2)) AS  total_sales,
CAST(AVG(Sales) AS DECIMAL (10,1)) AS average_sales,
COUNT(*) as no_of_items,
CAST(AVG(Rating) AS DECIMAL (10,2)) AS average_rating
FROM Blinkit_Data
GROUP BY Outlet_Establishment_Year
ORDER BY total_sales DESC

5. percentage of sales by outlet size
select * from Blinkit_Data

SELECT Outlet_Size,
CAST(SUM(Sales) AS DECIMAL (10,2)) AS total_sales,
CAST(SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER() AS DECIMAL (10,2)) AS sales_percentage
FROM Blinkit_Data
GROUP BY Outlet_Size
ORDER BY total_sales DESC;

6. Sales by outlet location

SELECT 
Outlet_Location_Type,
CAST(SUM(Sales) AS DECIMAL (10,2)) AS total_sales
FROM Blinkit_Data
GROUP BY Outlet_Location_Type
ORDER BY total_sales DESC;

7. All Metrics by outlet type:

SELECT 
Outlet_Type,
CAST(SUM(Sales) AS DECIMAL (10,2)) as total_sales,
CAST((SUM(Sales) * 100.0 /SUM(SUM(Sales)) OVER()) AS DECIMAL (10,2)) AS sales_percentage,
CAST(avg(Sales) AS DECIMAL (10,1)) AS average_sales,
Count(*) as no_of_items,
CAST (AVG(Rating) AS DECIMAL (10,2)) AS average_rating
from Blinkit_Data
group by Outlet_Type
order by total_sales DESCS