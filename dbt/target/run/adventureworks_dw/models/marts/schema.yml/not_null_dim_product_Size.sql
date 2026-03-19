
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_0c1ab4d9e8ed4c627957932d8b2b241c_17011]
   as 
    
    
    



select Size
from "AdventureWorks2019"."stagging_dw"."DIM_Product"
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
    [stagging].[testview_0c1ab4d9e8ed4c627957932d8b2b241c_17011]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_0c1ab4d9e8ed4c627957932d8b2b241c_17011]
  ;')