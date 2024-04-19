{{
  config(
    materialized = "table",
    schema="TEAMA"
  )
}}
SELECT CustomerID,
FirstName,
LastName,
Company
FROM (
SELECT CustomerID, FirstName, LastName, Company,
ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY CustomerID) AS rn
FROM customers
) AS sub
WHERE rn = 1
