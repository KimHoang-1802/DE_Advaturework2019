USE [AdventureWorks2019];
    
    

    

    
    USE [AdventureWorks2019];
    EXEC('
        create view "stagging_stagging"."stg_dim_store__dbt_tmp" as 

SELECT
    StoreId,
    TRIM(StoreName) AS StoreName,
    TerritoryID
FROM "AdventureWorks2019"."stagging"."Stg_Dim_Store"
WHERE StoreId IS NOT NULL;
    ')

