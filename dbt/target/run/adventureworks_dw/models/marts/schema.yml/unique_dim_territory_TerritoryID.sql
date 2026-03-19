
    -- Create target schema if it does not
  USE [AdventureWorks2019];
  IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'stagging')
  BEGIN
    EXEC('CREATE SCHEMA [stagging]')
  END

  

  
  EXEC('create view 
    [stagging].[testview_98cbf00cf871cb5f62a732e944191b95_2168]
   as 
    
    
    

select
    TerritoryID as unique_field,
    count(*) as n_records

from "AdventureWorks2019"."stagging_dw"."DIM_Territory"
where TerritoryID is not null
group by TerritoryID
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
    [stagging].[testview_98cbf00cf871cb5f62a732e944191b95_2168]
  
  ) dbt_internal_test;

  EXEC('drop view 
    [stagging].[testview_98cbf00cf871cb5f62a732e944191b95_2168]
  ;')