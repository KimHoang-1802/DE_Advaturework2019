
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_4a12d9574cc23a5175dca5685c0d0cfb_14620]
   as 
    
    
    

select
    CategoryProductID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_Category_Product"
where CategoryProductID is not null
group by CategoryProductID
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
    [stagging].[testview_4a12d9574cc23a5175dca5685c0d0cfb_14620]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_4a12d9574cc23a5175dca5685c0d0cfb_14620]
  ;')