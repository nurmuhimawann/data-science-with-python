data$EstimatedSalary[is.na(data$EstimatedSalary)] = 0
View(data)

mean(data$Age, na.rm = TRUE)
max(data$Age, na.rm = TRUE)
min(data$Age, na.rm = TRUE)

data$Age[is.na(data$Age)] = mean(data$Age, na.rm = TRUE)

df = read.csv('Social_Network_Ads - na.csv')

df$Gender = as.factor(df$Gender)
summary(df)
summary(df$Gender)

levels(df$Gender)

# train test

library(caTools)

df = read.csv('Social_Network_Ads.csv')
set.seed(123)
split = sample.split(df$Purchased, SplitRatio = 0.8)
train_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

train_set$Purchased = as.factor(train_set$Purchased)
test_set$Purchased = as.factor(test_set$Purchased)

summary(train_set$Purchased)
summary(test_set$Purchased)
