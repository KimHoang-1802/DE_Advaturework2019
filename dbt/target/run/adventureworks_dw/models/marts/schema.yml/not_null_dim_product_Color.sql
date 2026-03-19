
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_c932830b8cbdbc2d064bf5d4934a253c_1676]
   as 
    
    
    



select Color
from "AdventureWorks2019"."stagging_dw"."DIM_Product"
where Color is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_c932830b8cbdbc2d064bf5d4934a253c_1676]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_c932830b8cbdbc2d064bf5d4934a253c_1676]
  ;')