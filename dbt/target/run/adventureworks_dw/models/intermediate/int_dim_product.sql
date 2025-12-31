
  
    USE [AdventureWorks2019];
    USE [AdventureWorks2019];
    
    

    

    
    USE [AdventureWorks2019];
    EXEC('
        create view "stagging_intermediate"."int_dim_product__dbt_tmp__dbt_tmp_vw" as -- XỬ LÝ: NULL → 0 cho các thuộc tính
-- ============================================================================


select
    p.ProductID,
    p.ProductName,
    p.ProductNumber,
    isnull(p.Color, ''0'') as Color,
    isnull(p.Size, ''0'') as Size,
    isnull(p.Style, ''0'') as Style,
    isnull(p.SubCatProductID, 0) as SubCatProductID,
    isnull(p.MakeFlag, 0) as MakeFlag
from "AdventureWorks2019"."stagging_stagging"."stg_dim_product" p
left join "AdventureWorks2019"."stagging_stagging"."stg_dim_sub_category_product" sc 
    on p.SubCatProductID = sc.SubCatProductID
left join "AdventureWorks2019"."stagging_stagging"."stg_dim_cat_product" c
    on sc.CaProductID = c.CaProductID;
    ')

EXEC('
            SELECT * INTO "AdventureWorks2019"."stagging_intermediate"."int_dim_product__dbt_tmp" FROM "AdventureWorks2019"."stagging_intermediate"."int_dim_product__dbt_tmp__dbt_tmp_vw" 
    OPTION (LABEL = ''dbt-sqlserver'');

        ')

    
    EXEC('DROP VIEW IF EXISTS stagging_intermediate.int_dim_product__dbt_tmp__dbt_tmp_vw')



    
    use [AdventureWorks2019];
    if EXISTS (
        SELECT *
        FROM sys.indexes with (nolock)
        WHERE name = 'stagging_intermediate_int_dim_product__dbt_tmp_cci'
        AND object_id=object_id('stagging_intermediate_int_dim_product__dbt_tmp')
    )
    DROP index "stagging_intermediate"."int_dim_product__dbt_tmp".stagging_intermediate_int_dim_product__dbt_tmp_cci
    CREATE CLUSTERED COLUMNSTORE INDEX stagging_intermediate_int_dim_product__dbt_tmp_cci
    ON "stagging_intermediate"."int_dim_product__dbt_tmp"

   


  