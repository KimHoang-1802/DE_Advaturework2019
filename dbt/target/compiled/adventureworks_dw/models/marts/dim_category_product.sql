

with __dbt__cte__int_category_cleaned as (


SELECT * FROM "AdventureWorks2019"."stagging_stagging"."stg_dim_cat_product"
) SELECT
    CaProductID AS CategoryProductID,
    CategoryProductName,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM __dbt__cte__int_category_cleaned