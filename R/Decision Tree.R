# Decision Tree

# read_csv
df = read.csv("DS Dasar Dataset/Social_Network_Ads.csv")

df$User.ID = NULL

# feature scaling
# tidak memerlukan scaling, karna tidak berhubungan sama jarak

# split
library(caTools)
set.seed(123)

split = sample.split(df$Purchased, SplitRatio = 0.7)
train_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

# train model
library(rpart)
classifier = rpart(formula = as.factor(Purchased) ~ .,
                   data = train_set)

classifier

y_pred = predict(classifier,
                 newdata = test_set[-3],
                 type = 'class'
                 # type = 'prob'
                 )

result = cbind(test_set, y_pred) 
result
