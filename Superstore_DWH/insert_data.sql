USE Superstore_DWH

INSERT INTO 
Dim_Customer (Customer_BK, Customer_Name, Segment, Region, State, City, Postal_Code)
SELECT DISTINCT 
Customer_ID, Customer_Name, Segment, Country, Region, State, City, Postal_Code
FROM SuperstoreDB.dbo.Superstore_Sales;


INSERT INTO Dim_Product (Product_BK, Category, Sub_Category, Product_Name)
SELECT DISTINCT Product_ID, Category, Sub_Category, Product_Name
FROM SuperstoreDB.dbo.Superstore_Sales;


INSERT INTO Dim_Shipmode (Shipmode_BK, Shipmode)
SELECT DISTINCT Ship_Mode, Ship_Mode
FROM SuperstoreDB.dbo.Superstore_Sales;


INSERT INTO Dim_Date (Full_Date, Year, Month, Day, DayOfWeek, Quarter)
SELECT DISTINCT
    d.Full_Date,
    YEAR(d.Full_Date),
    MONTH(d.Full_Date),
    DAY(d.Full_Date),
    DATENAME(WEEKDAY, d.Full_Date),
    DATEPART(QUARTER, d.Full_Date)
FROM (
    SELECT Order_Date AS Full_Date FROM SuperstoreDB.dbo.Superstore_Sales
    UNION
    SELECT Ship_Date FROM SuperstoreDB.dbo.Superstore_Sales
) d
WHERE d.Full_Date IS NOT NULL;



 INSERT INTO Fact_Sales (Order_ID, Customer_SK, Product_SK, Shipmode_SK, Order_Date_SK, Ship_Date_SK, Sales, Quantity, Discount, Profit
)
SELECT s.Order_ID, c.Customer_SK, p.Product_SK, sm.Shipmode_SK, od.Date_SK AS Order_Date_SK, sd.Date_SK AS Ship_Date_SK, s.Sales,s.Quantity, s.Discount, s.Profit
FROM SuperstoreDB.dbo.Superstore_Sales s
JOIN Dim_Customer c 
	ON s.Customer_ID = c.Customer_BK
JOIN Dim_Product p 
    ON s.Product_ID = p.Product_BK
JOIN Dim_Shipmode sm 
    ON s.Ship_Mode = sm.Shipmode_BK
JOIN Dim_Date od 
    ON s.Order_Date = od.Full_Date
JOIN Dim_Date sd 
    ON s.Ship_Date = sd.Full_Date;