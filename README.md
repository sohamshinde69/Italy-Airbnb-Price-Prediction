

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
