
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_b9ca04cd52f1a2d477510921caf02524_13611]
   as 
    
    
    



select ProductID
from "AdventureWorks2019"."stagging_dw"."DIM_Product"
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
    [stagging].[testview_b9ca04cd52f1a2d477510921caf02524_13611]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_b9ca04cd52f1a2d477510921caf02524_13611]
  ;')