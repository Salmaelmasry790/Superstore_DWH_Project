 USE Superstore_DWH

 CREATE TABLE Dim_Customer (
    Customer_SK INT IDENTITY(1,1) PRIMARY KEY,
    Customer_BK NVARCHAR(50) NOT NULL,  
    Customer_Name NVARCHAR(50) NOT NULL,
    Segment NVARCHAR(50) NOT NULL,
    Region NVARCHAR(50) NOT NULL,
    State NVARCHAR(50) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    Postal_Code INT NOT NULL
);

CREATE TABLE Dim_Product (
    Product_SK INT IDENTITY(1,1) PRIMARY KEY,
    Product_BK NVARCHAR(50) NOT NULL,   
    Category NVARCHAR(50) NOT NULL,
    Sub_Category NVARCHAR(50) NOT NULL,
    Product_Name NVARCHAR(150) NOT NULL
);


CREATE TABLE Dim_Shipmode (
    Shipmode_SK INT IDENTITY(1,1) PRIMARY KEY,
    Shipmode_BK NVARCHAR(50) NOT NULL, 
    Shipmode NVARCHAR(50) NOT NULL
);

CREATE TABLE Dim_Date (
    Date_SK INT IDENTITY(1,1) PRIMARY KEY,
    Full_Date DATE NOT NULL,
    Year INT NOT NULL,
    Month INT NOT NULL,
	Day INT NOT NULL,
	DayOfWeek NVARCHAR(20) NOT NULL,
    Quarter INT NOT NULL
);


CREATE TABLE Fact_Sales (
    Sales_SK INT IDENTITY(1,1) PRIMARY KEY,
    Order_ID NVARCHAR(50) NOT NULL,   -- Degenerate Dimension
    Customer_SK INT NOT NULL FOREIGN KEY REFERENCES Dim_Customer(Customer_SK),
    Product_SK INT NOT NULL FOREIGN KEY REFERENCES Dim_Product(Product_SK),
    Shipmode_SK INT NOT NULL FOREIGN KEY REFERENCES Dim_Shipmode(Shipmode_SK),
	Order_Date_SK INT NOT NULL FOREIGN KEY REFERENCES Dim_Date(Date_SK),
    Ship_Date_SK INT NOT NULL FOREIGN KEY REFERENCES Dim_Date(Date_SK),
    Sales FLOAT NOT NULL,
    Quantity TINYINT NOT NULL,
    Discount FLOAT NOT NULL,
    Profit FLOAT NULL
);

