library(ggplot2)
library(raster)

# Raster data Load
r <- raster("data/landcover.tif")

# Classification Loaded Result
predictions <- matrix(sample(1:3, ncell(r), replace=TRUE), nrow=nrow(r), ncol=ncol(r))

# Map Saved
df <- as.data.frame(rasterToPoints(predictions))
ggplot(df, aes(x=x, y=y, fill=layer)) +
  geom_raster() +
  scale_fill_gradient(low="yellow", high="green") +
  ggtitle("Land Cover Classification") +
  ggsave("outputs/classified_map.png")