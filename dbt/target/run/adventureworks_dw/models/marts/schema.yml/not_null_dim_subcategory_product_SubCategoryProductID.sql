
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_467ee0c1ddc80350360a0d4e68a5a3ae_8566]
   as 
    
    
    



select SubCategoryProductID
from "AdventureWorks2019"."stagging_dw"."DIM_SubCategory_Product"
where SubCategoryProductID is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_467ee0c1ddc80350360a0d4e68a5a3ae_8566]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_467ee0c1ddc80350360a0d4e68a5a3ae_8566]
  ;')