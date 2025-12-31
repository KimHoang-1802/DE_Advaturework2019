{{
    config(
        materialized='table',
        schema='dw',
        alias='DIM_SubCategory_Product',
        tags=['marts', 'dimension']
    )
}}

SELECT
    SubCatProductID AS SubCategoryProductID,
    CaProductID as CategoryProductID,
    SubCatProductName AS SubCategoryProductName,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM {{ ref('int_subcategory_cleaned') }}