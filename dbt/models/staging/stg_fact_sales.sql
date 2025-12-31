{{ config(materialized='view', tags=['staging']) }}

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
FROM {{ source('stagging', 'Stg_Fact_Sales') }}
WHERE SaleOrderID IS NOT NULL
  AND ProductID IS NOT NULL
  AND OrderDate IS NOT NULL