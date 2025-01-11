SELECT
	CONCAT(_Product_,'_',Segment,'-',Country) AS Unique_ID,
    _Product_,
    _COGS_,
    _Profit_,
    (_Profit_/_COGS_) AS Profit_COGS_Ratio
FROM Financials
WHERE _COGS_ > 50000 AND _Profit_ < 10000
ORDER BY Profit_COGS_Ratio ASC;
	
/*
"Unique_ID"|"_Product_"|"_COGS_"|"_Profit_"|"Profit_COGS_Ratio"
" Paseo _Enterprise-Germany"|" Paseo "|"95400.0"|"0.0"|"0"
" Paseo _Enterprise-France"|" Paseo "|"84480.0"|"0.0"|"0"
" Velo _Enterprise-Germany"|" Velo "|"96840.0"|"0.0"|"0"
" Velo _Enterprise-France"|" Velo "|"84480.0"|"0.0"|"0"
" Velo _Enterprise-Canada"|" Velo "|"68040.0"|"0.0"|"0"
" Amarilla _Enterprise-United States of America"|" Amarilla "|"69480.0"|"0.0"|"0"
" VTT _Enterprise-Mexico"|" VTT "|"66480.0"|"0.0"|"0"
" Velo _Enterprise-France"|" Velo "|"79560.0"|"0.0"|"0"
" VTT _Enterprise-Germany"|" VTT "|"66240.0"|"0.0"|"0"
*/


