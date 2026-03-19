
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_1acec90006df3760b58f3ce064175abb_5276]
   as 
    
    
    



select CustomerID
from "AdventureWorks2019"."stagging_dw"."DIM_Customer"
where CustomerID is null



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_1acec90006df3760b58f3ce064175abb_5276]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_1acec90006df3760b58f3ce064175abb_5276]
  ;')