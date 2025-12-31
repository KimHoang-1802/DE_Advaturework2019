

SELECT
    TerritoryID,
    TRIM(TerritoryName) AS TerritoryName,
    TRIM(ContryRegionCode) AS CountryRegionCode,
    TRIM(GroupName) AS GroupName
FROM "AdventureWorks2019"."stagging"."Stg_Dim_Territory"
WHERE TerritoryID IS NOT NULL