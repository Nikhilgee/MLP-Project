# Read in Data (This is  a processed dataset)
df <- read.csv("working.csv")


# Some changes to working to get to MLP1.csv

df$log_txcount <- log(df$X.tx, base = exp(1))
df$pricedelta <- df$Close_Price - df$Open_price
library(DataCombine)
dflag1 <- slide(df, Var = "log_txcount", slideBy = -1)
names(dflag1)[names(dflag1) == 'log_txcount-1'] <- 'log_txcount_lag'

dflag1 <- slide(dflag1, Var = "pricedelta", slideBy = -1)
names(dflag1)[names(dflag1) == 'pricedelta-1'] <- 'pricedelta_lag'

dflag1 <- slide(dflag1, Var = "Ex_volume", slideBy = -1)
names(dflag1)[names(dflag1) == 'Ex_volume-1'] <- 'Ex_volume_lag'

dflag1 <- slide(dflag1, Var = "Ex_volume", slideBy = -1)
names(dflag1)[names(dflag1) == 'Ex_volume-1'] <- 'Ex_volume_lag'

dflag1 <- slide(dflag1, Var = "Transaction", slideBy = -1)
names(dflag1)[names(dflag1) == 'Transaction-1'] <- 'Transaction_lag'

dflag1 <- slide(dflag1, Var = "Wt_Price", slideBy = -1)
names(dflag1)[names(dflag1) == 'Wt_Price-1'] <- 'Wt_Price_lag' 

dflag1 <- slide(dflag1, Var = "High_price", slideBy = -1)
names(dflag1)[names(dflag1) == 'High_price-1'] <- 'High_price_lag'

# removing first row
dflag1 <- dflag1[-1,]
dflag1$ID <- seq.int(nrow(dflag1))

write.csv(dflag1, "MLP1.csv")


# Plot ln(transaction frequency) Figure 2 in the article
plot(df$log_txcount, main = "Natural Log of transaction frequency")


# Plot ACF of logged difference
acf((dflag1$log_txcount - dflag1$log_txcount_lag),lag = 30, main="ACF log diff transaction frequency")


