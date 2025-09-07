# src/predict.R
library(raster)
library(randomForest)

predict_landcover <- function(model_path, input_tif, output_png) {
  rf_model <- readRDS(model_path)
  raster_data <- stack(input_tif)
  ndvi <- (raster_data[[4]] - raster_data[[1]]) / (raster_data[[4]] + raster_data[[1]])
  X_new <- data.frame(nir = raster_data[[4]][], red = raster_data[[1]][])
  
  predictions <- predict(rf_model, X_new)
  pred_matrix <- matrix(predictions, nrow = nrow(raster_data), ncol = ncol(raster_data))
  
  ggplot() +
    geom_raster(data = as.data.frame(rasterToPoints(pred_matrix)), aes(x = x, y = y, fill = layer)) +
    scale_fill_manual(values = rainbow(length(unique(predictions)))) +
    ggtitle("Land Cover Classification")
  ggsave(output_png)
}

predict_landcover("models/rf_model.rds", "data/landcover.tif", "outputs/classified_map.png")