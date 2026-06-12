# 🇧🇷 Brazilian E-Commerce Analytics (Olist Dataset)

An end-to-end Business Intelligence and Data Warehousing project built using the Brazilian Olist E-Commerce Dataset. This project demonstrates a complete BI pipeline, from data preprocessing and ETL to dimensional modeling, SSAS Tabular semantic modeling, SQL business analysis, and interactive Power BI dashboards.

---

## Project Overview

This project transforms raw Brazilian e-commerce transactional data into a business-ready data warehouse for analytical reporting and decision-making.

The workflow includes:

- Data cleaning and preprocessing using Alteryx
- SQL Server dimensional data warehouse design
- Star schema implementation
- SSAS Tabular semantic model development
- SQL business analysis
- Power BI dashboard creation

---

## Technology Stack

| Tool | Purpose |
|------|---------|
| Alteryx | ETL, Data Cleaning, Data Integration |
| SQL Server | Data Warehouse |
| SSMS | Database Design & SQL Analysis |
| SSAS Tabular | Semantic Model & Measures |
| Power BI | Dashboard & Visualization |
| GitHub | Project Documentation |

---

# Project Architecture

```
Kaggle Olist Dataset
        │
        ▼
Alteryx ETL Workflow
        │
        ▼
SQL Server Data Warehouse
(OlistECommerceDW)
        │
        ├── Staging Table
        │      └── olist_joint_data_cleaned
        │
        ▼
Star Schema
        │
        ├── DimCustomer
        ├── DimDate
        ├── DimOrder
        ├── DimPayment
        ├── DimProduct
        ├── DimSeller
        └── FactOrderItems
        │
        ▼
SSAS Tabular Model
        │
        ▼
Power BI Dashboard
```

---

# ETL Process

The ETL workflow was developed in **Alteryx**.

Main preprocessing tasks included:

- Removing invalid records
- Handling missing values
- Removing duplicates
- Data type conversion
- Joining multiple Olist datasets
- Product category translation (Portuguese → English)
- Data validation
- Exporting the cleaned dataset into SQL Server

### ETL Workflow

![ETL Workflow](images/etl_workflow.png)

---

# SQL Server Data Warehouse

Database:

```
OlistECommerceDW
```

Warehouse design follows the **Kimball Star Schema** methodology.

### Fact Table

- FactOrderItems

### Dimension Tables

- DimCustomer
- DimDate
- DimOrder
- DimPayment
- DimProduct
- DimSeller

### Star Schema

![Star Schema](images/star_schema_erd.png)

---

# SSAS Tabular Model

The semantic layer was implemented using SQL Server Analysis Services (SSAS) Tabular.

Implemented features include:

- Imported warehouse tables
- Relationship management
- Business measures using DAX
- Hidden surrogate keys for cleaner reporting
- Aggregated business metrics

### DAX Measures

- Total Sales
- Total Freight
- Total Payment Value
- Total Orders
- Total Order Items
- Average Delivery Days
- Average Order Value

### SSAS Model

![SSAS Model](images/ssas_model.png)

---

# SQL Business Analysis

Business questions answered include:

- Sales performance
- Product category ranking
- Top performing sellers
- Customer distribution
- Payment method analysis

SQL scripts are available in:

```
sql/analysis_queries.sql
```

---

# Power BI Dashboard

Interactive dashboards include:

- Sales Overview
- Product Performance
- Customer Analysis
- Seller Analysis
- Payment Insights

Power BI file:

```
powerbi/Brazilian_Ecommerce.pbix
```

---

# Repository Structure

```
Brazilian-E-Commerce-Analytics
│
├── data/
│   └── cleaned_data_description.md
│
├── sql/
│   ├── schema.sql
│   └── analysis_queries.sql
│
├── ssas/
│   ├── Model.bim
│   ├── OlistECommerce_SSAS.smproj
│   └── OlistECommerce_SSAS.sln
│
├── powerbi/
│   └── Brazilian_Ecommerce.pbix
│
├── images/
│   ├── etl_workflow.png
│   ├── sql_server_tables.png
│   ├── star_schema_erd.png
│   └── ssas_model.png
│
└── README.md
```

---

# Future Improvements

- Incremental ETL pipeline
- Automated SQL Agent jobs
- Azure SQL Database deployment
- Azure Analysis Services / Power BI Service
- Sales forecasting using machine learning

---

# Author

Cheung Pang Li

LinkedIn:
*(your LinkedIn URL)*

GitHub:
*(your GitHub profile)*
