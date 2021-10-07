# Packages loaded

library(quantmod)
library(xts)
library(rvest)
library(tidyverse)
library(stringr)
library(forcats)
library(lubridate)
library(plotly)
library(dplyr)
library(PerformanceAnalytics)

# Analyzing Performance of Amazon stock 
getSymbols("AMZN",from="2008-08-01",to="2021-10-07")


# The case study is amazing  from 75 to 3200 closing prize from 2008 to 2021

# Lets calculate Daily Anual and weekly return
dailyReturn(AMZN$AMZN.Close)

tail(dailyReturn(AMZN$AMZN.Close)) 

# daily.returns
# 2021-09-29 -0.0044752784
# 2021-09-30 -0.0048710975
# 2021-10-01 -0.0005418591
# 2021-10-04 -0.0284716960
# 2021-10-05  0.0097874997
# 2021-10-06  0.0127320739

# Daily return showing slow return from prievous day
chartSeries(dailyReturn(AMZN$AMZN.Close)) 

# Let check weeklyReturn()
weeklyReturn(AMZN$AMZN.Close)
tail(weeklyReturn(AMZN$AMZN.Close)) 


# weekly.returns
# 2021-09-03    0.038338614
# 2021-09-10   -0.002558947
# 2021-09-17   -0.001911097
# 2021-09-24   -0.010685859
# 2021-10-01   -0.041529464
# 2021-10-06   -0.006472226

# Calucalting return on investment 

Return.portfolio(AMZN$AMZN.Close)

# Technical analysis of Amazon’s stock

AMZN%>%chartSeries(TA='addBBands();addVo();addMACD()',subset='2021')

# Clearly the stock show decline in sentiments with the stock 
# April 2021 to Oct 2021 clear indication how market reacting signal=-0.769
sd.annualized(AMZN)

# > sd.annualized(AMZN)
# AMZN.Open AMZN.High AMZN.Low AMZN.Close AMZN.Volume
# Annualized Standard Deviation  15640.47  15801.63 15454.35   15628.99    53856067
# AMZN.Adjusted
# Annualized Standard Deviation      15628.99



#  Compute the skewness  
skewness(AMZN$AMZN.Close)
SkewnessKurtosisRatio(AMZN)
skewness(AMZN)
# skewness(AMZN$AMZN.Close)  
# [1] 1.29428

# Compute the excess kurtois
kurtosis(AMZN$AMZN.Close)
# kurtosis(AMZN$AMZN.Close)
# [1] 0.5488536
# The combination of a positive value of skewness and a positive 
# value of kurtosis indicates that large positive and negative
# returns are likely to occur more often.
# Yes, the returns are of normal distribution.

# Calculate the SemiDeviation
# Semi-deviation: the variability of returns below the mean return
SemiDeviation(AMZN)
## SemiDeviation(AMZN)
# AMZN.Open AMZN.High AMZN.Low AMZN.Close AMZN.Volume AMZN.Adjusted
# Semi-Deviation   522.879  527.9839 516.9555   522.6009     1536582      522.6009                 

# Calculate the value at risk
# Value-at-Risk (or VaR): the 5% quantile of the return distribution, 
# meaning that a more negative return can only happen with a probability of 5%. 
# For example, you might ask: “what is the largest loss I could potentially
# take within the next quarter, with 95% confidence?”
VaR(AMZN, p = 0.025)
##   
# VaR(AMZN, p = 0.025)
# VaR calculation produces unreliable result (risk over 100%) for column: 1 : 204.707537364384
# VaR calculation produces unreliable result (risk over 100%) for column: 2 : 205.983453316696
# VaR calculation produces unreliable result (risk over 100%) for column: 3 : 203.133497564935
# VaR calculation produces unreliable result (risk over 100%) for column: 4 : 204.902283181021
# VaR calculation produces unreliable result (inverse risk) for column: 5 : -5085911.06504399
# VaR calculation produces unreliable result (risk over 100%) for column: 6 : 204.902283181021
# AMZN.Open AMZN.High AMZN.Low AMZN.Close AMZN.Volume AMZN.Adjusted
# VaR        -1        -1       -1         -1          NA            -1
# ## VaR -0.1534668
VaR(AMZN, p = 0.05)

# > VaR(AMZN, p = 0.05)
# VaR calculation produces unreliable result (risk over 100%) for column: 1 : 297.902746785515
# VaR calculation produces unreliable result (risk over 100%) for column: 2 : 300.660885124133
# VaR calculation produces unreliable result (risk over 100%) for column: 3 : 294.653140558472
# VaR calculation produces unreliable result (risk over 100%) for column: 4 : 297.780342048507
# VaR calculation produces unreliable result (inverse risk) for column: 5 : -6910454.96022338
# VaR calculation produces unreliable result (risk over 100%) for column: 6 : 297.780342048507
# AMZN.Open AMZN.High AMZN.Low AMZN.Close AMZN.Volume AMZN.Adjusted
# VaR        -1        -1       -1         -1          NA            -1

# Calculate the expected shortfall
ES(AMZN, p = 0.025)
##         
## ES -0.1534668
ES(AMZN, p = 0.05)
##       
## ES -0.1431922
# ES(AMZN, p = 0.05)
# ES calculation produces unreliable result (risk over 100%) for column: 1 : 1064.37736389811
# ES calculation produces unreliable result (risk over 100%) for column: 2 : 1076.58008721871
# ES calculation produces unreliable result (risk over 100%) for column: 3 : 1049.54050814357
# ES calculation produces unreliable result (risk over 100%) for column: 4 : 1061.68109729539
# ES calculation produces unreliable result (inverse risk) for column: 5 : -4539366.65169011
# ES calculation produces unreliable result (risk over 100%) for column: 6 : 1061.68109729539
# AMZN.Open AMZN.High AMZN.Low AMZN.Close AMZN.Volume AMZN.Adjusted
# ES        -1        -1       -1         -1          NA            -1


