

SELECT
    StoreId,
    TRIM(StoreName) AS StoreName,
    TerritoryID
FROM "AdventureWorks2019"."stagging"."Stg_Dim_Store"
WHERE StoreId IS NOT NULL