
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_97550123076a0100a63c92dd27830876_1975]
   as 
    
    
    



select EmployeeID
from "AdventureWorks2019"."stagging_dw"."DIM_Employee"
where EmployeeID is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_97550123076a0100a63c92dd27830876_1975]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_97550123076a0100a63c92dd27830876_1975]
  ;')