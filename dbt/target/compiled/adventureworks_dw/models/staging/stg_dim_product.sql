

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
WHERE ProductID IS NOT NULL