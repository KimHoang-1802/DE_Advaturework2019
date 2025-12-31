USE [AdventureWorks2019];
    
    

    

    
    USE [AdventureWorks2019];
    EXEC('
        create view "stagging_stagging"."stg_dim_customer__dbt_tmp" as 

SELECT
    CustomerID,
    TRIM(CustomerName) AS CustomerName,
    StoreID,
    TerritoryID,
    TRIM(TerritoryName) AS TerritoryName
FROM "AdventureWorks2019"."stagging"."Stg_Dim_Customer"
WHERE CustomerID IS NOT NULL;
    ')

