{{ config(materialized='view', tags=['staging']) }}

SELECT
    TerritoryID,
    TRIM(TerritoryName) AS TerritoryName,
    TRIM(ContryRegionCode) AS CountryRegionCode,
    TRIM(GroupName) AS GroupName
FROM {{ source('stagging', 'Stg_Dim_Territory') }}
WHERE TerritoryID IS NOT NULL