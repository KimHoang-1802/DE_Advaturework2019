{{
    config(
        materialized='table',
        schema='dw',
        alias='DIM_Territory',
        tags=['marts', 'dimension']
    )
}}

SELECT
    TerritoryID,
    TerritoryName,
    CountryRegionCode,
    GroupName,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM {{ ref('int_territory_cleaned') }}
