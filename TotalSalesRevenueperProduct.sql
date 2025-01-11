-- analysing total sales revenue per product
SELECT 
	_Product_,
    SUM(__Sales_) AS Total_Sales_Revenue
FROM Financials
GROUP BY _Product_
ORDER BY Total_Sales_Revenue DESC;

--Paseo and VTT are products in high demand