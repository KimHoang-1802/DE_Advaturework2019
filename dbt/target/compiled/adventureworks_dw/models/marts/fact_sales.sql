

with __dbt__cte__int_sales_cleaned as (


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
FROM "AdventureWorks2019"."stagging_stagging"."stg_fact_sales"
) SELECT
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
FROM __dbt__cte__int_sales_cleaned