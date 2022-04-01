rename Ticker_Mentions Mentions
rename Av_Volume3Months Volume

*conversione logaritmica Volume & MarketCap
gen ln_volume = log(Volume)
gen ln_marketcap = log(MarketCap)

sum ShortRatio Mentions ROE Volume MarketCap Std_Dev Debt_Ratio Growth_Rate

*facoltativo
describe


*matrice correlazioni
corr ShortRatio Mentions ROE Volume MarketCap Std_Dev Debt_Ratio Growth_Rate

*WINSORIZE
sum ROE, d
winsor ROE, generate (wROE) p(0.01)

*reg con winsor (H1)
reg ShortRatio Mentions wROE Volume MarketCap Std_Dev Debt_Ratio Growth_Rate, r

*interazione indicatore performance (ROE) con le Ticker Mentions. (H2) 
gen Mentions_ROE = Mentions*ROE
corr ShortRatio Mentions_ROE Mentions ROE Volume MarketCap Std_Dev Debt_Ratio Growth_Rate

*regressione 2
reg ShortRatio Mentions_ROE Mentions wROE Volume MarketCap Std_Dev Debt_Ratio Growth_Rate, r

*prova con Volatilità invece di Standard Deviation.
reg ShortRatio Mentions_ROE Mentions wROE Volume MarketCap Vol Debt_Ratio Growth_Rate, r