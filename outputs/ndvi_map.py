import numpy as np
import rasterio
import matplotlib.pyplot as plt

# Raster data Load
with rasterio.open("data/landcover.tif") as src:
    nir = src.read(1).astype(float)
    red = src.read(2).astype(float)

# NDVI Calculate
ndvi = (nir - red) / (nir + red)

# NDVI Map
plt.imshow(ndvi, cmap="RdYlGn")
plt.colorbar(label="NDVI Value")
plt.title("NDVI Map")
plt.savefig("outputs/ndvi_map.png")
plt.show()