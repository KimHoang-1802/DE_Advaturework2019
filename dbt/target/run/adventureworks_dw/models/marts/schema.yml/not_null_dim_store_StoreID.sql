
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_cf3dc5fb134fbc6a95379f753c215066_10066]
   as 
    
    
    



select StoreID
from "AdventureWorks2019"."stagging_dw"."DIM_Store"
where StoreID is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_cf3dc5fb134fbc6a95379f753c215066_10066]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_cf3dc5fb134fbc6a95379f753c215066_10066]
  ;')