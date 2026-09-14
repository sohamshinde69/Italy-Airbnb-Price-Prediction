🇮🇹 Italy Airbnb Data Analytics and Price Prediction System

An end-to-end Data Science project combining real-world data collection, data cleaning, SQL analysis, machine learning, Power BI, and Streamlit.

📌 Project Overview

The Italy Airbnb Data Analytics and Price Prediction System is an individual end-to-end Data Science project built using real Airbnb listing data from Rome, Florence, Venice, and Naples.

The project was created with two goals:

🎓 Fulfil a college internal project requirement.

💼 Build a portfolio project that demonstrates a broad range of Data Science skills for internship opportunities.

Unlike my earlier projects, which mainly used Kaggle datasets and classification problems, this project uses an external real-world data source and focuses on regression.

🔄 Complete Workflow

Inside Airbnb
      ↓
Data Collection
      ↓
Data Cleaning & Preprocessing
      ↓
Missing-Value Strategy Comparison
      ↓
Exploratory Analysis
      ↓
SQL Analysis ──────────────┐
      ↓                    │
Machine Learning           │
      ↓                    │
Model Comparison           │
      ↓                    │
Gradient Boosting          │
      ↓                    │
Streamlit App              │
                           │
Power BI Dashboard ←───────┘

🎯 Objectives

Collect real-world Airbnb data from an external source.

Combine data from multiple Italian cities using a consistent schema.

Clean and preprocess the raw data.

Compare different missing-value handling strategies.

Analyze Airbnb pricing patterns using Python and SQL.

Compare multiple regression models.

Evaluate models using MAE, RMSE, and R².

Build an interactive Power BI dashboard for non-technical users.

Deploy the final model through a Streamlit application.

Demonstrate the ability to learn and integrate a new technology — SQL — into a Data Science workflow.

🌍 Why Airbnb and Italy?

I chose Airbnb and Italy for several reasons:

Airbnb provides a real-world business problem involving pricing.

The dataset contains both numerical and categorical variables.

Italy has several major tourist destinations that can be compared.

Latitude and longitude make geographical analysis possible.

The topic works well with SQL, Machine Learning, Power BI, and Streamlit.

It provides a practical regression problem, unlike my previous classification projects.

Using an external source instead of Kaggle makes the project more representative of a real-world Data Science workflow.

🏙️ Cities Included

City

Status

🇮🇹 Rome

✅ Included

🇮🇹 Florence

✅ Included

🇮🇹 Venice

✅ Included

🇮🇹 Naples

✅ Included

🇮🇹 Milan

❌ Not included

Why not Milan?

Milan was originally planned for the project, but its Inside Airbnb dataset could not be loaded successfully. I therefore used Naples as the fourth city.

📊 Dataset

Data Source

The data was collected from Inside Airbnb rather than downloaded from Kaggle.

Each city's dataset was collected separately using the same selected columns so that the datasets could be combined consistently.

Dataset Size

City

Listings

Rome

37,084

Florence

13,472

Venice

8,766

Naples

11,575

Combined

70,897

Original combined dataset: 70,897 rows × 14 columns

🧾 Dataset Features

Feature

Description

Used For

id

Listing identifier

Reference

latitude

Geographic latitude

Mapping

longitude

Geographic longitude

Mapping

property_type

Type of property

Analysis + ML

room_type

Type of room

Analysis + ML

accommodates

Number of guests

Analysis + ML

bedrooms

Number of bedrooms

Analysis + ML

bathrooms

Number of bathrooms

Analysis + ML

price

Nightly listing price

Target

price_quote_price_per_night

Quoted nightly price

Analysis

minimum_nights

Minimum stay

Analysis + ML

number_of_reviews

Number of reviews

Analysis + ML

review_scores_rating

Listing rating

Analysis + ML

city

City identifier

Analysis + ML

📍 Why Keep Latitude & Longitude?

latitude and longitude were retained even though they were not used as model inputs.

They were important for the Power BI Geographic Analysis page, allowing the project to visually demonstrate the geographical coverage of the collected listings.

🧹 Data Cleaning

The raw dataset contained missing values in several important columns.

Initial Missing Values

Column

Missing Values

bedrooms

12,877

bathrooms

11,004

review_scores_rating

9,020

price

5,050

price_quote_price_per_night

5,051

minimum_nights

22

The price column also contained currency-formatted values such as $117.13, which needed to be converted into numerical values.

💰 Price Cleaning

The price field was cleaned by:

Converting values to strings.

Removing $.

Removing commas.

Converting the result to numerical values.

🔬 Missing-Value Strategy Comparison

Instead of immediately choosing one method, I experimented with two approaches.

Approach 1 — Probability-Based Imputation

For selected columns such as:

bathrooms

bedrooms

review_scores_rating

missing values were filled by sampling from the observed value distribution.

Advantage

Retained substantially more records.

Disadvantage

Introduced estimated/artificial values.

Approach 2 — Dropping Incomplete Rows

Rows containing missing values were removed using dropna().

This produced:

44,946 complete listings

Why Compare Both?

The purpose was to determine whether keeping more rows through imputation actually produced better downstream results.

The comparison showed that data quality and the effect of imputation mattered more than simply having a larger dataset.

The final Streamlit model was trained using the dropped-data workflow.

🤖 Machine Learning

Problem Type

Supervised Regression

🎯 Target Variable

price

Input Features

Numerical

accommodates
bathrooms
bedrooms
minimum_nights
number_of_reviews
review_scores_rating

Categorical

property_type
room_type
city

id, latitude, and longitude were retained for analysis but were not used as prediction inputs.

⚙️ Preprocessing

The project uses:

OneHotEncoder

ColumnTransformer

Pipeline

Categorical variables were converted into numerical representations using OneHotEncoder.

A ColumnTransformer was used to apply categorical preprocessing while leaving numerical features unchanged.

The preprocessing and model were combined into a scikit-learn Pipeline so that the same transformation process could be used when making predictions in Streamlit.

🧪 Models Compared

Three regression models were tested:

Model

Purpose

Linear Regression

Simple baseline

Random Forest Regressor

Tree-based ensemble

Gradient Boosting Regressor

Boosting-based model

The same overall approach was used to compare the models and to investigate the effect of the two missing-value strategies.

📈 Model Evaluation

The models were evaluated using:

MAE — Mean Absolute Error

Average absolute difference between actual and predicted prices.

RMSE — Root Mean Squared Error

Penalizes larger prediction errors more strongly.

R² — R-squared

Measures how much variation in price is explained by the model.

Results — Dropped-Data Workflow

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

🏆 Final Model

The final model used in the Streamlit application is:

Gradient Boosting Regressor

Configuration:

n_estimators = 200
learning_rate = 0.05
max_depth = 3
random_state = 42

Why Gradient Boosting?

Linear Regression was initially explored, but it produced negative price predictions during experimentation.

Since a negative Airbnb nightly price is not meaningful, Gradient Boosting was selected as the practical model for the final application.

The final serialized model was saved as:

model.pkl

⚠️ Interpreting the Model

The final Gradient Boosting model achieved approximately:

MAE  = 83.46
RMSE = 268.37
R²   = 0.089

The relatively low R² indicates that the selected features explain only a limited portion of Airbnb price variation.

Therefore, the application should be viewed as a rough price-estimation tool, not an exact pricing engine.

Possible missing price-driving factors include:

Neighborhood

Amenities

Seasonality

Demand

Availability

Host characteristics

Other market factors

This limitation is intentionally documented rather than hidden.

🗄️ SQL Analysis

MySQL was used to analyze the cleaned Airbnb dataset.

SQL was a new skill for me, so I intentionally kept the questions at a beginner level.

The goal was to make sure I could confidently explain every query and result if asked during my college evaluation.

Questions Covered

What is the average listing price in each city?

What is the average price for each room type in each city?

What are the 10 highest-rated listings with more than 20 reviews?

How are listings distributed across different price ranges?

What are the 10 cheapest listings?

What are the 10 most expensive listings?

How does average price vary with accommodation capacity?

Which listings have a review rating greater than 4.8?

Which listings have received more than 50 reviews?

How many listings exist for each property type?

💡 Interesting Finding

One of the most interesting results was:

Venice had the highest average listing price among the four analyzed cities.

A separate PDF contains the SQL queries together with their result screenshots.

📊 Power BI Dashboard

Power BI was used to transform the analytical results into an interactive dashboard for non-coders.

Dashboard Pages

1️⃣ Overview

Provides a high-level summary of the Airbnb dataset and market.

2️⃣ Geographic Analysis ⭐

Shows the geographical distribution of Airbnb listings using latitude and longitude.

This is my preferred dashboard page because it demonstrates the geographical scope of the project visually.

3️⃣ Price & Market Analysis

Explores relationships between price and listing characteristics such as:

City

Room type

Property type

Accommodation capacity

Other market characteristics

🎛️ Interactive Analysis

Slicers and interactive visuals allow users to explore the data without writing Python or SQL.

The purpose was to make the analytical results understandable to non-technical users.

🌐 Streamlit Application

The final machine-learning model was integrated into a Streamlit application.

The application is designed for:

Anyone who wants a rough Airbnb price estimate, particularly travelers and users interested in Airbnb pricing.

User Inputs

Property Information

City

Room type

Property type

Listing Information

Accommodates

Bedrooms

Bathrooms

Minimum nights

Number of reviews

Review score rating

The application then returns an:

💶 Estimated nightly price

🚀 Deployment Challenge

One of the biggest practical challenges occurred during deployment.

The Streamlit application worked correctly in VS Code locally, but the deployed Streamlit website initially produced errors.

This highlighted an important difference between:

Local Development
        ≠
Cloud Deployment

It provided practical experience with:

Model serialization

File paths

Dependencies

Deployment environments

Troubleshooting

🏗️ Project Architecture

                   ┌──────────────────────┐
                   │    Inside Airbnb     │
                   └──────────┬───────────┘
                              │
                              ▼
                   ┌──────────────────────┐
                   │   Data Collection    │
                   └──────────┬───────────┘
                              │
                              ▼
                   ┌──────────────────────┐
                   │ Data Cleaning & EDA  │
                   └──────────┬───────────┘
                              │
                              ▼
                 ┌──────────────────────────┐
                 │ Missing-Value Comparison │
                 └────────────┬─────────────┘
                              │
                              ▼
                     ┌─────────────────┐
                     │ Cleaned Dataset │
                     └───────┬─────────┘
                             │
             ┌───────────────┼────────────────┐
             ▼               ▼                ▼
       ┌──────────┐   ┌────────────┐   ┌────────────┐
       │   SQL    │   │    ML      │   │  Power BI  │
       │ Analysis │   │  Modeling  │   │  Dashboard │
       └──────────┘   └─────┬──────┘   └────────────┘
                            │
                            ▼
                    ┌─────────────────┐
                    │ Model Selection │
                    └────────┬────────┘
                             │
                             ▼
                  ┌─────────────────────┐
                  │ Gradient Boosting   │
                  └──────────┬──────────┘
                             │
                             ▼
                       ┌──────────┐
                       │ model.pkl│
                       └────┬─────┘
                            │
                            ▼
                    ┌───────────────┐
                    │   Streamlit   │
                    │   Prediction  │
                    │      App      │
                    └───────────────┘

🛠️ Technologies Used

Technology

Purpose

🐍 Python

Data Science workflow

🐼 Pandas

Data manipulation

🔢 NumPy

Numerical operations

🤖 Scikit-learn

ML + preprocessing

🗄️ MySQL

SQL analysis

📊 Power BI

Interactive dashboards

🌐 Streamlit

ML application

💾 Pickle

Model serialization

📓 Jupyter Notebook

Development

💻 VS Code

Development environment

📁 Recommended Repository Structure

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

▶️ Running the Streamlit App

Install the required libraries:

pip install pandas numpy scikit-learn streamlit

Then run:

streamlit run streamlitapp.py

The application will open in your browser.

📌 Key Results

Dataset

4 Italian cities

70,897 original listings

44,946 complete listings in the dropped-data workflow

14 columns

Machine Learning

3 regression models compared

Gradient Boosting selected for the application

MAE: 83.46

RMSE: 268.37

R²: 0.089

SQL

10 beginner-level analytical questions

City, room type, price, ratings, reviews, capacity and property-type analysis

Venice identified as having the highest average price

Power BI

Overview

Geographic Analysis

Price & Market Analysis

Application

Interactive Streamlit price estimator

User-friendly interface for non-coders

⚠️ Limitations

The model uses a limited number of listing characteristics.

Neighborhood-level information is not included.

Amenities are not included.

Seasonality and demand are not modeled.

Host-level information is not included.

The dataset represents specific data-collection periods.

Dropping incomplete rows reduces the available dataset.

Probability-based imputation can introduce artificial values.

The final model has a relatively low R².

Predictions should be treated as rough estimates rather than exact market prices.

🔮 Future Improvements

Possible improvements include:

🗺️ Add neighborhood-level features

🛋️ Add amenities

📅 Add seasonal and time-based features

📈 Include availability and demand information

🔍 Improve outlier treatment

⚙️ Perform hyperparameter tuning

🔁 Use cross-validation

🤖 Test additional regression algorithms

📐 Experiment with log-price transformation

🧠 Improve feature engineering

🇮🇹 Add more Italian cities

🔄 Automate future data collection

📊 Add prediction intervals

🚀 Improve deployment reliability

🎓 What I Learned

This project strengthened my existing skills in:

Data cleaning

Data preprocessing

Machine learning

Model evaluation

Data visualization

The biggest new skill I developed was SQL.

Learning SQL showed me that the same dataset can be approached from different perspectives — through Python for Data Science, SQL for structured analysis, and Power BI for communication and visualization.

The project also taught me how different tools can be connected into a single workflow:

Python → SQL → Machine Learning → Power BI → Streamlit

💡 Biggest Takeaway

The main achievement of this project is not simply the final prediction model.

I built the project to demonstrate how I can use and connect the different Data Science skills I have learned to solve a real-world problem.

It combines:

Data Collection + Data Cleaning + SQL + Machine Learning + Visualization + Application Development

into one complete project.
