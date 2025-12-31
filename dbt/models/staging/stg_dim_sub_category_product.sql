{{ config(materialized='view', tags=['staging']) }}

SELECT
    CaProductID,
    SubCatProductID,
    TRIM(SubCatProductName) AS SubCatProductName
FROM {{ source('stagging', 'Stg_Dim_Sub_Category_Product') }}
WHERE SubCatProductID IS NOT NULL