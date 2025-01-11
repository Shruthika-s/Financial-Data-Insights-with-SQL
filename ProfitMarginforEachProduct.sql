-- analysing total profit margin for each product
SELECT
	_product_,
    sum(__sales_) as total_sales,
    sum(_profit_) as total_profit,
    --profit margin = profit/sales revenue 
    (sum(_profit_)/sum(__sales_)) as profit_margin
 from Financials
 group by _product_
 order by profit_margin desc

 /*
"_Product_"|"total_sales"|"total_profit"|"profit_margin"
" Amarilla "|"17747116.07"|"2936044.07"|"0.16543781301814633"
" VTT "|"20511921.02"|"3156348.02"|"0.15387871359890795"
" Paseo "|"33011143.96"|"4917986.71"|"0.14897959052734383"
" Carretera "|"13815307.89"|"2057914.89"|"0.1489590319944726"
" Montana "|"15390801.88"|"2171281.13"|"0.1410765434399835"
" Velo "|"18250059.47"|"2431448.72"|"0.13322963270321883"
*/

 -- highest profit margin:  Amarilla
 -- lowest profit margin: Velo
 -- VTT- 2nd highest profit margin, Paseo- 3rd highest profit margin