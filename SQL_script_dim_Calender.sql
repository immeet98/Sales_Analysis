

-- Cleansed DIM_Date Table --
SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date,  
  [EnglishDayNameOfWeek] AS Day, 
  -- Get only the first three letters from the column
  LEFT([EnglishDayNameOfWeek],3) AS ShortDay,
  [EnglishMonthName] AS Month, 
  Left([EnglishMonthName], 3) AS MonthShort,   
  [MonthNumberOfYear] AS MonthNo, 
  [CalendarQuarter] AS Quarter, 
  [CalendarYear] AS Year 
FROM 
 [AdventureWorksDW2019].[dbo].[DimDate]
WHERE 
  CalendarYear >= 2019