# linear regression

# read_csv
df = read.csv('Salary_Data.csv')

# library caTools
library(caTools)

# split dataset
set.seed(123)
split = sample.split(df$Salary, SplitRatio = 0.7)
train_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

# model
regressor = lm(formula = Salary ~ YearsExperience,
               data = train_set)

y_pred = predict(regressor, newdata = test_set)

# result
result = cbind(test_set, y_pred)
