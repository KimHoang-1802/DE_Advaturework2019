{{ config(materialized='view', tags=['staging']) }}

SELECT
    CaProductID,
    TRIM(CaProductName) AS CategoryProductName
FROM {{ source('stagging', 'Stg_Dim_Cat_Product') }}
WHERE CaProductID IS NOT NULL