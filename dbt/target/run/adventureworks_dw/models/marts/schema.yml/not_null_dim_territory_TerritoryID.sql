
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_d056de2d13df4fd7542c4416f7b30fee_7102]
   as 
    
    
    



select TerritoryID
from "AdventureWorks2019"."stagging_dw"."DIM_Territory"
where TerritoryID is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_d056de2d13df4fd7542c4416f7b30fee_7102]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_d056de2d13df4fd7542c4416f7b30fee_7102]
  ;')