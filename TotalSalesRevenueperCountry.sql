-- analysing total sales revenue per country
SELECT 
	Country,
    SUM(__Sales_) AS Total_Sales_Revenue
FROM Financials
GROUP BY Country
ORDER BY Total_Sales_Revenue DESC