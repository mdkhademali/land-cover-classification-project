# src/predict.py
import rasterio
import numpy as np
import joblib
import matplotlib.pyplot as plt

def predict_landcover(model_path, input_tif, output_png):
    clf = joblib.load(model_path)
    
    with rasterio.open(input_tif) as src:
        nir = src.read(4)
        red = src.read(1)
    
    ndvi = (nir.astype(float) - red.astype(float)) / (nir + red)
    X_new = np.column_stack((nir.ravel(), red.ravel()))
    
    predictions = clf.predict(X_new).reshape(nir.shape)
    
    plt.imshow(predictions, cmap='tab10')
    plt.colorbar(label='Land Cover Class')
    plt.title("Land Cover Classification")
    plt.savefig(output_png)
    plt.show()

predict_landcover("models/rf_model.pkl", "data/landcover.tif", "outputs/classified_map.png")