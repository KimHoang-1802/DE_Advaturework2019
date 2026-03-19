
  
    USE [AdventureWorks2019];
    USE [AdventureWorks2019];
    
    

    

    
    USE [AdventureWorks2019];
    EXEC('
        create view "stagging_intermediate"."int_product_cleaned__dbt_tmp__dbt_tmp_vw" as 

SELECT
    ProductID,
    ProductName,
    ProductNumber,
    COALESCE(NULLIF(TRIM(Color), ''''), ''0'') AS Color,  -- NULL or empty → ''0''
    COALESCE(NULLIF(TRIM(Size), ''''), ''0'') AS Size,    -- NULL or empty → ''0''
    COALESCE(NULLIF(TRIM(Style), ''''), ''0'') AS Style,  -- NULL or empty → ''0''
    COALESCE(SubCatProductID, 0) AS SubCatProductID,  -- NULL → 0
    COALESCE(MakeFlag, 0) AS MakeFlag                 -- NULL → 0
FROM "AdventureWorks2019"."stagging_stagging"."stg_dim_product";
    ')

EXEC('
            SELECT * INTO "AdventureWorks2019"."stagging_intermediate"."int_product_cleaned__dbt_tmp" FROM "AdventureWorks2019"."stagging_intermediate"."int_product_cleaned__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS stagging_intermediate.int_product_cleaned__dbt_tmp__dbt_tmp_vw')



    
    use [AdventureWorks2019];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'stagging_intermediate_int_product_cleaned__dbt_tmp_cci'
        AND object_id=object_id('stagging_intermediate_int_product_cleaned__dbt_tmp')
    )
    DROP index "stagging_intermediate"."int_product_cleaned__dbt_tmp".stagging_intermediate_int_product_cleaned__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX stagging_intermediate_int_product_cleaned__dbt_tmp_cci
    ON "stagging_intermediate"."int_product_cleaned__dbt_tmp"

   


  