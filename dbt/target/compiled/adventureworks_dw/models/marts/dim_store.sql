

with __dbt__cte__int_store_cleaned as (


SELECT * FROM "AdventureWorks2019"."stagging_stagging"."stg_dim_store"
) SELECT
    StoreId AS StoreID,
    StoreName,
    TerritoryID,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM __dbt__cte__int_store_cleaned