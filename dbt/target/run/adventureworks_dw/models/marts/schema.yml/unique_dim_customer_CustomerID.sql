
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_b4c36ce8842100043f7f1503c878c1aa_10645]
   as 
    
    
    

select
    CustomerID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_Customer"
where CustomerID is not null
group by CustomerID
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
    [stagging].[testview_b4c36ce8842100043f7f1503c878c1aa_10645]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_b4c36ce8842100043f7f1503c878c1aa_10645]
  ;')