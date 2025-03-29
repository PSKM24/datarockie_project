library(caret)
library(tidyverse)
library(mlbench)

## 0. load date
data("mtcars")
view(mtcars)

## 1.split data
df <- mtcars
split_data <- function(df) {
  set.seed(42)
  n <- nrow(df)
  id <- sample(1:n, size=0.7*n)
  train_df <- df[id, ]
  test_df <- df[-id, ]
  return ( list(train=train_df,
                test=test_df) )
}

prep_df <- split_data(mtcars)

##k-fold cross validation
knn <- train(mpg ~ .,
             data = prep_df$train,
             method = "knn",
             metric = "MAE")
## the real case: RMSE โมเดลทายผิดไป3.6%
