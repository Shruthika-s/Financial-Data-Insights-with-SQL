--analysing discount impact on sales revenue and profitability
SELECT
	_Discount_Band_,
    SUM(__Sales_) AS Total_Sales,
    SUM(_Profit_) AS Total_Profit,
    (SUM(__Sales_)/SUM(_Profit_)) AS Profit_Margin
FROM Financials
GROUP BY _Discount_Band_
ORDER BY Total_Profit DESC;

/*
"_Discount_Band_"|"Total_Sales"|"Total_Profit"|"Profit_Margin"
" Low "|"34629778.71"|"6188857.71"|"5.595504103131174"
" Medium "|"38780430.84"|"5734475.34"|"6.762681595209372"
" High "|"37372486.74"|"4011235.49"|"9.316951555990546"
" None "|"7943654"|"1736455"|"4.574638559594115"
*/

SELECT
	_Discount_Band_,
    SUM(__Sales_) AS Total_Sales,
    SUM(_Profit_) AS Total_Profit,
    (SUM(__Sales_)/SUM(_Profit_)) AS Profit_Margin
FROM Financials
GROUP BY _Discount_Band_
ORDER BY Total_Sales DESC;

/*
"_Discount_Band_"|"Total_Sales"|"Total_Profit"|"Profit_Margin"
" Medium "|"38780430.84"|"5734475.34"|"6.762681595209372"
" High "|"37372486.74"|"4011235.49"|"9.316951555990546"
" Low "|"34629778.71"|"6188857.71"|"5.595504103131174"
" None "|"7943654"|"1736455"|"4.574638559594115"
*/

