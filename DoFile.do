use "C:\Users\GIUSEPPE\Desktop\GMESHORT\Dataset Yahoo! Finance.dta"

sum Volume MarketCap Insiders Institutions ShortRatio

corr ShortRatio Volume MarketCap Insiders Institutions

reg ShortRatio Volume

twoway (scatter ShortRatio Volume)(lfit ShortRatio Volume)

reg ShortRatio MarketCap

twoway (scatter ShortRatio MarketCap)(lfit ShortRatio MarketCap)

reg ShortRatio Insiders

twoway (scatter ShortRatio Insiders)(lfit ShortRatio Insiders)

reg ShortRatio Institutions

twoway (scatter ShortRatio Institutions)(lfit ShortRatio Institutions)

reg ShortRatio Volume MarketCap Insiders Institutions

*Alternative model with logarithmic variables 
gen ln_Volume=log(Volume)
gen ln_MarketCap=log(MarketCap)

reg ShortRatio ln_Volume

reg ShortRatio ln_MarketCap

reg ShortRatio ln_Volume ln_MarketCap Insiders Institutions

*Breusch-Pagan test and robust regression
hettest
reg ShortRatio Volume MarketCap Insiders Institutions, r

*Residuals distribution
predict res_ShortRatio, residuals
histogram res_ShortRatio

*Correlation with Shares Outstanding
corr ShortRatio Volume MarketCap Insiders Institutions SharesOutstanding

corr ShortRatio ln_Volume ln_MarketCap Insiders Institutions SharesOutstanding