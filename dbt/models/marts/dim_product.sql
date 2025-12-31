{{
    config(
        materialized='table',
        schema='dw',
        alias='DIM_Product',
        tags=['marts', 'dimension']
    )
}}

SELECT
    ProductID,
    ProductName,
    ProductNumber,
    Color,  -- Already cleaned to '0' if NULL
    Size,   -- Already cleaned to '0' if NULL
    Style,  -- Already cleaned to '0' if NULL
    SubCatProductID AS SubCategoryProductID,
    MakeFlag,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM {{ ref('int_product_cleaned') }}