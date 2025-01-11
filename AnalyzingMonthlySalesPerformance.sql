SELECT
    strftime('%m', substr(Date, 7, 4) || '-' || substr(Date, 4, 2) || '-' || substr(Date, 1, 2)) AS Month_Number,
    SUM(__Sales_) AS Total_Sales
FROM Financials
WHERE substr(Date, 7, 4) = '2014'
GROUP BY Month_Number
ORDER BY Total_Sales DESC;

/*
"Month_Number"|"Total_Sales"
"10"|"12375819.92"
"12"|"11998787.9"
"06"|"9518893.82"
"07"|"8102920.19"
"02"|"7297531.39"
"04"|"6964775.08"
"01"|"6607761.69"
"09"|"6398697.24"
"05"|"6210211.06"
"08"|"5864622.42"
"03"|"5586859.87"
"11"|"5384214.2"
*/

-- highlights seasonal trends in sales
-- highest sales in october
-- help in planning inventory and budget