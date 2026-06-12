USE OlistECommerceDW;
GO

/* =========================================================
   Query 1: Monthly Sales Trend
   Business Question: How does sales performance change over time?
========================================================= */
SELECT
    d.[Year],
    d.[Month],
    d.MonthName,
    SUM(f.Price) AS TotalSales,
    COUNT(DISTINCT f.OrderID) AS TotalOrders,
    SUM(f.Price) / COUNT(DISTINCT f.OrderID) AS AverageOrderValue
FROM dbo.FactOrderItems f
JOIN dbo.DimDate d
    ON f.DateID = d.DateID
GROUP BY
    d.[Year],
    d.[Month],
    d.MonthName
ORDER BY
    d.[Year],
    d.[Month];


/* =========================================================
   Query 2: Top 10 Product Categories by Revenue
   Business Question: Which product categories generate the most sales?
========================================================= */
SELECT TOP 10
    p.ProductCategoryNameEnglish,
    SUM(f.Price) AS TotalSales,
    COUNT(DISTINCT f.OrderID) AS TotalOrders,
    COUNT(*) AS TotalItemsSold
FROM dbo.FactOrderItems f
JOIN dbo.DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY
    p.ProductCategoryNameEnglish
ORDER BY
    TotalSales DESC;


/* =========================================================
   Query 3: Top 10 Sellers by Revenue
   Business Question: Which sellers generate the highest revenue?
========================================================= */
SELECT TOP 10
    s.SellerID,
    s.SellerCity,
    s.SellerState,
    SUM(f.Price) AS TotalSales,
    COUNT(DISTINCT f.OrderID) AS TotalOrders
FROM dbo.FactOrderItems f
JOIN dbo.DimSeller s
    ON f.SellerID = s.SellerID
GROUP BY
    s.SellerID,
    s.SellerCity,
    s.SellerState
ORDER BY
    TotalSales DESC;


/* =========================================================
   Query 4: Customer Distribution by State
   Business Question: Which states have the most customers?
========================================================= */
SELECT
    c.CustomerState,
    COUNT(DISTINCT c.CustomerID) AS CustomerCount,
    SUM(f.Price) AS TotalSales
FROM dbo.FactOrderItems f
JOIN dbo.DimCustomer c
    ON f.CustomerID = c.CustomerID
GROUP BY
    c.CustomerState
ORDER BY
    CustomerCount DESC;


/* =========================================================
   Query 5: Payment Method Analysis
   Business Question: Which payment methods are most commonly used?
========================================================= */
SELECT
    p.PaymentType,
    COUNT(*) AS PaymentCount,
    SUM(f.PaymentValue) AS TotalPaymentValue,
    AVG(f.PaymentInstallments) AS AvgInstallments
FROM dbo.FactOrderItems f
JOIN dbo.DimPayment p
    ON f.PaymentID = p.PaymentID
GROUP BY
    p.PaymentType
ORDER BY
    PaymentCount DESC;


/* =========================================================
   Query 6: Delivery Performance by Customer State
   Business Question: Which states experience longer delivery times?
========================================================= */
SELECT
    c.CustomerState,
    AVG(CAST(f.DeliveryDays AS FLOAT)) AS AvgDeliveryDays,
    MIN(f.DeliveryDays) AS FastestDeliveryDays,
    MAX(f.DeliveryDays) AS LongestDeliveryDays,
    COUNT(DISTINCT f.OrderID) AS TotalOrders
FROM dbo.FactOrderItems f
JOIN dbo.DimCustomer c
    ON f.CustomerID = c.CustomerID
WHERE f.DeliveryDays IS NOT NULL
GROUP BY
    c.CustomerState
ORDER BY
    AvgDeliveryDays DESC;


/* =========================================================
   Query 7: Freight Cost by Product Category
   Business Question: Which product categories have the highest freight cost?
========================================================= */
SELECT TOP 10
    p.ProductCategoryNameEnglish,
    SUM(f.FreightValue) AS TotalFreight,
    AVG(f.FreightValue) AS AvgFreight,
    SUM(f.Price) AS TotalSales
FROM dbo.FactOrderItems f
JOIN dbo.DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY
    p.ProductCategoryNameEnglish
ORDER BY
    TotalFreight DESC;
