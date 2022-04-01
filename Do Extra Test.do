use "C:\Users\GIUSEPPE\Desktop\GMESHORT\Dataset Yahoo! Finance.dta"

gen ln_Volume=log(Volume)
gen ln_MarketCap=log(MarketCap)

corr ShortRatio Volume MarketCap Insiders Institutions
corr ShortRatio ln_Volume ln_MarketCap Insiders Institutions

reg ShortRatio Volume MarketCap Insiders Institutions

reg ShortRatio ln_Volume ln_MarketCap Insiders Institutions


*F-Test (Extra) % Correlations


corr ShortRatio ln_Volume ln_MarketCap Insiders Institutions SharesOutstanding

reg ShortRatio Volume MarketCap 

reg ShortRatio ln_Volume ln_MarketCap

reg ShortRatio Volume Insiders 

reg ShortRatio ln_Volume Insiders 

reg ShortRatio Volume Institutions 

reg ShortRatio ln_Volume Institutions 

reg ShortRatio MarketCap Insiders 

reg ShortRatio ln_MarketCap Insiders 

reg ShortRatio MarketCap Institutions 

reg ShortRatio ln_MarketCap Institutions 

reg ShortRatio Volume MarketCap Insiders 

reg ShortRatio Insiders Institutions

reg ShortRatio ln_Volume ln_MarketCap Insiders 

reg ShortRatio Volume MarketCap Institutions 

reg ShortRatio ln_Volume ln_MarketCap Institutions 

reg ShortRatio Volume Insiders Institutions

reg ShortRatio ln_Volume Insiders Institutions

reg ShortRatio MarketCap Insiders Institutions

reg ShortRatio ln_MarketCap Insiders Institutions




*ShareOutstanding

corr ShortRatio Volume MarketCap Insiders Institutions SharesOutstanding

corr ShortRatio ln_Volume ln_MarketCap Insiders Institutions SharesOutstanding

reg Volume SharesOutstanding 

reg ln_Volume SharesOutstanding



