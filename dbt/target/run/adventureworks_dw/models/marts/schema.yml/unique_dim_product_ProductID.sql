
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_6ce6e9f7466c66f35f1c80c494814bd1_13978]
   as 
    
    
    

select
    ProductID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_Product"
where ProductID is not null
group by ProductID
having count(*) > 1



  ;')
  select
    
    count(*) as failures,
    case when count(*) != 0
      then 'true' else 'false' end as should_warn,
    case when count(*) != 0
      then 'true' else 'false' end as should_error
  from (
    select * from 
    [stagging].[testview_6ce6e9f7466c66f35f1c80c494814bd1_13978]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_6ce6e9f7466c66f35f1c80c494814bd1_13978]
  ;')