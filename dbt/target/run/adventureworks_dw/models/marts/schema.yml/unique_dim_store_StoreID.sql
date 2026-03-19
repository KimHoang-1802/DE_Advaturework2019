
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_550b463b56cf92e1c53b9350a5f94a2b_12956]
   as 
    
    
    

select
    StoreID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_Store"
where StoreID is not null
group by StoreID
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
    [stagging].[testview_550b463b56cf92e1c53b9350a5f94a2b_12956]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_550b463b56cf92e1c53b9350a5f94a2b_12956]
  ;')