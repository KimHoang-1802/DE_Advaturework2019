{{ config(materialized='view', tags=['staging']) }}

SELECT
    StoreId,
    TRIM(StoreName) AS StoreName,
    TerritoryID
FROM {{ source('stagging', 'Stg_Dim_Store') }}
WHERE StoreId IS NOT NULL