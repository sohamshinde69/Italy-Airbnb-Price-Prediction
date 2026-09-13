import streamlit as st  # for building the web app
import pandas as pd  # for data handling
import pickle  # for loading trained model files
 
 
st.set_page_config(
    page_title="Airbnb Price Prediction",
    page_icon="🏠",
    layout="wide"
)
 
 
@st.cache_resource
def load_model():
    with open("model.pkl", "rb") as f:
        return pickle.load(f)
 
 
model = load_model()
 
preprocessor = model.named_steps["preprocessor"]
encoder = preprocessor.named_transformers_["cat"]
 
property_types = encoder.categories_[0].tolist()
room_types = encoder.categories_[1].tolist()
cities = encoder.categories_[2].tolist()
 
st.title("🏠 Airbnb Price Prediction")
 
st.write(
    "Enter the details of an Airbnb listing to estimate its nightly price."
)
 
st.divider()
 
# -----------------------------
# Categorical inputs
# -----------------------------
 
st.subheader("🏡 Property Details")
 
col1, col2, col3 = st.columns(3)
 
with col1:
    city = st.selectbox("City", cities)
 
with col2:
    room_type = st.selectbox("Room Type", room_types)
 
with col3:
    property_type = st.selectbox("Property Type", property_types)
 
# -----------------------------
# Numeric inputs
# -----------------------------
 
st.subheader("📋 Listing Information")
 
col1, col2, col3 = st.columns(3)
 
with col1:
    accommodates = st.number_input(
        "Accommodates",
        min_value=1,
        max_value=20,
        value=2,
        step=1
    )
 
with col2:
    bedrooms = st.number_input(
        "Bedrooms",
        min_value=0.0,
        max_value=20.0,
        value=1.0,
        step=1.0
    )
 
with col3:
    bathrooms = st.number_input(
        "Bathrooms",
        min_value=0.0,
        max_value=20.0,
        value=1.0,
        step=0.5
    )
 
col1, col2, col3 = st.columns(3)
 
with col1:
    minimum_nights = st.number_input(
        "Minimum Nights",
        min_value=1,
        max_value=365,
        value=1,
        step=1
    )
 
with col2:
    number_of_reviews = st.number_input(
        "Number of Reviews",
        min_value=0,
        max_value=1000,
        value=10,
        step=1
    )
 
with col3:
    review_scores_rating = st.number_input(
        "Review Score Rating",
        min_value=0.0,
        max_value=5.0,
        value=4.5,
        step=0.1
    )
 
st.divider()
 
# -----------------------------
# Prediction
# -----------------------------
 
if st.button("💰 Predict Price", use_container_width=True):
 
    input_data = pd.DataFrame({
        "accommodates": [accommodates],
        "bathrooms": [bathrooms],
        "bedrooms": [bedrooms],
        "minimum_nights": [minimum_nights],
        "number_of_reviews": [number_of_reviews],
        "review_scores_rating": [review_scores_rating],
        "property_type": [property_type],
        "room_type": [room_type],
        "city": [city]
    })
 
    prediction = model.predict(input_data)[0]
    prediction = max(0, prediction)  # guard against unrealistic negative output
 
    st.success(f"Estimated Airbnb Price: €{prediction:,.2f} per night")
 