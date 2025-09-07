# src/train_model.R
library(sf)
library(randomForest)

train_model <- function(training_data, model_path) {
  train_data <- st_read(training_data)
  X <- train_data[, c("nir", "red")]
  y <- as.factor(train_data$class)
  
  set.seed(42)
  train_idx <- sample(1:nrow(X), size = 0.8 * nrow(X))
  X_train <- X[train_idx, ]
  y_train <- y[train_idx]
  X_test <- X[-train_idx, ]
  y_test <- y[-train_idx]
  
  rf_model <- randomForest(X_train, y_train, ntree = 100, set.seed(42))
  saveRDS(rf_model, model_path)
  
  preds <- predict(rf_model, X_test)
  accuracy <- sum(preds == y_test) / length(y_test)
  print(paste("Model Accuracy:", round(accuracy, 2)))
}

train_model("data/training_points.geojson", "models/rf_model.rds")