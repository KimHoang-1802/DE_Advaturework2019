
  
    USE [AdventureWorks2019];
    USE [AdventureWorks2019];
    
    

    

    
    USE [AdventureWorks2019];
    EXEC('
        create view "stagging_dw"."DIM_Product__dbt_tmp__dbt_tmp_vw" as 

with __dbt__cte__int_product_cleaned as (


SELECT
    ProductID,
    ProductName,
    ProductNumber,
    COALESCE(NULLIF(TRIM(Color), ''''), ''0'') AS Color,  -- NULL or empty → ''0''
    COALESCE(NULLIF(TRIM(Size), ''''), ''0'') AS Size,    -- NULL or empty → ''0''
    COALESCE(NULLIF(TRIM(Style), ''''), ''0'') AS Style,  -- NULL or empty → ''0''
    COALESCE(SubCatProductID, 0) AS SubCatProductID,  -- NULL → 0
    COALESCE(MakeFlag, 0) AS MakeFlag                 -- NULL → 0
FROM "AdventureWorks2019"."stagging_stagging"."stg_dim_product"
) SELECT
    ProductID,
    ProductName,
    ProductNumber,
    Color,  -- Already cleaned to ''0'' if NULL
    Size,   -- Already cleaned to ''0'' if NULL
    Style,  -- Already cleaned to ''0'' if NULL
    SubCatProductID AS SubCategoryProductID,
    MakeFlag,
    GETDATE() AS LoadDate,
    GETDATE() AS UpdateDate
FROM __dbt__cte__int_product_cleaned;
    ')

EXEC('
            SELECT * INTO "AdventureWorks2019"."stagging_dw"."DIM_Product__dbt_tmp" FROM "AdventureWorks2019"."stagging_dw"."DIM_Product__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS stagging_dw.DIM_Product__dbt_tmp__dbt_tmp_vw')



    
    use [AdventureWorks2019];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'stagging_dw_DIM_Product__dbt_tmp_cci'
        AND object_id=object_id('stagging_dw_DIM_Product__dbt_tmp')
    )
    DROP index "stagging_dw"."DIM_Product__dbt_tmp".stagging_dw_DIM_Product__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX stagging_dw_DIM_Product__dbt_tmp_cci
    ON "stagging_dw"."DIM_Product__dbt_tmp"

   


  