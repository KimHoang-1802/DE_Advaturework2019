USE [AdventureWorks2019];
    
    

    

    
    USE [AdventureWorks2019];
    EXEC('
        create view "stagging_stagging"."stg_dim_cat_product__dbt_tmp" as 

SELECT
    CaProductID,
    TRIM(CaProductName) AS CategoryProductName
FROM "AdventureWorks2019"."stagging"."Stg_Dim_Cat_Product"
WHERE CaProductID IS NOT NULL;
    ')

