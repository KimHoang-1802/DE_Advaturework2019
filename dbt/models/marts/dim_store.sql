{{
    config(
        materialized='table',
        schema='dw',
        alias='DIM_Store',
        tags=['marts', 'dimension']
    )
}}

SELECT
    StoreId AS StoreID,
    StoreName,
    TerritoryID,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM {{ ref('int_store_cleaned') }}