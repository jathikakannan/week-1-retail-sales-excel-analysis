USE ClientSiteDB;
GO
SELECT TOP 10 *
FROM dbo.ClientSite;
USE ClientSiteDB;
GO

SELECT COUNT(*) AS TotalRows
FROM dbo.ClientSite;

SELECT TOP 1 *
FROM dbo.ClientSite;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'ClientSite';


SELECT COUNT(*) AS Total_Rows
FROM dbo.ClientSite;


SELECT COUNT(DISTINCT User_ID) AS Total_Users
FROM dbo.ClientSite;



SELECT COUNT(DISTINCT Session_ID) AS Total_Sessions
FROM dbo.ClientSite;


SELECT DISTINCT Event
FROM dbo.ClientSite;



SELECT
    Event,
    COUNT(*) AS Total_Events
FROM dbo.ClientSite
GROUP BY Event
ORDER BY Total_Events DESC;



SELECT
    Event,
    COUNT(DISTINCT User_ID) AS Total_Users
FROM dbo.ClientSite
GROUP BY Event
ORDER BY Total_Users DESC;







USE ClientSiteDB;
GO

SELECT TOP (5)
    User_ID,
    Session_ID,
    Event,
    Revenue
FROM dbo.ClientSite;





SELECT DISTINCT Event
FROM dbo.ClientSite
ORDER BY Event;



SELECT
    COUNT(DISTINCT CASE WHEN Event = 'Browse' THEN User_ID END) AS Browse_Users,
    COUNT(DISTINCT CASE WHEN Event = 'Purchase' THEN User_ID END) AS Purchase_Users
FROM dbo.ClientSite;



SELECT
    COUNT(DISTINCT CASE WHEN Event = 'Browse' THEN User_ID END) AS Browse_Users,
    COUNT(DISTINCT CASE WHEN Event = 'Purchase' THEN User_ID END) AS Purchase_Users,
    ROUND(
        COUNT(DISTINCT CASE WHEN Event = 'Purchase' THEN User_ID END) * 100.0 /
        COUNT(DISTINCT CASE WHEN Event = 'Browse' THEN User_ID END),
        2
    ) AS Conversion_Rate_Percentage
FROM dbo.ClientSite;




SELECT TOP 5
    User_ID,
    SUM(Revenue) AS Total_Revenue
FROM dbo.ClientSite
GROUP BY User_ID
ORDER BY Total_Revenue DESC;



SELECT TOP 1
    Channel,
    SUM(Revenue) AS Total_Revenue
FROM dbo.ClientSite
GROUP BY Channel
ORDER BY Total_Revenue DESC;


SELECT TOP 1
    Region,
    SUM(Revenue) AS Total_Revenue
FROM dbo.ClientSite
GROUP BY Region
ORDER BY Total_Revenue DESC;



SELECT
    Device,
    SUM(Revenue) AS Total_Revenue
FROM dbo.ClientSite
GROUP BY Device
ORDER BY Total_Revenue DESC;


SELECT
    Event,
    COUNT(DISTINCT User_ID) AS Users
FROM dbo.ClientSite
GROUP BY Event
ORDER BY
CASE Event
    WHEN 'Browse' THEN 1
    WHEN 'Add to Cart' THEN 2
    WHEN 'Checkout' THEN 3
    WHEN 'Purchase' THEN 4
END;