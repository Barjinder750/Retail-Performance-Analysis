
-- 1. Profit margin per category and sub-category
SELECT
  Category,
  SubCategory,
  SUM(Sales) AS Total_Sales,
  SUM(Profit) AS Total_Profit,
  ROUND(SUM(Profit)/SUM(Sales) * 100, 2) AS Profit_Margin_Percent
FROM
  retail_data
GROUP BY
  Category, SubCategory
ORDER BY
  Profit_Margin_Percent ASC;

-- 2. Regional profit performance
SELECT
  Region,
  SUM(Sales) AS Regional_Sales,
  SUM(Profit) AS Regional_Profit
FROM
  retail_data
GROUP BY
  Region;

-- 3. Monthly sales trend
SELECT
  DATE_TRUNC('month', OrderDate) AS Month,
  SUM(Sales) AS Total_Sales
FROM
  retail_data
GROUP BY
  Month
ORDER BY
  Month;

-- 4. Inventory Days vs Profitability
SELECT
  SubCategory,
  AVG(InventoryDays) AS Avg_Inventory_Days,
  SUM(Profit) AS Total_Profit
FROM
  retail_data
GROUP BY
  SubCategory
ORDER BY
  Avg_Inventory_Days DESC;
