
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_6c8ebb0f57c1035ad38a4abe38ea05ec_8950]
   as 
    
    
    



select SalesOrderID
from "AdventureWorks2019"."stagging_dw"."FACT_Sales"
where SalesOrderID is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_6c8ebb0f57c1035ad38a4abe38ea05ec_8950]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_6c8ebb0f57c1035ad38a4abe38ea05ec_8950]
  ;')