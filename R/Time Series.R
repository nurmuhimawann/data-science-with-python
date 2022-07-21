# Time Series

# read csv
data = read.csv("Timeseries Data.csv")

X = data[,2]

#library
install.packages('forecast')
library(forecast)

# TS
X_TS = ts(X, frequency = 12, start = c(2014,1))
plot(X_TS)

# X-only
mod = auto.arima(X_TS)
result = data.frame(mod$fitted)
X_predict = forecast(mod, h=13)

# result
accuracy(X_predict)
plot(X_predict)

# change to dataframe
X_predict = data.frame(X_predict)
