-- Query 1 :Top Spending Customers
SELECT Customer_ID,
       SUM(Final_Amount) AS Total_Spent
FROM food_delivery
GROUP BY Customer_ID
ORDER BY Total_Spent DESC
LIMIT 10;

-- Query 2: Revenue by Age Group
SELECT Age_Group,
       SUM(Final_Amount) AS Total_Revenue,
       COUNT(*) AS Total_Orders
FROM food_delivery
GROUP BY Age_Group;

-- Query 3: Weekend vs Weekday
SELECT Order_Day,
       COUNT(*) AS Total_Orders,
       SUM(Final_Amount) AS Total_Revenue
FROM food_delivery
GROUP BY Order_Day;

-- Query 4: Revenue by City
SELECT City,
       SUM(Final_Amount) AS Total_Revenue
FROM food_delivery
GROUP BY City
ORDER BY Total_Revenue DESC;

-- Query 5: Revenue by Cuisine
SELECT Cuisine_Type,
       COUNT(*) AS Total_Orders,
       SUM(Final_Amount) AS Total_Revenue
FROM food_delivery
GROUP BY Cuisine_Type
ORDER BY Total_Revenue DESC;

-- Query 6: Payment Mode Analysis
SELECT Payment_Mode,
       COUNT(*) AS Total_Orders,
       SUM(Final_Amount) AS Total_Revenue
FROM food_delivery
GROUP BY Payment_Mode
ORDER BY Total_Revenue DESC;

-- Query 7: Monthly Revenue
SELECT MONTH(Order_Date) AS Month_No,
       SUM(Final_Amount) AS Revenue
FROM food_delivery
GROUP BY MONTH(Order_Date)
ORDER BY Month_No;

-- Query 8: Peak Hour Analysis
SELECT Peak_Hour,
       COUNT(*) AS Total_Orders,
       SUM(Final_Amount) AS Revenue
FROM food_delivery
GROUP BY Peak_Hour
ORDER BY Revenue DESC;

-- Query 9: Cancellation Reasons
SELECT Cancellation_Reason,
       COUNT(*) AS Total_Cancellations
FROM food_delivery
WHERE Order_Status='Cancelled'
GROUP BY Cancellation_Reason;

-- Query 10: Top Rated Restaurants
SELECT Restaurant_Name,
       AVG(Restaurant_Rating) AS Avg_Rating
FROM food_delivery
GROUP BY Restaurant_Name
ORDER BY Avg_Rating DESC
LIMIT 10;

-- Query 11: Cancellation Rate by Restaurant
SELECT
    Restaurant_Name,
    SUM(CASE WHEN Order_Status = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled_Orders,
    SUM(CASE WHEN Order_Status = 'Delivered' THEN 1 ELSE 0 END) AS Delivered_Orders,
    ROUND(
        SUM(CASE WHEN Order_Status = 'Cancelled' THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*),
        2
    ) AS Cancellation_Rate
FROM food_delivery
GROUP BY Restaurant_Name
HAVING COUNT(*) >= 100
ORDER BY Cancellation_Rate DESC
LIMIT 10;

-- Query 12: Cuisine-wise Performance
SELECT
    Cuisine_Type,
    COUNT(*) AS Total_Orders,
    SUM(Final_Amount) AS Total_Revenue,
    ROUND(AVG(Restaurant_Rating),2) AS Avg_Rating,
    ROUND(AVG(Profit_Margin),3) AS Avg_Profit_Margin
FROM food_delivery
GROUP BY Cuisine_Type
ORDER BY Total_Revenue DESC;

-- Query 13: Peak Hour Demand Analysis
SELECT
    Peak_Hour,
    COUNT(*) AS Total_Orders,
    SUM(Final_Amount) AS Total_Revenue,
    ROUND(AVG(Delivery_Time_Min),2) AS Avg_Delivery_Time
FROM food_delivery
GROUP BY Peak_Hour;

-- Query 14: Payment Mode Preference Analysis
SELECT
    Payment_Mode,
    COUNT(*) AS Total_Orders,
    SUM(Final_Amount) AS Total_Revenue,
    ROUND(AVG(Final_Amount),2) AS Avg_Order_Value
FROM food_delivery
GROUP BY Payment_Mode
ORDER BY Total_Revenue DESC;

-- Query 15: Cancellation Reason Analysis
SELECT
    Cancellation_Reason,
    COUNT(*) AS Total_Cancellations
FROM food_delivery
WHERE Cancellation_Reason IS NOT NULL
GROUP BY Cancellation_Reason
ORDER BY Total_Cancellations DESC;