# Cleaned Dataset Description

## Project

Brazilian E-Commerce Analytics (Olist Dataset)

## Data Source

The project uses the public Brazilian Olist E-Commerce dataset from Kaggle.

## ETL Process

The raw datasets were imported into Alteryx where the following preprocessing tasks were performed:

- Removed duplicate records
- Removed invalid records
- Handled missing values
- Converted fields to appropriate data types
- Standardized date formats
- Joined multiple source datasets
- Translated Portuguese product category names into English
- Created calculated fields
- Exported the final dataset into SQL Server

## SQL Server Database

Database Name

OlistECommerce

## Staging Table

OlistStaging

The staging table contains the fully joined dataset produced from the Alteryx ETL workflow before dimensional modeling.

## Data Warehouse Tables

- FactOrderItems
- DimCustomer
- DimDate
- DimOrder
- DimPayment
- DimProduct
- DimSeller
