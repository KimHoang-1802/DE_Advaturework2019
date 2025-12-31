

SELECT
    CaProductID,
    SubCatProductID,
    TRIM(SubCatProductName) AS SubCatProductName
FROM "AdventureWorks2019"."stagging"."Stg_Dim_Sub_Category_Product"
WHERE SubCatProductID IS NOT NULL