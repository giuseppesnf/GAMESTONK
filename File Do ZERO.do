summarize

rename Ticker_Mentions Mentions
rename Av_Volume3Months Volume

describe

corr ShortRatio Mentions Volume MarketCap Beta ROA Debt_Ratio Growth_Rate

*dalla correlazione è interessante (non particolarmente elevata) quella tra mentions e volume/market cap

reg ShortRatio Mentions Volume MarketCap Beta ROA Debt_Ratio Growth_Rate, r

*WINSORIZE
winsor ROA, generate (wROA) p(0.01)
winsor ROE, generate (wROE) p(0.01)

*reg con winsor
reg ShortRatio Mentions Volume MarketCap Beta wROA Debt_Ratio Growth_Rate, r
reg ShortRatio Mentions Volume MarketCap Beta wROE Debt_Ratio Growth_Rate, r

*interazioni ind. performance con le Ticker Mentions
gen Mentions_ROA = Mentions*ROA
gen Mentions_ROE = Mentions*ROE

reg ShortRatio Mentions_ROA Mentions wROA Volume MarketCap Beta Debt_Ratio Growth_Rate, r
reg ShortRatio Mentions_ROE Mentions wROE Volume MarketCap Beta Debt_Ratio Growth_Rate, r
*con Mentions_ROE è significativo allo 0.088

*se invece di Beta uso St.Dev o Volatility
reg ShortRatio Mentions_ROE Mentions wROE Volume MarketCap Std_Dev Debt_Ratio Growth_Rate, r
*con st.dev ---> mention_ROE (0.071) , St.Dev (0.035) , ROE (0.072)
reg ShortRatio Mentions_ROE Mentions wROE Volume MarketCap Vol Debt_Ratio Growth_Rate, r
*con vol. ---> mention_ROE (0.071) , Vol. (0.046) , ROE (0.170)

*DUMMY PERFORMANCE (1=BAD, 0=GOOD)
gen Performance1 = 1 if wROA<0
replace Performance1 = 0 if wROA>0

gen Mentions_Performance1 = Mentions*Performance1
reg ShortRatio Mentions_Performance1 Performance1 Mentions Volume MarketCap Std_Dev Debt_Ratio Growth_Rate, r

gen Performance2 = 1 if wROE<0
replace Performance2 = 0 if wROE>0

gen Mentions_Performance2 = Mentions*Performance2
reg ShortRatio Mentions_Performance2 Performance2 Mentions Volume MarketCap Std_Dev Debt_Ratio Growth_Rate, r

gen Performance3 = 1 if wROA<0 & wROE<0
replace Performance3 = 0 if wROA>0 & wROE>0

gen Mentions_Performance3 = Mentions*Performance3
reg ShortRatio Mentions_Performance3 Mentions Performance3 Volume MarketCap Std_Dev Debt_Ratio Growth_Rate, r