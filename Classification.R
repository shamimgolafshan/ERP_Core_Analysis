rm(list = ls())
library(caret)
library(R.matlab)

data <- read.csv("/Users/shamim/Downloads/Feature_matrix.csv")

data <- t(data)

data <- data.frame(data,rep(c("A","B"),40))
colnames(data)[91] <- "y"
##

control <- trainControl(method = "LOOCV")
model <- train(y ~ ., data = data, method = "svmLinear", trControl = control)
print(model)
model <- train(y ~ ., data = data, method = "svmRadial", trControl = control)
print(model)
model <- train(y ~ ., data = data, method = "glmnet", trControl = control)
print(model)
model <- train(y ~ ., data = data, method = "rf", trControl = control)
print(model)

