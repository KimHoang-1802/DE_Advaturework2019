{{ config(materialized='view', tags=['staging']) }}

SELECT
    ProductID,
    TRIM(ProductName) AS ProductName,
    TRIM(ProductNumber) AS ProductNumber,
    Color,  
    Size,   
    Style,  
    SubCatProductID,
    MakeFlag
FROM {{ source('stagging', 'Stg_Dim_Product') }}
WHERE ProductID IS NOT NULL