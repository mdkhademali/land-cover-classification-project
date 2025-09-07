# src/train_model.py
import geopandas as gpd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import joblib

def train_model(training_data, model_path):
    train_data = gpd.read_file(training_data)
    X = train_data[['nir', 'red']]
    y = train_data['class']
    
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    
    clf = RandomForestClassifier(n_estimators=100, random_state=42)
    clf.fit(X_train, y_train)
    
    joblib.dump(clf, model_path)
    
    preds = clf.predict(X_test)
    accuracy = accuracy_score(y_test, preds)
    print(f"Model Accuracy: {accuracy:.2f}")

train_model("data/training_points.geojson", "models/rf_model.pkl")