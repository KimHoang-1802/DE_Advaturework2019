
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_4e66972a7862cf666df63605943581a8_8184]
   as 
    
    
    



select ProductID
from "AdventureWorks2019"."stagging_dw"."FACT_Sales"
where ProductID is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_4e66972a7862cf666df63605943581a8_8184]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_4e66972a7862cf666df63605943581a8_8184]
  ;')