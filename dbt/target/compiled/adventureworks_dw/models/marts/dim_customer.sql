

with __dbt__cte__int_customer_cleaned as (


SELECT * FROM "AdventureWorks2019"."stagging_stagging"."stg_dim_customer"
) SELECT
    CustomerID,
    CustomerName,
    StoreID,
    TerritoryID,
    TerritoryName,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM __dbt__cte__int_customer_cleaned