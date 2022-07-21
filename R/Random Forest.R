# Random Forest

# read_csv
df = read.csv("DS Dasar Dataset/Social_Network_Ads.csv")

df$User.ID = NULL

# feature scaling
# tidak memerlukan scaling, karna tidak berhubungan sama jarak

# ubah ke factor
df$Purchased = as.factor(df$Purchased)

# split
library(caTools)
set.seed(123)

split = sample.split(df$Purchased, SplitRatio = 0.7)
train_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

# train models
install.packages('randomForest')
library(randomForest)

classifier = randomForest(x = train_set[-3],
                          y = train_set$Purchased,
                          ntree = 10)

y_pred = predict(classifier, newdata = test_set[-3])

result = cbind(test_set, y_pred)


# kinerja model
# confussion matrix
cm = table(test_set[,3], y_pred)
cm


# y_pred
#    0  1
# 0 71  6
# 1  9 34

# AUC
y_pred_num = as.numeric(y_pred)
colAUC(y_pred_num, test_set[,3], plotROC = TRUE)
