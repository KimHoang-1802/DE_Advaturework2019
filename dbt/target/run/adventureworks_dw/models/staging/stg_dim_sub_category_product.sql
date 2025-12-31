USE [AdventureWorks2019];
    
    

    

    
    USE [AdventureWorks2019];
    EXEC('
        create view "stagging_stagging"."stg_dim_sub_category_product__dbt_tmp" as 

SELECT
    CaProductID,
    SubCatProductID,
    TRIM(SubCatProductName) AS SubCatProductName
FROM "AdventureWorks2019"."stagging"."Stg_Dim_Sub_Category_Product"
WHERE SubCatProductID IS NOT NULL;
    ')

