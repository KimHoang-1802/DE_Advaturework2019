

SELECT
    SaleOrderID,
    ProductID,
    OrderQuantity,
    UnitPrice,
    LineTotal,
    OrderDate,
    ShipDate,
    Status,  
    CustomerID,
    SalePersonID,
    TerritoryID,
    StoreID,
    TotalDue
FROM "AdventureWorks2019"."stagging"."Stg_Fact_Sales"
WHERE SaleOrderID IS NOT NULL
  AND ProductID IS NOT NULL
  AND OrderDate IS NOT NULL