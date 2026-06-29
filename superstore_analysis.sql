-- ================================================
-- Superstore Sales & Profitability Analysis
-- Tool: Google BigQuery
-- Author: David Tanon
-- Date: June 2026
-- ================================================


-- Query 1: Regional Profitability
-- Which regions generate the most profit and sales?

SELECT
  Region,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `st-pro-486506.SampleSuperstoreProject.Superstore`
GROUP BY Region
ORDER BY total_profit DESC;


-- Query 2: Category & Sub-Category Profitability
-- Which products drive profit and which are losing money?

SELECT
  Category,
  `Sub-Category`,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `st-pro-486506.SampleSuperstoreProject.Superstore`
GROUP BY Category, `Sub-Category`
ORDER BY total_profit DESC;


-- Query 3: Discount Impact on Profit
-- Do discounts hurt profitability?

SELECT
  CASE
    WHEN Discount = 0 THEN 'No Discount'
    WHEN Discount < 0.2 THEN 'Low'
    WHEN Discount < 0.4 THEN 'Medium'
    ELSE 'High'
  END AS discount_level,
  COUNT(*) AS num_orders,
  ROUND(AVG(Profit), 2) AS avg_profit,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `st-pro-486506.SampleSuperstoreProject.Superstore`
GROUP BY discount_level
ORDER BY avg_profit DESC;


-- Query 4: Customer Segment Value
-- Which customer segment is most valuable?

SELECT
  Segment,
  COUNT(*) AS num_orders,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `st-pro-486506.SampleSuperstoreProject.Superstore`
GROUP BY Segment
ORDER BY total_profit DESC;
