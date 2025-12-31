{{ config(materialized='ephemeral', tags=['intermediate']) }}

SELECT
    SaleOrderID,
    ProductID,
    OrderQuantity,
    UnitPrice,
    LineTotal,
    OrderDate,
    ShipDate,
    CASE Status
        WHEN 1 THEN 'In Process'
        WHEN 2 THEN 'Approved'
        WHEN 3 THEN 'Backordered'
        WHEN 4 THEN 'Rejected'
        WHEN 5 THEN 'Shipped'
        WHEN 6 THEN 'Cancelled'
        ELSE 'In Process'
    END AS Status,  -- Converted to text
    CustomerID,
    SalePersonID,
    TerritoryID,
    StoreID,
    TotalDue
FROM {{ ref('stg_fact_sales') }}