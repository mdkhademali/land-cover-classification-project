# src/preprocess.py
import rasterio
import numpy as np
import matplotlib.pyplot as plt

def calculate_ndvi(input_tif, output_png):
    with rasterio.open(input_tif) as src:
        nir = src.read(4)
        red = src.read(1)
    
    ndvi = (nir.astype(float) - red.astype(float)) / (nir + red)
    
    plt.imshow(ndvi, cmap='RdYlGn')
    plt.colorbar(label='NDVI')
    plt.title("NDVI Map")
    plt.savefig(output_png)
    plt.show()

calculate_ndvi("data/landcover.tif", "outputs/ndvi_map.png")