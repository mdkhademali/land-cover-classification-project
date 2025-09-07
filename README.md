## Land Cover Classification Project

This project performs **Land Cover Classification** using **Remote Sensing Data**. It leverages machine learning techniques to classify different land cover types based on satellite imagery. The project provides implementations in both **Python** and **R**, using **Random Forest** as the primary classifier.

---

## Project Overview

Land cover classification is a critical task in **remote sensing** and **geospatial analysis**, as it provides essential information about the Earth's surface. This project uses satellite imagery and spectral indices such as **NDVI (Normalized Difference Vegetation Index)** to classify land into different categories like:

* Vegetation
* Water
* Urban areas
* Bare soil

The classification process is powered by **Random Forest**, a robust and widely-used machine learning algorithm known for high accuracy in remote sensing applications.

---

## Features

* **Python & R Implementations:** The project provides scripts in both Python and R for maximum flexibility.
* **NDVI Calculation:** Automatically computes NDVI from satellite imagery to enhance vegetation detection.
* **Random Forest Classification:** Performs supervised classification of land cover types.
* **Exportable Results:** Generates both visual maps and trained models for future use.

---

## Dataset

The dataset consists of satellite imagery with multiple spectral bands, including:

* Red, Green, Blue (RGB)
* Near-Infrared (NIR)
* NDVI (calculated from NIR and Red bands)

> **Note:** You can use publicly available datasets such as **Sentinel-2**, **Landsat-8**, or your own georeferenced images.


---

## Outputs

After running the scripts, the following outputs will be generated:

* **NDVI Map:** `outputs/ndvi_map.png`
  A visual representation of vegetation density in the study area.

* **Land Cover Classification Map:** `outputs/classified_map.png`
  A color-coded map showing different land cover types.

* **Trained Models:**

  * Python: `models/rf_model.pkl`
  * R: `models/rf_model.rds`

---

## Model Details

The **Random Forest** classifier is trained using labeled data from the satellite imagery. Key points:

* **Algorithm:** Random Forest
* **Input Features:** Spectral bands + NDVI
* **Output:** Land cover class labels

Random Forest is chosen for its robustness to overfitting and high accuracy in handling multi-spectral satellite data.

© mdkhademali