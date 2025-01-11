WITH Input AS(
  	SELECT
  		' Paseo ' AS Selected_Product, 
  		290 AS Estimated_Units_Sold
)

SELECT
	i.Estimated_Units_Sold,
    AVG(f._Manufacturing_Price_) AS Avg_Manufacturing_Price,
    i.Estimated_Units_Sold * AVG(f._Manufacturing_Price_) AS Estimated_Manufacturing_Budget
FROM Financials f
JOIN Input i ON f._Product_ = i.Selected_Product
GROUP BY i.Estimated_Units_Sold

/*
"Estimated_Units_Sold"|"Avg_Manufacturing_Price"|"Estimated_Manufacturing_Budget"
"290"|"10"|"2900"
*/ 
	