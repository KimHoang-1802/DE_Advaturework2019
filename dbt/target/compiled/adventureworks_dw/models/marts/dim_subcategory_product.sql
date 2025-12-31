

with __dbt__cte__int_subcategory_cleaned as (


SELECT * FROM "AdventureWorks2019"."stagging_stagging"."stg_dim_sub_category_product"
) SELECT
    SubCatProductID AS SubCategoryProductID,
    CaProductID as CategoryProductID,
    SubCatProductName AS SubCategoryProductName,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM __dbt__cte__int_subcategory_cleaned