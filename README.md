# Italy-Airbnb-Price-Prediction

Streamlit App Link : https://italy-airbnb-price-prediction.streamlit.app/


Italy Airbnb Data Analytics and Price Prediction System

Project Overview

Italy Airbnb Data Analytics and Price Prediction System is an end-to-end data science project built using real-world Airbnb listing data from four major Italian cities: Rome, Florence, Venice, and Naples.

The project was designed to demonstrate a complete data science workflow rather than focusing on only one machine-learning model. It combines:

Real-world data collection from Inside Airbnb

Data cleaning and preprocessing using Python

Missing-value analysis and comparison of two cleaning approaches

Exploratory and business-oriented data analysis

Beginner-level SQL analysis using MySQL

Regression model development and comparison

Interactive Power BI dashboards

A Streamlit application for Airbnb nightly-price estimation

Model serialization for application use

The project was developed as an individual college project, while also being designed as a portfolio project to demonstrate practical data-science skills for internship opportunities.

Objectives

The main objectives were to:

Build a data science project using a real external data source instead of a Kaggle dataset.

Demonstrate the complete data science workflow from data collection to deployment.

Analyze Airbnb pricing patterns across major Italian tourist cities.

Compare different approaches for handling missing data.

Build and compare multiple regression models for price prediction.

Use SQL to answer practical business questions from the cleaned dataset.

Build an interactive Power BI dashboard for non-technical users.

Convert the final machine-learning model into an interactive Streamlit application.

Demonstrate the ability to learn and integrate a new skill, SQL, into an existing data-science workflow.

Why Airbnb and Italy?

Airbnb was selected because it provides a realistic business problem involving pricing, property characteristics, location, reviews, and accommodation capacity.

Italy was selected because its major tourist destinations provide an interesting basis for comparing Airbnb markets.

The project was also intentionally different from earlier projects that relied on Kaggle datasets and classification problems. This project uses an externally collected dataset and focuses on regression, giving the project a broader technical scope.

Cities Covered

City

Included

Rome

Yes

Florence

Yes

Venice

Yes

Naples

Yes

Milan

No

Milan was initially planned for the project, but its Inside Airbnb dataset could not be loaded successfully during data collection. Naples was therefore used as the fourth city instead.

Data Source

The project uses Inside Airbnb listing datasets.

The data was collected separately for each city and then combined into one dataset. The same selected columns were used across all cities so that the datasets could be concatenated consistently.

Selected variables

Column

Description

Main use

id

Listing identifier

Listing reference

latitude

Geographic latitude

Geographic analysis

longitude

Geographic longitude

Geographic analysis

property_type

Type of property

Analysis / ML

room_type

Type of room/accommodation

Analysis / ML

accommodates

Number of guests accommodated

Analysis / ML

bedrooms

Number of bedrooms

Analysis / ML

bathrooms

Number of bathrooms

Analysis / ML

price

Listing price

Target variable

price_quote_price_per_night

Price per night from quote data

Supporting price field

minimum_nights

Minimum stay requirement

Analysis / ML

number_of_reviews

Number of reviews

Analysis / ML

review_scores_rating

Review rating

Analysis / ML

city

Added city identifier

Comparison / ML

Dataset Construction

The individual city datasets contained:

Rome: 37,084 rows

Florence: 13,472 rows

Venice: 8,766 rows

Naples: 11,575 rows

The combined dataset contained:

70,897 rows × 14 columns

A city column was added to each city dataset before concatenation so that city-level comparisons could be performed after combining the data.

Data Cleaning

The raw combined dataset contained missing values in several important columns.

Initial missing-value counts included:

bathrooms: 11,004

bedrooms: 12,877

price: 5,050

price_quote_price_per_night: 5,051

minimum_nights: 22

review_scores_rating: 9,020

The price field also required conversion from currency-formatted strings such as $117.13 into numerical values.

Price conversion

The price field was cleaned by:

Converting the column to string.

Removing the $ symbol.

Removing commas.

Converting the result to floating-point numbers.

Comparing Missing-Value Strategies

Rather than immediately choosing one missing-value strategy, the project compared two approaches.

Approach 1: Probability-based imputation

For selected columns such as:

bathrooms

bedrooms

review_scores_rating

the observed value distribution was calculated and missing values were filled by sampling according to the observed probabilities.

This approach retained substantially more rows.

Approach 2: Dropping incomplete rows

The second approach removed rows containing missing values using dropna().

This produced a complete dataset of:

44,946 rows × 14 columns

The two approaches were compared because the goal was not simply to maximize dataset size. The project examined whether retaining more records through imputation would actually result in better downstream modeling and analysis.

The final deployed model was trained using the dropped-data workflow.

Machine Learning

Problem Type

The project treats Airbnb nightly price prediction as a supervised regression problem.

Target

price

Input Features

Numerical features

accommodates
bathrooms
bedrooms
minimum_nights
number_of_reviews
review_scores_rating

Categorical features

property_type
room_type
city

id, latitude, and longitude were retained in the dataset for analysis and geographic visualization, but they were not used as prediction inputs.

Preprocessing

Categorical variables were converted into numerical representations using OneHotEncoder.

A ColumnTransformer was used to apply categorical preprocessing while passing the numerical variables through unchanged.

The preprocessing and model were combined into a scikit-learn Pipeline.

This approach also helped keep preprocessing consistent between model training and the Streamlit application.

Models Compared

Three regression algorithms were tested:

Random Forest Regressor

Linear Regression

Gradient Boosting Regressor

The same overall preprocessing and train/test methodology was used when comparing the models.

The dataset was divided using:

test_size = 0.23
random_state = 42

Model results on the dropped-data workflow

Model

MAE

RMSE

R²

Random Forest

95.03

292.62

-0.083

Linear Regression

86.97

256.46

0.168

Gradient Boosting

83.46

268.37

0.089

Final model

Gradient Boosting Regressor was selected for the Streamlit application.

The decision was influenced by the practical behavior of the predictions. Linear Regression was initially explored, but negative price predictions were observed, which are not meaningful for a nightly accommodation price. Gradient Boosting was therefore selected as the final deployed model.

The final Gradient Boosting configuration included:

n_estimators = 200
learning_rate = 0.05
max_depth = 3
random_state = 42

Model Evaluation

The project uses:

Mean Absolute Error (MAE)

Measures the average absolute difference between actual and predicted prices.

Root Mean Squared Error (RMSE)

Penalizes larger prediction errors more heavily than MAE.

R² Score

Measures how much variation in the target is explained by the model.

The final Gradient Boosting model achieved:

MAE: 83.46

RMSE: 268.37

R²: 0.089

The relatively low R² indicates that the selected features explain only a limited portion of the variation in Airbnb prices. This is an important limitation of the current model rather than something hidden from the project results.

SQL Analysis

MySQL was used to analyze the cleaned Airbnb dataset.

The SQL portion intentionally focuses on beginner-level queries. This was a deliberate learning decision because SQL was a new skill during the project, and the goal was to build enough practical SQL knowledge to confidently explain every query and result.

The analysis includes questions such as:

What is the average listing price in each city?

What is the average price for each room type in each city?

Which are the 10 highest-rated listings with more than 20 reviews?

How are listings distributed across different price ranges?

What are the 10 cheapest listings?

What are the 10 most expensive listings?

How does average price vary with accommodation capacity?

Which listings have a review rating greater than 4.8?

Which listings have received more than 50 reviews?

How many listings exist for each property type?

Example insight

One of the notable findings was that Venice had the highest average listing price among the four cities analyzed.

The SQL queries and their result screenshots are documented separately in the project SQL PDF.

Power BI Dashboard

Power BI was used to transform the analytical results into an interactive dashboard for users who do not need to read Python or SQL code.

The dashboard contains three main pages:

1. Overview

Provides a high-level view of the Airbnb dataset and key market information.

2. Geographic Analysis

Visualizes the geographic distribution of listings using latitude and longitude.

This is the page that focuses most strongly on the geographical aspect of the project.

3. Price & Market Analysis

Explores relationships between Airbnb prices and listing characteristics such as city, room type, property characteristics, and other market variables.

Interactivity

Slicers and interactive visuals allow non-technical users to explore the dataset without writing queries or code.

Streamlit Application

The final machine-learning model was converted into an interactive Streamlit application.

The application allows a user to enter:

Property information

City

Room type

Property type

Listing information

Accommodates

Bedrooms

Bathrooms

Minimum nights

Number of reviews

Review score rating

After clicking Predict Price, the application returns an estimated nightly price in euros.

The application loads the serialized trained model and uses the same preprocessing pipeline that was used during model development.

Deployment Challenge

One of the biggest practical challenges was deployment.

The application worked correctly in the local VS Code environment, but the deployed Streamlit website initially produced errors.

This highlighted an important difference between:

running a machine-learning application locally, and

preparing all dependencies and serialized model components correctly for a deployed environment.

The project therefore also provided practical experience with model serialization and deployment troubleshooting.

Project Workflow

Inside Airbnb Data
        ↓
Collect City-wise Data
        ↓
Select Common Columns
        ↓
Add City Identifier
        ↓
Combine Datasets
        ↓
Data Cleaning
        ↓
Missing-Value Analysis
        ↓
Compare Imputation vs Dropping
        ↓
Final Clean Dataset
        ↓
 ┌───────────────┬────────────────┬─────────────────┐
 ↓               ↓                ↓
SQL Analysis   ML Modeling    Power BI Dashboard
 ↓               ↓                ↓
SQL PDF       Model Compare   Interactive Reports
                 ↓
          Gradient Boosting
                 ↓
             model.pkl
                 ↓
           Streamlit App

Technologies Used

Technology

Purpose

Python

Data science workflow

Pandas

Data loading and manipulation

NumPy

Numerical operations

Scikit-learn

Preprocessing, pipelines and regression

MySQL

SQL-based analysis

Power BI

Interactive visualization

Streamlit

ML application

Pickle

Model serialization

Jupyter Notebook

Development and experimentation

VS Code

Development environment

Repository Structure

A recommended repository structure is:

Italy-Airbnb-Data-Analytics-and-Price-Prediction-System/
│
├── README.md
│
├── notebooks/
│   ├── cleaned_data.ipynb
│   └── dropped_data.ipynb
│
├── sql/
│   ├── Italy_Airbnb_Analysis_Project.sql
│   └── Italy_Airbnb_SQL_Analysis.pdf
│
├── powerbi/
│   └── Airbnb_Italy_Analysis_Dashboard.pbix
│
├── streamlit/
│   └── streamlitapp.py
│
├── models/
│   ├── model.pkl
│   └── column_transformer.pkl
│
├── data/
│   └── italy_airbnb_dropped.csv
│
└── requirements.txt

Large raw datasets and model files can be handled separately if repository-size limits become an issue.

How to Run the Streamlit Application

Install the required Python libraries:

pip install pandas numpy scikit-learn streamlit

Make sure the Streamlit script and trained model are available in the expected locations.

Run:

streamlit run streamlitapp.py

The application will open in a browser.

Key Results

Dataset

4 Italian cities

70,897 original combined listings

44,946 complete listings in the dropped-data workflow

14 dataset columns

Analytics

City-level price comparison

Room-type price comparison

Price-range distribution

Rating analysis

Review analysis

Accommodation-capacity analysis

Property-type analysis

Geographic distribution

Machine Learning

Three regression models were compared.

Gradient Boosting was selected for deployment.

Final deployed-model evaluation:

MAE  = 83.46
RMSE = 268.37
R²   = 0.089

Visualization

Three-page Power BI dashboard:

Overview

Geographic Analysis

Price & Market Analysis

Application

Interactive Streamlit nightly-price estimator.

Limitations

The current project has several limitations:

The model uses a limited set of listing attributes.

Important price-driving factors such as exact neighborhood, amenities, availability, seasonality, demand, host characteristics, and booking history are not included in the model.

The R² score of the deployed model is relatively low, so predictions should be treated as rough estimates rather than exact market prices.

The dataset represents specific Inside Airbnb collection periods and therefore does not represent every future market condition.

Dropping incomplete rows improves consistency but reduces the amount of available data.

Probability-based imputation retains more data but can introduce artificial values.

The current Streamlit application is intended as an estimation tool rather than a production pricing system.

Future Improvements

Potential improvements include:

Add neighborhood-level information

Include amenities

Include availability and occupancy-related features

Add seasonal or time-based variables

Perform stronger outlier treatment

Test additional regression algorithms

Perform hyperparameter tuning

Use cross-validation

Experiment with target transformations such as log-price

Improve feature engineering

Compare additional missing-value strategies

Improve deployment reliability

Add prediction intervals or confidence ranges

Add more Italian cities

Add a live data-refresh workflow

What I Learned

The project strengthened my existing skills in data cleaning, preprocessing, machine learning and visualization while introducing me to a new area: SQL.

SQL was particularly valuable because it required learning how to approach the same dataset from a database perspective rather than only through Python.

The project also helped demonstrate how different technologies can work together in one data-science workflow:

Python → SQL → Power BI → Machine Learning → Streamlit

The most important learning outcome was not simply building a model, but learning how to connect multiple tools into one complete project.

Skills Demonstrated

Real-world data collection

Data cleaning

Missing-value analysis

Data preprocessing

Feature selection

Categorical encoding

Regression modeling

Model comparison

Model evaluation

SQL

MySQL

Data visualization

Power BI

Streamlit

Model serialization

Application deployment

End-to-end data science workflow

Project Status

Completed as an individual data science project.

The project is designed to demonstrate practical data-science skills through a complete workflow rather than presenting only a standalone machine-learning model.
