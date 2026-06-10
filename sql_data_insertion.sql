CREATE DATABASE food_delivery_db;
USE food_delivery_db;
CREATE TABLE food_delivery (
    Order_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Customer_Age INT,
    Customer_Gender VARCHAR(20),
    City VARCHAR(50),
    Area VARCHAR(100),
    Restaurant_ID VARCHAR(20),
    Restaurant_Name VARCHAR(100),
    Cuisine_Type VARCHAR(50),
    Order_Date DATE,
    Delivery_Time_Min FLOAT,
    Distance_km FLOAT,
    Order_Value FLOAT,
    Discount_Applied FLOAT,
    Final_Amount FLOAT,
    Payment_Mode VARCHAR(20),
    Order_Status VARCHAR(20),
    Cancellation_Reason VARCHAR(100),
    Delivery_Partner_ID VARCHAR(20),
    Delivery_Rating FLOAT,
    Restaurant_Rating FLOAT,
    Order_Day VARCHAR(20),
    Peak_Hour VARCHAR(10),
    Profit_Margin FLOAT,
    Age_Group VARCHAR(30)
);
SELECT COUNT(*) FROM food_delivery;