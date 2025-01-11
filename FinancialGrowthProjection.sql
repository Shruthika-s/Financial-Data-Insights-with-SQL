WITH Monthly_Sales AS (
  SELECT
    strftime('%m', substr(Date, 7, 4) || '-' || substr(Date, 4, 2) || '-' || substr(Date, 1, 2)) AS Month_Number,
    SUM(__Sales_) AS Total_Sales
  FROM Financials
  WHERE substr(Date, 7, 4) = '2014'
  GROUP BY Month_Number
),
GrowthRate AS(
  SELECT
  	Month_Number,
  	Total_Sales,
  	ROUND((Total_Sales - LAG(Total_Sales) OVER (ORDER BY Month_Number)) * 1.0/LAG(Total_Sales) OVER (ORDER BY Month_Number), 4) AS Monthly_Growth
  FROM Monthly_Sales
),
AvgGrowth AS(
  SELECT
  	ROUND(AVG(Monthly_Growth),4) AS Avg_Monthly_Growth
  FROM GrowthRate
)
SELECT
	Month_Number,
  	Total_Sales,
    Monthly_Growth,
    (SELECT Avg_Monthly_Growth FROM AvgGrowth) AS Avg_Monthly_Growth,
    CASE
    	WHEN Month_Number = '12' THEN ROUND(Total_Sales * (1 + (SELECT Avg_Monthly_Growth fROM AvgGrowth)),2)
        ELSE NULL
    END AS Projected_Sales_13th_Month
FROM GrowthRate

--plan for future demand

/*
"Month_Number"|"Total_Sales"|"Monthly_Growth"|"Avg_Monthly_Growth"|"Projected_Sales_13th_Month"
"01"|"6607761.69"|"null"|"0.1641"|"null"
"02"|"7297531.39"|"0.1044"|"0.1641"|"null"
"03"|"5586859.87"|"-0.2344"|"0.1641"|"null"
"04"|"6964775.08"|"0.2466"|"0.1641"|"null"
"05"|"6210211.06"|"-0.1083"|"0.1641"|"null"
"06"|"9518893.82"|"0.5328"|"0.1641"|"null"
"07"|"8102920.19"|"-0.1488"|"0.1641"|"null"
"08"|"5864622.42"|"-0.2762"|"0.1641"|"null"
"09"|"6398697.24"|"0.0911"|"0.1641"|"null"
"10"|"12375819.92"|"0.9341"|"0.1641"|"null"
"11"|"5384214.2"|"-0.5649"|"0.1641"|"null"
"12"|"11998787.9"|"1.2285"|"0.1641"|"13967788.99"
*/
 
-- LAG Window Function: Accesses the value of the previous row for growth rate calculation