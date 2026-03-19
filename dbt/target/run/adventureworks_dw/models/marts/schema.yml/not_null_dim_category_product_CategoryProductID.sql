
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_5801b1315d39c4b6ea9e4474168c781c_13693]
   as 
    
    
    



select CategoryProductID
from "AdventureWorks2019"."stagging_dw"."DIM_Category_Product"
where CategoryProductID is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_5801b1315d39c4b6ea9e4474168c781c_13693]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_5801b1315d39c4b6ea9e4474168c781c_13693]
  ;')