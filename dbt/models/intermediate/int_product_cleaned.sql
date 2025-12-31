{{ config(materialized='ephemeral', tags=['intermediate']) }}

SELECT
    ProductID,
    ProductName,
    ProductNumber,
    COALESCE(NULLIF(TRIM(Color), ''), '0') AS Color,  -- NULL or empty → '0'
    COALESCE(NULLIF(TRIM(Size), ''), '0') AS Size,    -- NULL or empty → '0'
    COALESCE(NULLIF(TRIM(Style), ''), '0') AS Style,  -- NULL or empty → '0'
    COALESCE(SubCatProductID, 0) AS SubCatProductID,  -- NULL → 0
    COALESCE(MakeFlag, 0) AS MakeFlag                 -- NULL → 0
FROM {{ ref('stg_dim_product') }}