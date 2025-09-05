CREATE DATABASE RetailSales;
USE RetailSales;

-- Removal of Null Values#

SELECT * FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis] WHERE age IS NULL;

DELETE FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis] WHERE age IS NULL;

SELECT * FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis] WHERE quantiy IS NULL;

DELETE FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis] WHERE quantiy IS NULL;

SELECT * FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis] WHERE total_sale IS NULL;

-- Duplicates Removal

DELETE FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis]
WHERE customer_id NOT IN (
    SELECT MIN(customer_id) FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis] GROUP BY transactions_id
);

-- Exploratory Data Analysis

--Total Records
SELECT COUNT(*) FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis]; 

-- Unique Categories
SELECT DISTINCT category FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis];

-- Date Range
SELECT MIN(sale_date), MAX(sale_date) FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis];

-- Solution to Questions

-- 1) Sales Retrieval
SELECT * FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis] WHERE sale_date = '2022-11-05';

-- 2) Clothing category with more than 4 quantity sales in Nov 2022
SELECT * FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis]
WHERE category = 'Clothing'
AND quantiy > 4
AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';

-- 3) Total Sales by Category
SELECT category, SUM(total_sale) AS total_sales
FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis]
GROUP BY category;

-- 4) Average age of beauty category customers
SELECT AVG(age) AS avg_age
FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis]
WHERE category = 'Beauty';

-- 5) Transaction where total sales > 1000
SELECT * FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis] WHERE total_sale > 1000;

-- 6) Total transaction by gender in each category
SELECT gender, category, COUNT(transactions_id) AS total_transactions
FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis]
GROUP BY gender, category;

-- 7) Average sales per month
SELECT YEAR(sale_date) AS year, MONTH(sale_date) AS month, AVG(total_sale) AS avg_sale
FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis]
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY avg_sale DESC;

-- 8) Top 5 customer by total sales
SELECT customer_id, SUM(total_sale) AS total_sales
FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis]
GROUP BY customer_id
ORDER BY total_sales DESC 
LIMIT 5;

-- 9) Unique customers per category
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM [RetailSales].[dbo].[SQL - Retail Sales Analysis]
GROUP BY category;





