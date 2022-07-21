# Support Vector Machine

# read_csv
df = read.csv("DS Dasar Dataset/Social_Network_Ads.csv")

df$User.ID = NULL

# feature scaling
df[,1:2] = scale(df[,1:2]) 

# split
library(caTools)
set.seed(123)

split = sample.split(df$Purchased, SplitRatio = 0.7)
train_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

# model SVM
library(e1071)

classifier = svm(formula = Purchased ~ .,
                 data = train_set,
                 type = 'C-classification',
                 kernel = 'linear'
                 )

y_pred = predict(classifier, newdata = test_set[-3])

result = cbind(test_set, y_pred)