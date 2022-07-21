# Association Rule / Market Base Analysis / Apriori

# library
library(stringr)
library(arules)
library(arulesViz)

# read csv
first_df = read.csv("Association Rule Data.csv")

first_df$key = paste(first_df$eff_dt, first_df$cust_no)
first_df = first_df[order(first_df$key),]

df = first_df[,c("cust_no", "merchant_nm", "key")]
tb_df = with(df, table(key, merchant_nm))
tb_df[tb_df >= 1] = 1

df_merch = as.data.frame.matrix(tb_df)
df_merch

recodelevel = function(x) {
  x = as.numeric(x)
  x = gsub("0", NA, format(as.numeric(x)))
  factor(x)
}

df_merch = df_merch[apply(df_merch, 1, sum) >= 3,]

convertcols = names(df_merch)
