use "C:\Users\ekman\Desktop\Skole\Semester 6 Vår 2020\Bacheloroppgave i samfunnsøkonomi SØK2013\Analyse.dta"
sum Volume MarketCap HeldByInsiders HeldByInstitutions ShortRatio
reg ShortRatio Volume
reg ShortRatio MarketCap
reg ShortRatio HeldByInsiders
reg ShortRatio HeldByInstitutions
reg ShortRatio Volume MarketCap HeldByInsiders HeldByInstitutions
twoway (scatter ShortRatio Volume)(lfit ShortRatio Volume)
twoway (scatter ShortRatio MarketCap)(lfit ShortRatio MarketCap)
twoway (scatter ShortRatio HeldByInsiders)(lfit ShortRatio HeldByInsiders)
twoway (scatter ShortRatio HeldByInstitutions)(lfit ShortRatio HeldByInstitutions)
corr ShortRatio SharesOutstanding Volume MarketCap HeldByInsiders HeldByInstitutions
gen lnVolume=log(Volume)
gen lnMarketCap=log(MarketCap)
reg ShortRatio lnVolume lnMarketCap HeldByInsiders HeldByInstitutions
reg ShortRatio Volume MarketCap HeldByInsiders HeldByInstitutions
hettest
predict resid_ShortRatio, residuals
histogram resid_ShortRatio
