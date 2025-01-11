--performing customer segmentation analysis
SELECT
	Segment,
    Country,
    _Product_,
    SUM(__Sales_) As Total_Sales,
    SUM(_Profit_) AS Total_Profit,
    SUM(_Units_Sold_) AS Total_Units_Sold,
    AVG(_Discounts_) AS Average_Discouunt
FROM Financials
GROUP BY Segment, Country, _product_
ORDER BY Total_Sales DESC
LIMIT 5;

	