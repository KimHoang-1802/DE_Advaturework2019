{{
    config(
        materialized='table',
        schema='dw',
        alias='DIM_Category_Product',
        tags=['marts', 'dimension']
    )
}}

SELECT
    CaProductID AS CategoryProductID,
    CategoryProductName,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM {{ ref('int_category_cleaned') }}
