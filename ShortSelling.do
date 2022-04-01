use "C:\Users\GIUSEPPE\Desktop\GMESHORT\Dataset Yahoo! Finance.dta"

sum 

*Conversion into logarithmic variables 
gen ln_volume=log(Daily_Volume)
gen ln_marketcap=log(MarketCap)
gen ln_vol_option=log(Option_Volume)

*Correlation Matrix
 corr ShortRatio ln_volume ln_marketcap Beta ROA ROE DE Held_Insiders Held_Institutions Growth_Rate_5Y Implied_Volatility Put_Call_Ratio ln_vol_option Rating
 
 *Multiple Regression Model
 reg ShortRatio ln_volume ln_marketcap Beta ROA ROE DE Held_Insiders Held_Institutions Growth_Rate_5Y Implied_Volatility Put_Call_Ratio ln_vol_option Rating

 *Simple Regressions
reg ShortRatio ln_volume
twoway (scatter ShortRatio ln_volume)(lfit ShortRatio ln_volume)

reg ShortRatio ln_marketcap
twoway (scatter ShortRatio ln_marketcap)(lfit ShortRatio ln_marketcap)

reg ShortRatio Beta
twoway (scatter ShortRatio Beta)(lfit ShortRatio Beta)

reg ShortRatio ROA
twoway (scatter ShortRatio ROA)(lfit ShortRatio ROA)

reg ShortRatio ROE
twoway (scatter ShortRatio ROE)(lfit ShortRatio ROE)

reg ShortRatio DE
twoway (scatter ShortRatio DE)(lfit ShortRatio DE)

reg ShortRatio Held_Insiders
twoway (scatter ShortRatio Held_Insiders)(lfit ShortRatio Held_Insiders)

reg ShortRatio Held_Institutions 
twoway (scatter ShortRatio Held_Institutions)(lfit ShortRatio Held_Institutions)

reg ShortRatio Growth_Rate_5Y 
twoway (scatter ShortRatio Growth_Rate_5Y)(lfit ShortRatio Growth_Rate_5Y)

reg ShortRatio Implied_Volatility 
twoway (scatter ShortRatio Implied_Volatility)(lfit ShortRatio Implied_Volatility)

reg ShortRatio Put_Call_Ratio 
twoway (scatter ShortRatio Put_Call_Ratio)(lfit ShortRatio Put_Call_Ratio)

reg ShortRatio ln_vol_option 
twoway (scatter ShortRatio ln_vol_option)(lfit ln_vol_option)

reg ShortRatio Rating
twoway (scatter ShortRatio Rating)(lfit ShortRatio Rating)

*Breusch-Pagan test and robust regression
hettest
reg ShortRatio ln_volume ln_marketcap Beta ROA ROE DE Held_Insiders Held_Institutions Growth_Rate_5Y Implied_Volatility Put_Call_Ratio ln_vol_option Rating, r

*Residuals distribution
predict res_ShortRatio, residuals
histogram res_ShortRatio