-- Cleansed DIM_Customers Table --
USE [AdventureWorksDW2019]
GO

SELECT 
  c.customerkey AS CustomerKey,
  c.firstname AS [First Name], 
  c.lastname AS [Last Name], 
 -- c.firstname + ' ' + lastname AS [Full Name], -- It will give NULL if any of the value is missing
  CONCAT(c.FirstName, ' ' , c.lastname)  AS [Full Name], -- CONCAT function is more useful in this case as it will ignore the NULL values
  -- Combined First and Last Name
  CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,
  YearlyIncome,
  c.datefirstpurchase AS DateFirstPurchase, 
  g.city AS [Customer City] -- Joined in Customer City from Geography Table
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] as c
  LEFT JOIN dbo.dimgeography AS g ON g.geographykey = c.geographykey 
ORDER BY 
  CustomerKey ASC -- Ordered List by CustomerKey