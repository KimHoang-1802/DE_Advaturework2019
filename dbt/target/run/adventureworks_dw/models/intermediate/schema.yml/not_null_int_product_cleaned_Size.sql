
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_31b138935420ea2973c8ab8d2072023d_10362]
   as 
    
    
    



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
) select Size
from __dbt__cte__int_product_cleaned
where Size is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_31b138935420ea2973c8ab8d2072023d_10362]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_31b138935420ea2973c8ab8d2072023d_10362]
  ;')