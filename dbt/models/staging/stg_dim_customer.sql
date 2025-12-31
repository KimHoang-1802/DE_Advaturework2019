{{ config(materialized='view', tags=['staging']) }}

SELECT
    CustomerID,
    TRIM(CustomerName) AS CustomerName,
    StoreID,
    TerritoryID,
    TRIM(TerritoryName) AS TerritoryName
FROM {{ source('stagging', 'Stg_Dim_Customer') }}
WHERE CustomerID IS NOT NULL