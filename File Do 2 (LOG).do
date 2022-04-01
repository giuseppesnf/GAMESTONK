
*conv. logaritmica

gen ln_volume = log(Volume)
gen ln_marketcap = log(MarketCap)


*reg per H1
reg ShortRatio Mentions ROE ln_volume ln_marketcap StdDev DE_Ratio Growth_Rate Insiders Institutions Outstanding, r


*generare PERFORMANCE

gen Performance = 1 if ROE<=0
replace Performance = 0 if ROE>0

gen Performance2 = 1 if ROA<=0
replace Performance2 = 0 if ROA>0

gen Performance3 = 1 if ROE<=0 & ROA<=0
replace Performance3 = 0 if ROE>0 & ROA>0

*variabile interazione
gen Mentions_Perf = Mentions*Performance

*facoltativo
gen Mentions_ROA = Mentions*Performance2
gen Mentions_3 = Mentions*Performance3

*reg 2
reg ShortRatio Mentions_Perf Mentions Performance ln_volume ln_marketcap StdDev DE_Ratio Growth_Rate Insiders Institutions Outstanding, r

*facoltativo
reg ShortRatio Mentions_ROA Mentions Performance2 ln_volume ln_marketcap StdDev DE_Ratio Growth_Rate Insiders Institutions Outstanding, r
reg ShortRatio Mentions_3 Mentions Performance3 ln_volume ln_marketcap StdDev DE_Ratio Growth_Rate Insiders Institutions Outstanding, r

*summary
sum ShortRatio Mentions_Perf Mentions ROE Performance ln_volume ln_marketcap StdDev DE_Ratio Growth_Rate Insiders Institutions Outstanding
sum ShortRatio Mentions_Perf Mentions ROE Performance ln_volume ln_marketcap StdDev DE_Ratio Growth_Rate Insiders Institutions Outstanding, d

*correlazione
corr ShortRatio Mentions_Perf ROE Performance ln_volume ln_marketcap StdDev DE_Ratio Growth_Rate Insiders Institutions Outstanding

*vif test
vif










