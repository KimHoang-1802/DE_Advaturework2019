{{
    config(
        materialized='table',
        schema='dw',
        alias='DIM_Customer',
        tags=['marts', 'dimension']
    )
}}

SELECT
    CustomerID,
    CustomerName,
    StoreID,
    TerritoryID,
    TerritoryName,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM {{ ref('int_customer_cleaned') }}