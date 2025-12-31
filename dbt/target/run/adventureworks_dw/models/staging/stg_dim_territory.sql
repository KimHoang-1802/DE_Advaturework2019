USE [AdventureWorks2019];
    
    

    

    
    USE [AdventureWorks2019];
    EXEC('
        create view "stagging_stagging"."stg_dim_territory__dbt_tmp" as 

SELECT
    TerritoryID,
    TRIM(TerritoryName) AS TerritoryName,
    TRIM(ContryRegionCode) AS CountryRegionCode,
    TRIM(GroupName) AS GroupName
FROM "AdventureWorks2019"."stagging"."Stg_Dim_Territory"
WHERE TerritoryID IS NOT NULL;
    ')

