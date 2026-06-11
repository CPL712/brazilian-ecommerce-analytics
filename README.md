# Brazilian E-Commerce Analytics (Olist Dataset)

## Overview

This project analyzes the Brazilian Olist E-Commerce dataset to uncover business insights related to customer behavior, sales performance, seller effectiveness, and product trends.

The project demonstrates an end-to-end analytics workflow including:

- Data Cleaning & Validation
- ETL Development
- SQL Analytics
- KPI Reporting
- Power BI Dashboard Development
- Business Insight Generation

---

## Business Problem

E-commerce businesses generate large volumes of transactional data but often lack visibility into customer behavior, sales performance, and operational efficiency.

This project aims to transform raw transactional data into actionable insights that support data-driven business decisions.

---

## Objectives

- Clean and validate raw datasets
- Build an analytics-ready data model
- Analyze customer purchasing patterns
- Evaluate seller and product performance
- Develop business KPIs
- Create interactive dashboards for stakeholders

---

## Dataset

Source:
Brazilian Olist E-Commerce Dataset

Tables used:

- Customers
- Orders
- Order Items
- Payments
- Reviews
- Products
- Sellers
- Geolocation

---

## Data Cleaning & ETL

### Data Validation

- Duplicate detection
- Missing value analysis
- Referential integrity checks
- Data type validation

### Data Transformation

- Table joins
- Feature engineering
- KPI calculations
- Date dimension creation

### Output

A cleaned and structured dataset suitable for analytics and reporting.

---

## SQL Analysis

Example business questions:

- Which product categories generate the most revenue?
- Who are the top-performing sellers?
- What are the monthly sales trends?
- How frequently do customers make purchases?
- Which regions generate the highest sales?

Example SQL Query:

```sql
SELECT
    YEAR(order_purchase_timestamp) AS Year,
    MONTH(order_purchase_timestamp) AS Month,
    SUM(payment_value) AS Revenue
FROM orders o
JOIN order_payments p
    ON o.order_id = p.order_id
GROUP BY
    YEAR(order_purchase_timestamp),
    MONTH(order_purchase_timestamp)
ORDER BY
    Year, Month;
```
## Star Schema / ERD

![Star Schema ERD](images/star_schema_erd.png)

The cleaned Olist dataset was loaded into SQL Server and transformed into a star schema model. The model contains a central FactOrderItems table connected to dimension tables for customers, sellers, products, orders, payments, and dates. The staging table was used only during the ETL process and was removed from the final ERD.
