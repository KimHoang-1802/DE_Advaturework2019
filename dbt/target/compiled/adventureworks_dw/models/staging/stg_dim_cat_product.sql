

SELECT
    CaProductID,
    TRIM(CaProductName) AS CategoryProductName
FROM "AdventureWorks2019"."stagging"."Stg_Dim_Cat_Product"
WHERE CaProductID IS NOT NULL