{{ config(materialized='ephemeral', tags=['intermediate']) }}

SELECT * FROM {{ ref('stg_dim_territory') }}