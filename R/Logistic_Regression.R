# Logistic Regression

# read_csv
df = read.csv('Social_Network_Ads.csv')
df$User.ID = NULL

# feature scaling
df[,1:2] = scale(df[,1:2])

# library caTools
library(caTools)

# split dataset
set.seed(123)
split = sample.split(df$Purchased, SplitRatio = 0.7)
train_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

# nyoba summary
train_set$Purchased = as.factor(train_set$Purchased)
test_set$Purchased =as.factor((test_set$Purchased))

summary(train_set$Purchased)
summary(test_set$Purchased)

# model
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = train_set)

summary(classifier)

# prediction
predict = predict(classifier,
                  type = 'response',
                  newdata = test_set[-3])
# prob_predict
predict

y_pred = ifelse(predict >= 0.5, 1, 0)

# result
result = cbind(test_set, y_pred)
View(result)
