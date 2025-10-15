# Superstore_DWH_Project
A Data Warehouse project built using SQL Server based on the Superstore dataset.


Project Overview:

This project demonstrates the design and implementation of a Data Warehouse using Microsoft SQL Server.

The data is based on the popular Superstore dataset, and the warehouse follows a Star Schema model to support analytical queries and business intelligence reporting.


Star Schema Design:

The schema consists of one Fact Table and four Dimension Tables


Dimension Tables:

Dim_Customer → Contains customer details such as name, region, segment, state, city and postal code.

Dim_Product → Stores product-related attributes (category, sub-category, and product name).

Dim_Shipmode → Includes different shipping modes used in orders.

Dim_Date → Holds all date-related attributes (full_date, day, month, year, quarter, day of week).


Fact Table:

Fact_Sales → Contains all sales transactions and foreign keys referencing the dimensions.

It includes measures like Sales, Quantity, Discount, and Profit.


ETL Process:

Data was extracted from the SuperstoreDB, transformed to match the warehouse schema, and then loaded into the Superstore_DWH database using T-SQL scripts.


The ETL process includes:

Creating the dimension tables.

Loading unique data from the source system.

Creating the fact table and loading data using joins between dimensions and the source.


Technologies Used:

Superstore Dataset

Microsoft SQL Server

T-SQL

Draw.io (for schema design visualization)

Power BI


