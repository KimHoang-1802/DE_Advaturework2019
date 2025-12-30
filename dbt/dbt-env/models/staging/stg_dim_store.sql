{{ config(
    materialized='view',
    schema='stagging'
) }}

select
    BusinessEntityID as StoreID,
    Name as StoreName,
    SalesPersonID
from {{ source('adventureworks', 'Store') }}