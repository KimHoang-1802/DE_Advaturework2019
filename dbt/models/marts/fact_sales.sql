{{
    config(
        materialized='incremental',
        unique_key='SalesOrderID',
        schema='dw',
        alias='FACT_Sales',
        tags=['marts', 'fact'],
        on_schema_change='append_new_columns'
    )
}}

SELECT
    SaleOrderID AS SalesOrderID,
    ProductID,
    OrderQuantity,
    UnitPrice,
    LineTotal,
    OrderDate,
    ShipDate,
    -- Status is now text from intermediate layer
    CASE Status
        WHEN 'In Process' THEN 1
        WHEN 'Approved' THEN 2
        WHEN 'Backordered' THEN 3
        WHEN 'Rejected' THEN 4
        WHEN 'Shipped' THEN 5
        WHEN 'Cancelled' THEN 6
        ELSE 1
    END AS Status,  -- Convert back to number for DW table (or keep as text if you want)
    CustomerID,
    SalePersonID AS SalesPersonID,
    TerritoryID,
    StoreID,
    TotalDue,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM {{ ref('int_sales_cleaned') }}


