CREATE DATABASE italy_airbnb_project;


USE italy_airbnb_project;

SELECT DATABASE();


CREATE TABLE airbnb_listings (
    id BIGINT,
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    property_type VARCHAR(100),
    room_type VARCHAR(50),
    accommodates INT,
    bathrooms DECIMAL(4,1),
    bedrooms DECIMAL(4,1),
    price DECIMAL(10,2),
    price_quote_price_per_night DECIMAL(10,2),
    minimum_nights DECIMAL(6,1),
    number_of_reviews INT,
    review_scores_rating DECIMAL(3,2),
    city VARCHAR(50)
);

SELECT COUNT(*) AS total_listings
FROM airbnb_listings;


SELECT DISTINCT city
FROM airbnb_listings;


-- Question 1 What is the average listing price in each city?

SELECT
    city,
    AVG(price) AS average_price
FROM airbnb_listings
GROUP BY city
ORDER BY average_price DESC;


-- Question 2 What is the average listing price for each room type in each city?

SELECT
    city,
    room_type,
    AVG(price) AS average_price
FROM airbnb_listings
GROUP BY city, room_type
ORDER BY city, average_price DESC;


-- Question 3 Find the 10 highest-rated Airbnb listings that have more than 20 reviews.


SELECT
    id,
    city,
    property_type,
    room_type,
    price,
    number_of_reviews,
    review_scores_rating
FROM airbnb_listings
WHERE number_of_reviews > 20
ORDER BY review_scores_rating DESC
LIMIT 10;


-- Question 4 How are the Airbnb listings distributed across different price ranges?


SELECT
    CASE
        WHEN price < 50 THEN 'Under 50'
        WHEN price >= 50 AND price < 100 THEN '50 - 99'
        WHEN price >= 100 AND price < 200 THEN '100 - 199'
        WHEN price >= 200 AND price < 500 THEN '200 - 499'
        ELSE '500+'
    END AS price_bucket,
    COUNT(*) AS number_of_listings
FROM airbnb_listings
GROUP BY price_bucket
ORDER BY number_of_listings DESC;


-- Question 5 What are the 10 cheapest Airbnb listings in the dataset?


SELECT
    id,
    city,
    room_type,
    price
FROM airbnb_listings
ORDER BY price ASC
LIMIT 10;


-- Question 6 What are the 10 most expensive Airbnb listings in the dataset?


SELECT
    id,
    city,
    room_type,
    price
FROM airbnb_listings
ORDER BY price DESC
LIMIT 10;


-- Question 7 What is the average Airbnb price based on the number of guests the property can accommodate?


SELECT
    accommodates,
    AVG(price) AS average_price
FROM airbnb_listings
GROUP BY accommodates
ORDER BY accommodates ASC;


-- Question 8 Which Airbnb listings have a review rating greater than 4.8?


SELECT
    id,
    city,
    room_type,
    price,
    review_scores_rating
FROM airbnb_listings
WHERE review_scores_rating > 4.8
ORDER BY review_scores_rating DESC;


-- Question 9 Which Airbnb listings have received more than 50 reviews?


SELECT
    id,
    city,
    room_type,
    price,
    number_of_reviews
FROM airbnb_listings
WHERE number_of_reviews > 50
ORDER BY number_of_reviews DESC;


-- Question 10 How many Airbnb listings are there for each property type?


SELECT
    property_type,
    COUNT(*) AS number_of_listings
FROM airbnb_listings
GROUP BY property_type
ORDER BY number_of_listings DESC;