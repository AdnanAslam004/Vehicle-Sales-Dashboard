-- Vehicle Sales Analytics Dashboard
-- Tools: SQL Server and Grafana
-- Table: dbo.VehicleSales_Clean

-- 1. Total Vehicles Sold
SELECT COUNT(*) AS TotalVehiclesSold
FROM dbo.VehicleSales_Clean;

-- 2. Total Revenue
SELECT SUM(CAST(sellingprice AS BIGINT)) AS TotalRevenue
FROM dbo.VehicleSales_Clean;

-- 3. Average Selling Price
SELECT ROUND(AVG(CAST(sellingprice AS DECIMAL(18,2))), 2) AS AverageSellingPrice
FROM dbo.VehicleSales_Clean;

-- 4. Top 10 Brands by Revenue
SELECT TOP 10
    make,
    SUM(sellingprice) AS Revenue
FROM dbo.VehicleSales_Clean
GROUP BY make
ORDER BY Revenue DESC;

-- 5. Top 10 Models by Sales
SELECT TOP 10
    model,
    COUNT(*) AS VehiclesSold
FROM dbo.VehicleSales_Clean
GROUP BY model
ORDER BY VehiclesSold DESC;

-- 6. Sales by State
SELECT TOP 10
    state,
    COUNT(*) AS VehiclesSold
FROM dbo.VehicleSales_Clean
GROUP BY state
ORDER BY VehiclesSold DESC;

-- 7. Body Type Distribution
SELECT TOP 10
    body,
    COUNT(*) AS TotalVehicles
FROM dbo.VehicleSales_Clean
GROUP BY body
ORDER BY TotalVehicles DESC;

-- 8. Automatic vs Manual Vehicles
SELECT
    transmission,
    COUNT(*) AS TotalVehicles
FROM dbo.VehicleSales_Clean
WHERE transmission IN ('automatic', 'manual')
GROUP BY transmission
ORDER BY TotalVehicles DESC;

-- 9. Average Selling Price by Brand
SELECT TOP 10
    make,
    ROUND(AVG(CAST(sellingprice AS DECIMAL(18,2))), 2) AS AvgSellingPrice
FROM dbo.VehicleSales_Clean
GROUP BY make
ORDER BY AvgSellingPrice DESC;

-- 10. Vehicle Condition vs Average Selling Price
SELECT
    CAST(condition AS VARCHAR(20)) AS VehicleCondition,
    AVG(CAST(sellingprice AS DECIMAL(18,2))) AS AvgSellingPrice
FROM dbo.VehicleSales_Clean
WHERE condition IS NOT NULL
GROUP BY condition
ORDER BY condition;

-- 11. Top 10 States by Revenue
SELECT TOP 10
    UPPER(state) AS state,
    SUM(sellingprice) AS StateRevenue
FROM dbo.VehicleSales_Clean
WHERE state IS NOT NULL
GROUP BY state
ORDER BY StateRevenue DESC;

-- 12. Top 10 States by Average Selling Price
SELECT TOP 10
    UPPER(state) AS state,
    AVG(sellingprice) AS AvgSellingPrice
FROM dbo.VehicleSales_Clean
WHERE state IS NOT NULL
GROUP BY UPPER(state)
ORDER BY AvgSellingPrice DESC;

-- 13. Revenue by Manufacturing Year
SELECT
    year,
    SUM(sellingprice) AS TotalRevenue
FROM dbo.VehicleSales_Clean
GROUP BY year
ORDER BY year;

-- 14. Vehicles Sold by Manufacturing Year
SELECT
    year,
    COUNT(*) AS TotalVehiclesSold
FROM dbo.VehicleSales_Clean
WHERE year IS NOT NULL
GROUP BY year
ORDER BY year;

-- 15. Average Vehicle Condition by Brand
SELECT TOP 10
    make,
    AVG(condition) AS AvgCondition
FROM dbo.VehicleSales_Clean
WHERE make IS NOT NULL
GROUP BY make
ORDER BY AvgCondition DESC;

-- 16. Average Odometer Reading by Brand
SELECT TOP 10
    make,
    AVG(CAST(odometer AS BIGINT)) AS AvgOdometer
FROM dbo.VehicleSales_Clean
WHERE make IS NOT NULL
GROUP BY make
ORDER BY AvgOdometer DESC;

-- 17. Top 10 Models by Average Selling Price
SELECT TOP 10
    model,
    AVG(sellingprice) AS AvgSellingPrice
FROM dbo.VehicleSales_Clean
WHERE model IS NOT NULL
GROUP BY model
ORDER BY AvgSellingPrice DESC;
