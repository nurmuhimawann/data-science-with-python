# kNN

# read_csv
df = read.csv("DS Dasar Dataset/Social_Network_Ads.csv")

df$User.ID = NULL

# feature scaling
df[,1:2] = scale(df[,1:2]) 

# split
library(caTools)
set.seed(123)

split = sample.split(df, SplitRatio = 0.7)
train_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

# models kNN
library(class)
y_pred = knn(train = train_set[,-3],
             test = test_set[,-3],
             cl = train_set[,3],
             k = 5
             )

summary(y_pred)

result = cbind(test_set, y_pred)
