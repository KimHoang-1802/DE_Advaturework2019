{{ config(
    materialized='view',
    schema='stagging'
) }}

select
    TerritoryID,
    Name as TerritoryName,
    CountryRegionCode,
    [Group] as GroupName
from {{ source('adventureworks', 'SalesTerritory') }}
