PRAGMA table_info(Financials)

--updating & and , (reformatting)
UPDATE Financials
SET
	_Units_Sold_ =  CAST(REPLACE(REPLACE(_units_sold_,'$',''),',','') AS Float),
    _manufacturing_price_ = CAST(REPLACE(REPLACE(_manufacturing_price_,'$',''),',','') AS Float),
    _sale_price_ = CAST(REPLACE(REPLACE(_sale_price_,'$',''),',','') AS Float),
    _gross_sales_ = CAST(REPLACE(REPLACE(_gross_sales_,'$',''),',','') AS Float),
    _discounts_ = CAST(REPLACE(REPLACE(_discounts_,'$',''),',','') AS Float),
    __sales_ = CAST(REPLACE(REPLACE(__sales_,'$',''),',','') AS Float),
    _cogs_ = CAST(REPLACE(REPLACE(_cogs_,'$',''),',','') AS Float),
    _profit_ = CAST(REPLACE(REPLACE(_profit_,'$',''),',','') AS Float)

--finding duplicates
SELECT*
from Financials
group by segment, country, _product_, _discount_band_, _units_sold_, _manufacturing_price_, _sale_price_, _gross_sales_, _discounts_, __sales_, _cogs_, _profit_, month_number, _month_name_
HAVING COUNT(*)>1

--finding missing values
SELECT
	SUM(CASE when segment is null then 1 else 0 end) as Missing_Segment,
    SUM(CASE when country is null then 1 else 0 end) as Missing_country,
    SUM(CASE when _product_ is null then 1 else 0 end) as Missing_product,
    SUM(CASE when _discount_band_ is null then 1 else 0 end) as Missing_discount_band,
    SUM(CASE when _units_sold_ is null then 1 else 0 end) as Missing_units_sold,
    SUM(CASE when _manufacturing_price_ is null then 1 else 0 end) as Missing_manufacturing_price,
    SUM(CASE when _sale_price_ is null then 1 else 0 end) as Missing_sales_price,
    SUM(CASE when _gross_sales_ is null then 1 else 0 end) as Missing_gross_sales,
    SUM(CASE when _discounts_ is null then 1 else 0 end) as Missing_discounts,
    SUM(CASE when __sales_ is null then 1 else 0 end) as Missing_sales,
    SUM(CASE when _cogs_ is null then 1 else 0 end) as Missing_cogs,
    SUM(CASE when _profit_ is null then 1 else 0 end) as Missing_profit,
    SUM(CASE when month_number is null then 1 else 0 end) as Missing_month_number,
    SUM(CASE when _month_name_ is null then 1 else 0 end) as Missing_month_name,
    SUM(CASE when year is null then 1 else 0 end) as Missing_year
  FROM Financials

--read
SELECT 
	_product_,
    __sales_,
    _profit_
from Financials

SELECT 
	_product_,
    avg(_profit_) as avg_profit
FROM Financials
GROUP by _product_
order by avg_profit desc

SELECT 
	segment,
	_product_,
    __sales_,
    _profit_
FROM Financials
where segment = 'Government';

