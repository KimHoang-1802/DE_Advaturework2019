

SELECT
    CustomerID,
    TRIM(CustomerName) AS CustomerName,
    StoreID,
    TerritoryID,
    TRIM(TerritoryName) AS TerritoryName
FROM "AdventureWorks2019"."stagging"."Stg_Dim_Customer"
WHERE CustomerID IS NOT NULL