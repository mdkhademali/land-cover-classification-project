# src/preprocess.R
library(raster)
library(ggplot2)

calculate_ndvi <- function(input_tif, output_png) {
  raster_data <- stack(input_tif)
  ndvi <- (raster_data[[4]] - raster_data[[1]]) / (raster_data[[4]] + raster_data[[1]])
  
  ggplot() +
    geom_raster(data = as.data.frame(rasterToPoints(ndvi)), aes(x = x, y = y, fill = layer)) +
    scale_fill_gradient(low = "yellow", high = "green") +
    ggtitle("NDVI Map")
  ggsave(output_png)
}

calculate_ndvi("data/landcover.tif", "outputs/ndvi_map.png")