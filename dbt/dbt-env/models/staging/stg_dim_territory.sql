{{ config (
    materialized = 'view'
    schema = 'stagging'
)}}

select 
    TerritoryID as territory_id,
    TerritoryName as territory_name,
    