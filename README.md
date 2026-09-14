

<h1>🇮🇹 Italy Airbnb Data Analytics and Price Prediction System</h1>

  
An End-to-End Data Science Project using Real-World Airbnb Data

Python • SQL • Machine Learning • Power BI • Streamlit

<h2>📌 Project Overview</h2>
The Italy Airbnb Data Analytics and Price Prediction System is an individual end-to-end Data Science project built using real Airbnb listing data collected from Inside Airbnb.

The project combines data collection, data cleaning, SQL analysis, machine learning, Power BI visualization, and Streamlit deployment into one complete workflow.

The project was created with three main goals:

🎓 Complete my college internal Data Science project.

💼 Build a strong portfolio project for my resume and internship applications.

🧠 Demonstrate how I can combine multiple Data Science skills to solve a real-world problem.

Unlike my previous projects, which mainly used Kaggle datasets and classification problems, this project uses an external real-world data source and focuses on regression.


<h2>🎯 Project Objectives</h2>

Collect real-world Airbnb data from an external source.

Collect the same features from multiple Italian cities.

Combine the city-level datasets into one dataset.

Clean and preprocess the raw data.

Compare different missing-value handling approaches.

Perform data analysis using Python and SQL.

Compare multiple regression models.

Evaluate models using MAE, RMSE and R².

Build an interactive Power BI dashboard.

Make the analytical results understandable to non-coders.

Deploy a machine-learning prediction model using Streamlit.

Demonstrate the ability to learn and integrate SQL into a Data Science workflow.



<h2>🌍 Why Airbnb and Italy?</h2>

I chose Airbnb and Italy because the topic allowed me to demonstrate several different skills in one project.

<h3>Why Airbnb?</h3>

It is a real-world dataset.

Airbnb pricing provides a practical regression problem.

The dataset contains both numerical and categorical features.

It supports geographical analysis.

It can be analyzed using Python, SQL and Power BI.

The final model can be converted into an interactive application.

<h3>Why Italy?</h3>

Italy has several major tourist destinations with different Airbnb markets, making it suitable for city-level comparison.

The project therefore combines:

Real-world data + geographical analysis + SQL + machine learning + visualization + deployment




<h2>🏙️ Cities Included</h2>

<h3>City</h3>


🇮🇹 Rome

✅ Included

🇮🇹 Florence

✅ Included

🇮🇹 Venice

✅ Included

🇮🇹 Naples

✅ Included

🇮🇹 Milan

❌ Excluded

<h3>Why was Milan excluded?</h3>

Milan was originally planned as one of the cities.

However, its Inside Airbnb dataset could not be loaded successfully during data collection. Instead of stopping the project, I replaced Milan with Naples.

This also became part of the real-world data collection experience: external datasets do not always behave as expected.




<h2>📊 Data Collection</h2>

The data was collected from Inside Airbnb, rather than using a ready-made Kaggle dataset.

For every city, the same set of columns was selected so that the datasets could be combined consistently.


<h3>Dataset Size</h3>



Rome  : 37,084

Florence : 13,472

Venice : 8,766

Naples : 11,575

<h3>Total</h3>

70,897

Original Dataset

70,897 rows × 14 columns



<h2>🧹 Data Cleaning</h2>
The raw Airbnb datasets contained missing values in several important columns.

Missing Values

Column      | Missing Values

bedrooms    | 12,877

bathrooms   |11,004

review_scores_rating   | 9,020

price   | 5,050  

price_quote_price_per_night   | 5,051

minimum_nights   | 22


The datasets also required conversion of currency-formatted price values into numerical values.

<h3>💰 Price Cleaning</h3>

Values such as:

$117.13
$1,250.00

were converted into numerical values by:

Remove $   ---> Remove commas   ---> Convert to numeric



<h2>🔬 Missing-Value Handling</h2>

One of the important parts of this project was comparing two different approaches to missing values.

<h3>Approach 1 — Probability-Based Imputation</h3>
Missing values in selected columns such as:

bathrooms

bedrooms

review_scores_rating

were filled using probability-based sampling from the available values.

<h4>Advantage</h4>

✅ Retained significantly more rows.

<h4>Disadvantage</h4>

⚠️ Introduced estimated values instead of original observations.

<h3>Approach 2 — Dropping Missing Rows</h3>
The second approach removed rows containing missing values using:

dropna()

This produced:

44,946 complete listings

Why compare both?

I did not want to assume that a larger dataset automatically meant a better model.

I therefore compared the two approaches and observed that the effect of imputation on model performance was more important than simply retaining more rows.

For analysis and visualization, the complete-case dataset also provided cleaner observations.

The final Streamlit model was trained using the dropped-data workflow.


<h2>🤔 Why Compare Both?</h2>
The purpose was to determine whether keeping more rows through imputation actually produced better downstream results.

The comparison showed that data quality and the effect of imputation mattered more than simply having a larger dataset.

The final Streamlit model was trained using the dropped-data workflow.





<h2>🧪 Models Compared</h2>
Three regression models were tested:

Model	Purpose

📉 Linear Regression	Simple baseline

🌲 Random Forest Regressor	Tree-based ensemble

🚀 Gradient Boosting Regressor	Boosting-based model

The same overall evaluation approach was used to compare the models and investigate the effect of the two missing-value strategies.


<h2>Results — Dropped-Data Workflow</h2>
<br>
|Model                 |	  MAE ↓	  |      RMSE ↓|      R² ↑ |
<br>
|🌲 Random Forest	     |  95.03	    |   292.62	 |   -0.083  |
<br>
|📉 Linear Regression	 |  86.97     |  	256.46	 |   0.168   |
<br>
|🚀 Gradient Boosting	 |  83.46     |	  268.37	 |   0.089   |
<br>
Lower MAE and RMSE are better. Higher R² is better.


<h2>🏆 Final Model</h2>

The final model used in the Streamlit application is:

Gradient Boosting Regressor

Configuration:

n_estimators = 200

learning_rate = 0.05

max_depth = 3

random_state = 42

<h3>Why Gradient Boosting?</h3>

Linear Regression was initially explored, but it produced negative price predictions during experimentation.

Since a negative Airbnb nightly price is not meaningful, Gradient Boosting was selected as the practical model for the final application.

The final serialized model was saved as:

model.pkl








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
City	Status
🇮🇹 Rome	✅ Included
🇮🇹 Florence	✅ Included
🇮🇹 Venice	✅ Included
🇮🇹 Naples	✅ Included
🇮🇹 Milan	❌ Not included
Why not Milan?

Milan was originally planned for the project, but its Inside Airbnb dataset could not be loaded successfully. I therefore used Naples as the fourth city.

📊 Dataset
Data Source
The data was collected from Inside Airbnb rather than downloaded from Kaggle.

Each city's dataset was collected separately using the same selected columns so that the datasets could be combined consistently.

Dataset Size
City	Listings
Rome	37,084
Florence	13,472
Venice	8,766
Naples	11,575
Combined	70,897
Original combined dataset: 70,897 rows × 14 columns

🧾 Dataset Features
Feature	Description	Used For
id	Listing identifier	Reference
latitude	Geographic latitude	Mapping
longitude	Geographic longitude	Mapping
property_type	Type of property	Analysis + ML
room_type	Type of room	Analysis + ML
accommodates	Number of guests	Analysis + ML
bedrooms	Number of bedrooms	Analysis + ML
bathrooms	Number of bathrooms	Analysis + ML
price	Nightly listing price	Target
price_quote_price_per_night	Quoted nightly price	Analysis
minimum_nights	Minimum stay	Analysis + ML
number_of_reviews	Number of reviews	Analysis + ML
review_scores_rating	Listing rating	Analysis + ML
city	City identifier	Analysis + ML
📍 Why Keep Latitude & Longitude?
latitude and longitude were retained even though they were not used as model inputs.

They were important for the Power BI Geographic Analysis page, allowing the project to visually demonstrate the geographical coverage of the collected listings.

🧹 Data Cleaning
The raw dataset contained missing values in several important columns.

Initial Missing Values
Column	Missing Values
bedrooms	12,877
bathrooms	11,004
review_scores_rating	9,020
price	5,050
price_quote_price_per_night	5,051
minimum_nights	22
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

Model	Purpose
Linear Regression	Simple baseline
Random Forest Regressor	Tree-based ensemble
Gradient Boosting Regressor	Boosting-based model
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
Model	MAE	RMSE	R²
Random Forest	95.03	292.62	-0.083
Linear Regression	86.97	256.46	0.168
Gradient Boosting	83.46	268.37	0.089
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

<h2>🗄️ SQL Analysis</h2>
MySQL was used to analyze the cleaned Airbnb dataset.

SQL was a new skill for me, so I intentionally kept the questions at a beginner level.

The goal was to make sure I could confidently explain every query and result if asked during my college evaluation.

<h3>Questions Covered</h3>
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

<h3>💡 Interesting Finding</h3>
One of the most interesting results was:

Venice had the highest average listing price among the four analyzed cities.

A separate PDF contains the SQL queries together with their result screenshots.
