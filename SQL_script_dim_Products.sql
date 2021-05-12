-- Cleansed DIM_Product Table 
-- 1) Changed column names
-- 2) Converted NULL values into some string
SELECT 
  p.[ProductKey], 
  p.[ProductAlternateKey] AS ProductItemCode, 
  p.[EnglishProductName] AS [Product Name], 
  ISNULL (ps.EnglishProductSubcategoryName,'Unknown') AS [Sub Category], -- Joined in from Sub Category Table -- Replaces NULL values to 'Unknown'
  ISNULL(pc.EnglishProductCategoryName,'Unknown') AS [Product Category], -- Joined in from Category Table
  p.[Color] AS [Product Color], 
  ISNULL(p.[ListPrice],'0') AS Price,
  ISNULL(p.[Size],'Unknown') AS [Product Size], 
  ISNULL(p.[ProductLine],'Unknown') AS [Product Line], 
  ISNULL(p.[ModelName],'Unknown') AS [Product Model Name], 
  --p.[EnglishDescription] AS [Product Description], 
  COALESCE(p.[EnglishDescription],p.[ModelName],'Unknown') AS [Product Description], -- Replaces a string with another string
  ISNULL (p.Status, 'Outdated') AS [Product Status] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] as p
  LEFT JOIN dbo.DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN dbo.DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey 
order by 
  p.ProductKey asc