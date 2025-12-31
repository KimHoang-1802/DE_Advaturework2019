USE [AdventureWorks2019];
    
    

    

    
    USE [AdventureWorks2019];
    EXEC('
        create view "stagging_stagging"."stg_dim_product__dbt_tmp" as 

SELECT
    ProductID,
    TRIM(ProductName) AS ProductName,
    TRIM(ProductNumber) AS ProductNumber,
    Color,  
    Size,   
    Style,  
    SubCatProductID,
    MakeFlag
FROM "AdventureWorks2019"."stagging"."Stg_Dim_Product"
WHERE ProductID IS NOT NULL;
    ')

