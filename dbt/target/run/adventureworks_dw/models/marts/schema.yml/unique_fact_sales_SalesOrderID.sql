
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_44c2504bb8d29fc9bb7c9622b5a036b0_16033]
   as 
    
    
    

select
    SalesOrderID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."FACT_Sales"
where SalesOrderID is not null
group by SalesOrderID
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
    [stagging].[testview_44c2504bb8d29fc9bb7c9622b5a036b0_16033]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_44c2504bb8d29fc9bb7c9622b5a036b0_16033]
  ;')