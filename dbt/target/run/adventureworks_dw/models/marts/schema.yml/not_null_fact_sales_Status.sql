
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_c4720ba30968f26e8e4c16e373de6ded_11208]
   as 
    
    
    



select Status
from "AdventureWorks2019"."stagging_dw"."FACT_Sales"
where Status is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_c4720ba30968f26e8e4c16e373de6ded_11208]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_c4720ba30968f26e8e4c16e373de6ded_11208]
  ;')