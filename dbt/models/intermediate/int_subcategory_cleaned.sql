{{ config(materialized='ephemeral', tags=['intermediate']) }}

SELECT * FROM {{ ref('stg_dim_sub_category_product') }}